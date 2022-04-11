//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Furkan Gençoğulları on 8.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let background = UIImageView()
    
    let titleLabel = UILabel()
    let titleShadow = UIView (frame: CGRect(x: 0, y: 0, width: 1, height: 1))
    
    let cadTextLabel = UILabel()
    let eurTextLabel = UILabel()
    let jpyTextLabel = UILabel()
    let gbpTextLabel = UILabel()
    let chfTextLabel = UILabel()
    let tryTextLabel = UILabel()
    
    let cadValueLabel = UILabel()
    let eurValueLabel = UILabel()
    let jpyValueLabel = UILabel()
    let gbpValueLabel = UILabel()
    let chfValueLabel = UILabel()
    let tryValueLabel = UILabel()
        
    let getRatesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        
        background.image = UIImage(named: "dark-background")
        background.frame = view.bounds
        background.contentMode = .scaleAspectFill
        view.addSubview(background)
        
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = CGRect(x: widht * 0.5 - widht * 0.4, y: height * 0.5 - height * 0.3, width: widht * 0.8, height: height * 0.60)
        visualEffectView.layer.cornerRadius = 30
        visualEffectView.layer.masksToBounds = true
        view.addSubview(visualEffectView)
        
        
        
        titleLabel.text = "How Much is One Dolar?"
        titleLabel.frame = CGRect(x: widht * 0.5 - widht * 0.3, y: height * 0.1, width: widht * 0.6, height: height * 0.05)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "PingFang HK Semibold", size: 20)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        
        
        titleShadow.clipsToBounds = false
        titleShadow.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        titleShadow.layer.shadowOpacity = 0.5
        titleShadow.layer.shadowOffset = CGSize.zero
        titleShadow.layer.shadowRadius = 17
        titleShadow.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: widht * 0.5 - widht * 0.3, y: height * 0.1, width: widht * 0.6, height: height * 0.05) , cornerRadius: 20).cgPath
        
        view.addSubview(titleShadow)
        view.addSubview(titleLabel)
        
        
        
        cadTextLabel.frame = CGRect(x: widht * 0.2, y: height * 0.15, width: widht * 0.2, height: height * 0.2)
        cadTextLabel.text = "CAD:"
        
        eurTextLabel.frame = CGRect(x: widht * 0.2, y: height * 0.25, width: widht * 0.2, height: height * 0.2)
        eurTextLabel.text = "EUR:"
        
        jpyTextLabel.frame = CGRect(x: widht * 0.2, y: height * 0.35, width: widht * 0.2, height: height * 0.2)
        jpyTextLabel.text = "JPY:"
        
        gbpTextLabel.frame = CGRect(x: widht * 0.2, y: height * 0.45, width: widht * 0.2, height: height * 0.2)
        gbpTextLabel.text = "GBP:"
        
        chfTextLabel.frame = CGRect(x: widht * 0.2, y: height * 0.55, width: widht * 0.2, height: height * 0.2)
        chfTextLabel.text = "CHF:"
        
        tryTextLabel.frame = CGRect(x: widht * 0.2, y: height * 0.65, width: widht * 0.2, height: height * 0.2)
        tryTextLabel.text = "TRY:"
        
        
        cadValueLabel.frame = CGRect(x: widht * 0.5, y: height * 0.15, width: widht * 0.3, height: height * 0.2)
        eurValueLabel.frame = CGRect(x: widht * 0.5, y: height * 0.25, width: widht * 0.3, height: height * 0.2)
        jpyValueLabel.frame = CGRect(x: widht * 0.5, y: height * 0.35, width: widht * 0.3, height: height * 0.2)
        gbpValueLabel.frame = CGRect(x: widht * 0.5, y: height * 0.45, width: widht * 0.3, height: height * 0.2)
        chfValueLabel.frame = CGRect(x: widht * 0.5, y: height * 0.55, width: widht * 0.3, height: height * 0.2)
        tryValueLabel.frame = CGRect(x: widht * 0.5, y: height * 0.65, width: widht * 0.3, height: height * 0.2)
        
        let currencyValueLabelArray = [cadValueLabel, eurValueLabel, jpyValueLabel, gbpValueLabel, chfValueLabel, tryValueLabel]
        let currencyNameLabelArray = [cadTextLabel,eurTextLabel,jpyTextLabel,gbpTextLabel,chfTextLabel,tryTextLabel]
        
        
        for currencyName in currencyNameLabelArray {
            currencyName.font = UIFont(name: "Helvetica Neue", size: 20)
            currencyName.textColor = .systemGray5
            currencyName.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
            currencyName.shadowOffset = CGSize(width: 2, height: 2)
            view.addSubview(currencyName)
        }
        for currencyRate in currencyValueLabelArray {
            currencyRate.text = "no data"
            currencyRate.textAlignment = .right
            currencyRate.font = UIFont(name: "Helvetica Neue Bold", size: 20)
            currencyRate.textColor = UIColor(red: 0.03, green: 0.73, blue: 0.96, alpha: 1.00)
            currencyRate.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
            currencyRate.shadowOffset = CGSize(width: 2, height: 2)
            view.addSubview(currencyRate)
        }
        
        
        
        getRatesButton.frame = CGRect(x: widht * 0.5 - widht * 0.15, y: height * 0.85, width: widht * 0.3, height: height * 0.05)
        getRatesButton.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 20)
        getRatesButton.setTitle("Get Rates", for: .normal)
        getRatesButton.configuration = .filled()
        getRatesButton.tintColor = UIColor(white: 0.2, alpha: 1)
        getRatesButton.addTarget(self, action: #selector(getRatesButtonPressed), for: .touchUpInside)
        view.addSubview(getRatesButton)
        
    }
    @objc func getRatesButtonPressed() {
        
        let url = URL(string: "https://api.currencyapi.com/v3/latest?apikey=kTJqwUsLxYsw76sjadAHHluM3jDPi48rZ0KUNJPK")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let alertButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(alertButton)
                self.present(alert, animated: true)
            } else {
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["data"] as? [String : Any] {
                                if let cad = rates["CAD"] as? [String : Any] {
                                    if let cadValue = cad["value"] as? Double {
                                        self.cadValueLabel.text = String(cadValue)
                                    }
                                }
                                if let eur = rates["EUR"] as? [String : Any] {
                                    if let eurValue = eur["value"] as? Double {
                                        self.eurValueLabel.text = String(eurValue)
                                    }
                                }
                                if let jpy = rates["JPY"] as? [String : Any] {
                                    if let jpyValue = jpy["value"] as? Double {
                                        self.jpyValueLabel.text = String(jpyValue)
                                    }
                                }
                                if let gbp = rates["GBP"] as? [String : Any] {
                                    if let gbpValue = gbp["value"] as? Double {
                                        self.gbpValueLabel.text = String(gbpValue)
                                    }
                                }
                                if let chf = rates["CHF"] as? [String : Any] {
                                    if let chfValue = chf["value"] as? Double {
                                        self.chfValueLabel.text = String(chfValue)
                                    }
                                }
                                if let lira = rates["TRY"] as? [String : Any] {
                                    if let liraValue = lira["value"] as? Double {
                                        self.tryValueLabel.text = String(liraValue)
                                    }
                                }
                            }
                        }
                    } catch {
                        
                    }
                }
            }
        }
        task.resume()
    }
    
}

