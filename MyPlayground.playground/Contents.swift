import UIKit
import MapKit
import PlaygroundSupport

class MainViewController: UIViewController {
    
    let firstLayer = UIView(frame: CGRect(x: 0, y: 100, width: 310, height: 550))
    let appTitle = UILabel(frame: CGRect(x: 50, y: 60, width: 200, height: 25))
    let logo:UIImage = UIImage(named: "covidToday")!
    let image:UIImage = UIImage(named: "background")!
    let logoView = UIImageView(frame: CGRect(x: 0, y: 50, width: 45, height: 45))
    
    let totalCase = UILabel(frame: CGRect(x: 10, y: 250, width: 140, height: 60))
    let newCase = UILabel(frame: CGRect(x: 155, y: 250, width: 140, height: 60))
    let totaRecovered = UILabel(frame: CGRect(x: 10, y: 290, width: 100, height: 60))
    let newRecovered = UILabel(frame: CGRect(x: 145, y: 290, width: 100, height: 60))
    let totalDeath = UILabel(frame: CGRect(x: 10, y: 330, width: 100, height: 60))
    let newDeath = UILabel(frame: CGRect(x: 145, y: 330, width: 100, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: 310, height: 640)
        
        logoView.image = logo
        
        
        appTitle.text = "COVID TODAY"
        appTitle.font = UIFont(name: "Avenir Heavy", size: 20)
        appTitle.textAlignment = .left
        
        
        firstLayer.backgroundColor = UIColor.white
        firstLayer.layer.cornerRadius = 20
        
        totalCase.text = "totalCase"
        newCase.text = "newCase"
        totaRecovered.text = "totaRecovered"
        newRecovered.text = "newRecovered"
        totalDeath.text = "totalDeath"
        newDeath.text = "newDeath"
        
        totalCase.backgroundColor = UIColor.red
        newCase.backgroundColor = UIColor.blue
        
        totalCase.font = UIFont(name: "Avenor Medium", size: 14)
        newCase.font = UIFont(name: "Avenor Medium", size: 14)
        totaRecovered.font = UIFont(name: "Avenor Medium", size: 14)
        newRecovered.font = UIFont(name: "Avenor Medium", size: 14)
        totalDeath.font = UIFont(name: "Avenor Medium", size: 14)
        newDeath.font = UIFont(name: "Avenor Medium", size: 14)
//        totalCase
//        newCase
//        totaRecovered
//        newRecovered
//        totalDeath
//        newDeath
        
        
        firstLayer.addSubview(totalCase)
        firstLayer.addSubview(newCase)
        firstLayer.addSubview(totaRecovered)
        firstLayer.addSubview(newRecovered)
        firstLayer.addSubview(totalDeath)
        firstLayer.addSubview(newDeath)
        
        view.addSubview(UIImageView(image: image))
        view.addSubview(appTitle)
        view.addSubview(logoView)
        view.addSubview(firstLayer)
    }
    
}
let vc = MainViewController()
PlaygroundPage.current.liveView = vc
