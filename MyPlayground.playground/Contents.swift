
import UIKit
import MapKit
import PlaygroundSupport

public class MainViewController: UIViewController {
    
    var fTotalDeaths:[Double] = [0.0]
    var fNewConfirmed:[Double] = [0.0]
    var fTotalConfirmed:[Double] = [0.0]
    var fNewDeath:[Double] = [0.0]
    var fNewRecovered:[Double] = [1.0]
    var fTotalRecovered:[Double] = [0.0]
    var fDate:[String] = [""]
    
    let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 155, height: 630))
    let view2 = UIView(frame: CGRect(x: 155, y: 0, width: 155, height: 630))
    let firstLayer = UIView(frame: CGRect(x: 0, y: 100, width: 310, height: 550))
    let appTitle = UILabel(frame: CGRect(x: 50, y: 60, width: 200, height: 25))
    let logo:UIImage = UIImage(named: "covidToday")!
    let logoView = UIImageView(frame: CGRect(x: 0, y: 50, width: 45, height: 45))
    let currentOutbreakLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 20))
    let worldWideLbl = UILabel(frame: CGRect(x: 10, y: 30, width: 150, height: 20))
    let map = MKMapView()
    let reloadButton = UIButton(frame: CGRect(x: 260, y: 15, width: 30, height: 30))
    
    let totalCase = UILabel(frame: CGRect(x: 10, y: 250, width: 135, height: 60))
    let newCase = UILabel(frame: CGRect(x: 165, y: 250, width: 135, height: 60))
    let totaRecovered = UILabel(frame: CGRect(x: 10, y: 320, width: 135, height: 60))
    let newRecovered = UILabel(frame: CGRect(x: 165, y: 320, width: 135, height: 60))
    let totalDeath = UILabel(frame: CGRect(x: 10, y: 390, width: 135, height: 60))
    let newDeath = UILabel(frame: CGRect(x: 165, y: 390, width: 135, height: 60))
    
    let totalCaseCount = UILabel(frame: CGRect(x: 10, y: 290, width: 135, height: 20))
    let newCaseCount = UILabel(frame: CGRect(x: 165, y: 290, width: 135, height: 20))
    let totaRecoveredCount = UILabel(frame: CGRect(x: 10, y: 360, width: 135, height: 20))
    let newRecoveredCount = UILabel(frame: CGRect(x: 165, y: 360, width: 135, height: 20))
    let totalDeathCount = UILabel(frame: CGRect(x: 10, y: 430, width: 135, height: 20))
    let newDeathCount = UILabel(frame: CGRect(x: 165, y: 430, width: 135, height: 20))
    let liveUpdatesLabel = UILabel(frame: CGRect(x: 10, y: 220, width: 180, height: 20))
    let timeLabel = UILabel(frame: CGRect(x: 145, y: 220, width: 180, height: 20))
    
    let btnView = UIView(frame: CGRect(x: 10, y: 470, width: 290, height: 40))
    let profileBtn = UIButton(frame: CGRect(x: 30, y: 0, width: 40, height: 40))
    let diagnoseBtn = UIButton(frame: CGRect(x: 90, y: 0, width: 40, height: 40))
    let helpBtn = UIButton(frame: CGRect(x: 160, y: 0, width: 40, height: 40))
    let hospialBtn = UIButton(frame: CGRect(x: 220, y: 0, width: 40, height: 40))
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- Make change here!!!
       // get()
        
        view.frame = CGRect(x: 0, y: 0, width: 310, height: 630)
        view1.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.4666666667, blue: 0.1098039216, alpha: 1)
        view2.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.5803921569, blue: 0.137254902, alpha: 1)
        logoView.image = logo
        
        currentOutbreakLabel.text = "CURRENT OUTBREAK"
        currentOutbreakLabel.font = UIFont(name: "Avenir Heavy", size: 17)
        worldWideLbl.text = "Worldwide 🔽"
        worldWideLbl.textColor = UIColor.blue
        worldWideLbl.font = UIFont(name: "Avenir Medium", size: 14)
        
        reloadButton.setImage(UIImage(named: "earth"), for: .normal)
        reloadButton.addTarget(self, action: #selector(reloadData), for: .touchUpInside)
        
        map.frame = CGRect(x: 10, y: 60, width: 290, height: 140)
        map.layer.cornerRadius = 20
        map.layer.borderWidth = 2
        map.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        appTitle.text = "COVID TODAY"
        appTitle.font = UIFont(name: "Avenir Heavy", size: 20)
        appTitle.textAlignment = .left
        
        
        firstLayer.backgroundColor = UIColor.white
        firstLayer.layer.cornerRadius = 20
        
        
        liveUpdatesLabel.text = "Live Updates"
        
        totalCase.text = "Total Case"
        newCase.text = "New Case"
        totaRecovered.text = "Total Recovered"
        newRecovered.text = "New Recovered"
        totalDeath.text = "Total Death"
        newDeath.text = "New Death"
        
        totalCaseCount.text = "00000"
        newCaseCount.text = "00000"
        totaRecoveredCount.text = "00000"
        newRecoveredCount.text = "00000"
        totalDeathCount.text = "00000"
        newDeathCount.text = "00000"
        
        updateLabelUI(totalCase, 10, .clear, "Avenir Medium", 14, .blue)
        updateLabelUI(newCase, 10, .clear, "Avenir Medium", 14, .blue)
        updateLabelUI(totaRecovered, 10, .clear, "Avenir Medium", 14, .red)
        updateLabelUI(newRecovered, 10, .clear, "Avenir Medium", 14, .red)
        updateLabelUI(totalDeath, 10, .clear, "Avenir Medium", 14, #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
        updateLabelUI(newDeath, 10, .clear, "Avenir Medium", 14, #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
        
        updateLabelUI(totalCaseCount, 0, .clear, "Avenir Medium", 10, .black)
        updateLabelUI(newCaseCount, 0, .clear, "Avenir Medium", 10, .black)
        updateLabelUI(totaRecoveredCount, 0, .clear, "Avenir Medium", 10, .black)
        updateLabelUI(newRecoveredCount, 0, .clear, "Avenir Medium", 10, .black)
        updateLabelUI(totalDeathCount, 0, .clear, "Avenir Medium", 10, .black)
        updateLabelUI(newDeathCount, 0, .clear, "Avenir Medium", 10, .black)
        updateLabelUI(timeLabel, 0, .clear, "Avenir Medium", 14, .blue)
        
        totalCase.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        newCase.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        totaRecovered.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        newRecovered.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        totalDeath.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        newDeath.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        totalCase.layer.borderWidth = 0.5
        newCase.layer.borderWidth = 0.5
        totaRecovered.layer.borderWidth = 0.5
        newRecovered.layer.borderWidth = 0.5
        totalDeath.layer.borderWidth = 0.5
        newDeath.layer.borderWidth = 0.5
        
        btnView.backgroundColor = #colorLiteral(red: 0.8882376552, green: 0.4656057954, blue: 0.1111704931, alpha: 1)
        btnView.layer.cornerRadius = 20
        
        buttobnUI(profileBtn, "person")
        buttobnUI(diagnoseBtn, "staroflife")
        buttobnUI(helpBtn, "questionmark.circle")
        buttobnUI(hospialBtn, "cross")
        
        diagnoseBtn.addTarget(self, action: #selector(openDiagnoseSection), for: .touchUpInside)
        
        firstLayer.addSubview(map)
        firstLayer.addSubview(liveUpdatesLabel)
        firstLayer.addSubview(btnView)
        firstLayer.addSubview(currentOutbreakLabel)
        firstLayer.addSubview(worldWideLbl)
        firstLayer.addSubview(reloadButton)
        firstLayer.addSubview(timeLabel)
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(appTitle)
        view.addSubview(logoView)
        view.addSubview(firstLayer)
    }
    
    func updateLabelUI(_ labels:UILabel,_ radius: CGFloat,_ color: UIColor,_ name: String,_ size: CGFloat,_ textColor: UIColor) {
        labels.layer.cornerRadius = radius
        labels.backgroundColor = color
        labels.clipsToBounds = true
        labels.textColor = textColor
        labels.textAlignment = .center
        labels.font = UIFont(name: name, size: size)
        firstLayer.addSubview(labels)
    }
    
    func buttobnUI(_ button: UIButton,_ image: String) {
        button.setImage(UIImage(systemName: image, withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
        button.tintColor = UIColor.white
        
        btnView.addSubview(button)
    }
    
    @objc func reloadData() {
        self.get()
        print("pressed")
    }
    
    @objc func openDiagnoseSection() {
        self.present(DiagnoseViewController(), animated: true, completion: nil)
    }
    
}


extension MainViewController {
    func get(){
        let request = URLRequest(url: URL(string: "https://api.covid19api.com/summary")!,timeoutInterval: Double.infinity)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            if let response = response as? HTTPURLResponse{
                guard (200 ... 299) ~= response.statusCode else {
                    print("Status code :- \(response.statusCode)")
                    
                    if response.statusCode == 400 {
                        DispatchQueue.main.async {
                            print("error with server")
                        }
                    }else if response.statusCode == 401{
                        DispatchQueue.main.async {
                            print("error with server")
                        }
                    }else if response.statusCode == 403{
                        DispatchQueue.main.async {
                            print("error with server")
                        }
                        
                    }else if response.statusCode == 503{
                        DispatchQueue.main.async {
                            print("error with server")
                        }
                    }
                    return
                }
            }
            
            self.fTotalRecovered.removeAll()
            self.fTotalConfirmed.removeAll()
            self.fTotalDeaths.removeAll()
            self.fNewDeath.removeAll()
            self.fNewRecovered.removeAll()
            self.fNewConfirmed.removeAll()
            self.fDate.removeAll()
            
            do{
                if error == nil{
                    let result = try JSONDecoder().decode(coronaData.self, from: data)
                    
                    self.fNewConfirmed.append(result.Global.NewConfirmed)
                    self.fNewRecovered.append(result.Global.NewRecovered)
                    self.fNewDeath.append(result.Global.NewDeaths)
                    self.fTotalDeaths.append(result.Global.TotalDeaths)
                    self.fTotalConfirmed.append(result.Global.TotalConfirmed)
                    self.fTotalRecovered.append(result.Global.TotalRecovered)
                    self.fDate.append(result.Date)
                    
                    print("data added")
                    
                }
                
                DispatchQueue.main.async {
                    self.updateStats()
                }
                
            }catch{
                print("Error found")
            }
        }
        task.resume()
        
    }
    
    func updateStats(){
        totaRecoveredCount.text = "\(Int(fTotalRecovered[0]))"
        totalDeathCount.text = "\(Int(fTotalDeaths[0]))"
        totalCaseCount.text = "\(Int(fTotalConfirmed[0]))"
        newRecoveredCount.text = "\(Int(fNewRecovered[0]))"
        newDeathCount.text = "\(Int(fNewDeath[0]))"
        newCaseCount.text = "\(Int(fNewConfirmed[0]))"
        timeLabel.text = "\(fDate[0])"
    }
    
}

let vc = MainViewController()
PlaygroundPage.current.liveView = vc
