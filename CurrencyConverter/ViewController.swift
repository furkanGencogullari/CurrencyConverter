//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Furkan Gençoğulları on 8.04.2022.
//

import UIKit

class ViewController: UIViewController {
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        let background = UIImageView ()
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
        
        
        let titleLabel = UILabel ()
        titleLabel.text = "How Much is One Euro?"
        titleLabel.frame = CGRect(x: widht * 0.5 - widht * 0.3, y: height * 0.1, width: widht * 0.6, height: height * 0.05)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "PingFang HK Semibold", size: 20)
        
        
        let titleShadow = UIView (frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        titleShadow.clipsToBounds = false
        titleShadow.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        titleShadow.layer.shadowOpacity = 0.5
        titleShadow.layer.shadowOffset = CGSize.zero
        titleShadow.layer.shadowRadius = 17
        titleShadow.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: widht * 0.5 - widht * 0.3, y: height * 0.1, width: widht * 0.6, height: height * 0.05) , cornerRadius: 20).cgPath
        
        view.addSubview(titleShadow)
        view.addSubview(titleLabel)
        
        
        let cadTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.15, width: widht * 0.2, height: height * 0.2))
        cadTextLabel.text = "CAD:"
        let usdTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.25, width: widht * 0.2, height: height * 0.2))
        usdTextLabel.text = "USD:"
        let jpyTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.35, width: widht * 0.2, height: height * 0.2))
        jpyTextLabel.text = "JPY:"
        let gbpTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.45, width: widht * 0.2, height: height * 0.2))
        gbpTextLabel.text = "GBP:"
        let chfTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.55, width: widht * 0.2, height: height * 0.2))
        chfTextLabel.text = "CHF:"
        let tryTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.65, width: widht * 0.2, height: height * 0.2))
        tryTextLabel.text = "TRY:"
        
        
        let cadValueLabel = UILabel(frame: CGRect(x: widht * 0.5, y: height * 0.15, width: widht * 0.3, height: height * 0.2))
        let usdValueLabel = UILabel(frame: CGRect(x: widht * 0.5, y: height * 0.25, width: widht * 0.3, height: height * 0.2))
        let jpyValueLabel = UILabel(frame: CGRect(x: widht * 0.5, y: height * 0.35, width: widht * 0.3, height: height * 0.2))
        let gbpValueLabel = UILabel(frame: CGRect(x: widht * 0.5, y: height * 0.45, width: widht * 0.3, height: height * 0.2))
        let chfValueLabel = UILabel(frame: CGRect(x: widht * 0.5, y: height * 0.55, width: widht * 0.3, height: height * 0.2))
        let tryValueLabel = UILabel(frame: CGRect(x: widht * 0.5, y: height * 0.65, width: widht * 0.3, height: height * 0.2))
        
        let currencyRateLabelArray = [cadValueLabel, usdValueLabel, jpyValueLabel, gbpValueLabel, chfValueLabel, tryValueLabel]
        let currencyNameLabelArray = [cadTextLabel,usdTextLabel,jpyTextLabel,gbpTextLabel,chfTextLabel,tryTextLabel]
        
        for currencyName in currencyNameLabelArray {
            currencyName.font = UIFont(name: "Helvetica Neue", size: 20)
            currencyName.textColor = .systemGray5
            currencyName.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
            currencyName.shadowOffset = CGSize(width: 2, height: 2)
            view.addSubview(currencyName)
        }
        
        for currencyRate in currencyRateLabelArray {
            currencyRate.text = "2,2534"
            currencyRate.textAlignment = .right
            currencyRate.font = UIFont(name: "Helvetica Neue Bold", size: 20)
            currencyRate.textColor = UIColor(red: 0, green: 255, blue: 255, alpha: 1)
            currencyRate.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
            currencyRate.shadowOffset = CGSize(width: 2, height: 2)
            view.addSubview(currencyRate)
        }
        
        
        let getRatesButton = UIButton()
        getRatesButton.frame = CGRect(x: widht * 0.5 - widht * 0.15, y: height * 0.85, width: widht * 0.3, height: height * 0.05)
        getRatesButton.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 20)
        getRatesButton.setTitle("Get Rates", for: .normal)
        getRatesButton.configuration = .filled()
        getRatesButton.tintColor = UIColor(white: 0.2, alpha: 1)
        view.addSubview(getRatesButton)
        
    }
    
    
    @objc func getRatesButtonPressed(_ sender: Any) {
        
        let url = URL(string: "https://api.currencyapi.com/v3/latest?apikey=kTJqwUsLxYsw76sjadAHHluM3jDPi48rZ0KUNJPK")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            
        }
        
        
        
        
        
        
    }
    
}

