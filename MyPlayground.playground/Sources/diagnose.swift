import UIKit
import CoreML


public class DiagnoseViewController: UIViewController {
    
    let covidDetector = COVIDDetector()
    
    let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 155, height: 600))
    let view2 = UIView(frame: CGRect(x: 155, y: 0, width: 155, height: 600))
    let firstLayer = UIView(frame: CGRect(x: 10, y: 30, width: 290, height: 540))
    let closeBtn = UIButton(frame: CGRect(x: 260, y: 10, width: 20, height: 20))
    let headingLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 180, height: 30))
    let subLabel = UILabel(frame: CGRect(x: 10, y: 40, width: 180, height: 20))
    let inputImageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 250, height: 200))
    let tapGesture = UITapGestureRecognizer()
    let addExImageBtn = UIButton(frame: CGRect(x: 10, y: 330, width: 270, height: 30))
    
    let submitBtn = UIButton(frame: CGRect(x: 95, y: 440, width: 100, height: 40))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.4666666667, blue: 0.1098039216, alpha: 1)
        view2.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.5803921569, blue: 0.137254902, alpha: 1)
        
        firstLayer.backgroundColor = UIColor.white
        firstLayer.layer.cornerRadius = 20
        
        headingLabel.text = "COVID19"
        subLabel.text = "CORONAVIRUS DISEASE"
        headingLabel.font = UIFont(name: "Avenir Heavy", size: 18)
        subLabel.font = UIFont(name: "Avenir Medium", size: 14)
        
        tapGesture.addTarget(self, action: #selector(setupImageSelection))
        inputImageView.isUserInteractionEnabled = true
        inputImageView.image = UIImage(named: "addImage")
        inputImageView.addGestureRecognizer(tapGesture)
        
        addExImageBtn.setTitle("Add Preloaded Image", for: .normal)
        addExImageBtn.titleLabel?.font = UIFont(name: "Avenir Medium", size: 17)
        addExImageBtn.layer.cornerRadius = 10
        addExImageBtn.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.5803921569, blue: 0.137254902, alpha: 1)
        addExImageBtn.clipsToBounds = true
        addExImageBtn.addTarget(self, action: #selector(addDummyImage), for: .touchUpInside)
        
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.titleLabel?.font = UIFont(name: "Avenir Medium", size: 17)
        submitBtn.layer.cornerRadius = 10
        submitBtn.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.4666666667, blue: 0.1098039216, alpha: 1)
        submitBtn.clipsToBounds = true
        submitBtn.addTarget(self, action: #selector(imageClassifier), for: .touchUpInside)
        
        closeBtn.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeBtn.tintColor = UIColor.black
        closeBtn.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
        
        firstLayer.addSubview(closeBtn)
        firstLayer.addSubview(headingLabel)
        firstLayer.addSubview(subLabel)
        firstLayer.addSubview(inputImageView)
        firstLayer.addSubview(addExImageBtn)
        firstLayer.addSubview(submitBtn)
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(firstLayer)
        
    }
    
    @objc func closeVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addDummyImage() {
        self.inputImageView.image = UIImage(named: "xray")
    }
}


extension DiagnoseViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.inputImageView.image = image
//       self.imagelabel.isHidden = true
    }
    
    @objc func setupImageSelection(){
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        
    }
    
}

extension DiagnoseViewController {
    
    @objc func imageClassifier(){
        
        var inputImage = [COVIDDetectorInput]()
        
        if let image = inputImageView.image{
           let newImage =  buffer(from: inputImageView.image!)
            let imageForClassification = COVIDDetectorInput(image: newImage!)
            inputImage.append(imageForClassification)
        }
        do {
            let prediction = try self.covidDetector.predictions(inputs: inputImage)
            
            for result in prediction{
                let res = result.classLabel
                
                if res == "NORMAL"{
                    self.present(negativeVC(), animated: true, completion: nil)
                }
                else if res == "COVID"{
                    self.present(positiveVC(), animated: true, completion: nil)
                }
                else{
                    
                }
            }
            
        }catch{
            print("error found\(error)")
        }
    }
}

//MARK:- To convert uiimage to cvpixelbuffer

extension DiagnoseViewController{
    func buffer(from image: UIImage) -> CVPixelBuffer? {
      let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
      var pixelBuffer : CVPixelBuffer?
      let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
      guard (status == kCVReturnSuccess) else {
        return nil
      }

      CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
      let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

      let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
      let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

      context?.translateBy(x: 0, y: image.size.height)
      context?.scaleBy(x: 1.0, y: -1.0)

      UIGraphicsPushContext(context!)
      image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
      UIGraphicsPopContext()
      CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

      return pixelBuffer
    }
}
