import Foundation

import UIKit

public class helpViewController: UIViewController {
    
    let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 155, height: 600))
    let view2 = UIView(frame: CGRect(x: 155, y: 0, width: 155, height: 600))
    let firstLayer = UIView(frame: CGRect(x: 10, y: 30, width: 290, height: 500))
    let headingLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 100, height: 30))
    let closeBtn = UIButton(frame: CGRect(x: 260, y: 10, width: 20, height: 20))
    
    let imageView1 = UIImageView(frame: CGRect(x: 20, y: 50, width: 240, height: 100))
    let imageView2 = UIImageView(frame: CGRect(x: 20, y: 150, width: 240, height: 100))
    let imageView3 = UIImageView(frame: CGRect(x: 20, y: 250, width: 240, height: 100))
    let imageView4 = UIImageView(frame: CGRect(x: 20, y: 350, width: 240, height: 100))
    let imageView5 = UIImageView(frame: CGRect(x: 20, y: 450, width: 240, height: 100))
    
    let tapGesture1 = UITapGestureRecognizer()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.4666666667, blue: 0.1098039216, alpha: 1)
        view2.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.5803921569, blue: 0.137254902, alpha: 1)
        
        firstLayer.backgroundColor = UIColor.white
        firstLayer.layer.cornerRadius = 20
        headingLabel.text = "Help"
        headingLabel.font = UIFont(name: "Avenir Heavy", size: 24)
        
        imageView1.image = UIImage(named: "img1")
        imageView2.image = UIImage(named: "img2")
        imageView3.image = UIImage(named: "img3")
        imageView4.image = UIImage(named: "img4")
        imageView5.image = UIImage(named: "img5")
        
        closeBtn.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeBtn.tintColor = UIColor.black
        closeBtn.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
        
        tapGesture1.addTarget(self, action: #selector(closeVC))
        imageView1.isUserInteractionEnabled = false
        imageView1.backgroundColor = UIColor.red
        imageView1.addGestureRecognizer(tapGesture1)
        
        
        firstLayer.addSubview(headingLabel)
        firstLayer.addSubview(closeBtn)
        firstLayer.addSubview(imageView1)
        firstLayer.addSubview(imageView2)
        firstLayer.addSubview(imageView3)
        firstLayer.addSubview(imageView4)
        firstLayer.addSubview(imageView5)
        
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(firstLayer)
    }
   
    @objc func closeVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func symptomsView() {
     
    }
}
