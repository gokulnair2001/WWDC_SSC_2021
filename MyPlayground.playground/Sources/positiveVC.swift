import UIKit

public class positiveVC: UIViewController {
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Positive"
        view.backgroundColor = UIColor.white
        view.addSubview(label)
    }
    
}
