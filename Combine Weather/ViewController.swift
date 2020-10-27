//
//  ViewController.swift
//  Combine Weather
//
//  Created by Vishweshwaran on 27/10/20.
//


import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField : UITextField!
    @IBOutlet weak var temperatureLabel : UILabel!
    
    private var webService = WebService()
    private var cancellable : AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpPublishers()
        
    }
    
    private func setUpPublishers(){
        
        let pub = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)
        
        self.cancellable =  pub.compactMap{
            ($0.object as! UITextField).text?
                .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
        .flatMap{ city in
            return self.webService.fetchWeather(city: city)
                .catch{_ in Just(Weather.placeholder)}
                .map{$0}
        }.sink{
            
            if let temp = $0.temp{
                
                self.temperatureLabel.text = "\(temp) ℉"
                
            }else{
                
                self.temperatureLabel.text = "Cannot Find the data"
                
            }
            
        }
        
    }
    
    
}

