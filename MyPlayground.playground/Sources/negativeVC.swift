import UIKit

public class negativeVC: UIViewController {
    
    let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 155, height: 600))
    let view2 = UIView(frame: CGRect(x: 155, y: 0, width: 155, height: 600))
    let firstLayer = UIView(frame: CGRect(x: 10, y: 30, width: 290, height: 540))
    let label = UILabel(frame: CGRect(x: 10, y: 240, width: 270, height: 50))
    let subLabel = UILabel(frame: CGRect(x: 10, y: 310, width: 270, height: 100))
    let imageView = UIImageView(frame: CGRect(x: 10 , y: 20, width: 270, height: 200))
    let closeBtn = UIButton(frame: CGRect(x: 95, y: 440, width: 100, height: 50))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.4666666667, blue: 0.1098039216, alpha: 1)
        view2.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.5803921569, blue: 0.137254902, alpha: 1)
        
        firstLayer.backgroundColor = UIColor.white
        firstLayer.layer.cornerRadius = 20
        
        imageView.image = UIImage(named: "negative")
        
        label.text = "NEGATIVE"
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Heavy", size: 20)
        subLabel.text = "Youe seem to be safe.\n Make sure you wear mask and maintain distance among people"
        subLabel.numberOfLines = .max
        subLabel.textAlignment = .center
        subLabel.font = UIFont(name: "Avenir Medium", size: 16)
        view.backgroundColor = UIColor.white
        
        closeBtn.setTitle("Ok", for: .normal)
        closeBtn.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.5803921569, blue: 0.137254902, alpha: 1)
        closeBtn.layer.cornerRadius = 20
        closeBtn.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        
        firstLayer.addSubview(imageView)
        firstLayer.addSubview(label)
        firstLayer.addSubview(subLabel)
        firstLayer.addSubview(closeBtn)
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(firstLayer)
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
}


