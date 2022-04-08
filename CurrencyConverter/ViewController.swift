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
        
        let grayArea = UIView ()
        grayArea.clipsToBounds = true
        grayArea.backgroundColor = UIColor(white: 0.2, alpha: 1)
        grayArea.frame = CGRect(x: widht * 0.5 - widht * 0.4, y: height * 0.5 - height * 0.3, width: widht * 0.8, height: height * 0.6)
        grayArea.layer.cornerRadius = 30
        
        
        let grayArea2 = UIView (frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        grayArea2.clipsToBounds = false
        
        grayArea2.layer.shadowColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        grayArea2.layer.shadowOpacity = 1
        grayArea2.layer.shadowOffset = CGSize.zero
        grayArea2.layer.shadowRadius = 30
        grayArea2.layer.shadowPath = UIBezierPath(roundedRect: grayArea.frame , cornerRadius: 10).cgPath
        
        let cadTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.15, width: widht * 0.2, height: height * 0.2))
        cadTextLabel.text = "CAD:"
        cadTextLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
        cadTextLabel.textColor = .white
        cadTextLabel.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        cadTextLabel.shadowOffset = CGSize(width: 2, height: 2)
        
        let usdTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.25, width: widht * 0.2, height: height * 0.2))
        usdTextLabel.text = "USD:"
        usdTextLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
        usdTextLabel.textColor = .white
        usdTextLabel.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        usdTextLabel.shadowOffset = CGSize(width: 2, height: 2)
        
        let jpyTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.35, width: widht * 0.2, height: height * 0.2))
        jpyTextLabel.text = "JPY:"
        jpyTextLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
        jpyTextLabel.textColor = .white
        jpyTextLabel.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        jpyTextLabel.shadowOffset = CGSize(width: 2, height: 2)
        
        let tryTextLabel = UILabel(frame: CGRect(x: widht * 0.2, y: height * 0.65, width: widht * 0.2, height: height * 0.2))
        tryTextLabel.text = "TRY:"
        tryTextLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
        tryTextLabel.textColor = .white
        tryTextLabel.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        tryTextLabel.shadowOffset = CGSize(width: 2, height: 2)
        
        
        
        
        view.addSubview(grayArea2)
        view.addSubview(grayArea)
        view.addSubview(cadTextLabel)
        view.addSubview(usdTextLabel)
        view.addSubview(jpyTextLabel)
        
        view.addSubview(tryTextLabel)
        
        
    }

    @IBAction func getRatesButtonPressed(_ sender: Any) {
        // 1 - Request & Session
        // 2 - Response & DNA
        // 3 - Parsing & JSON Serialization
        
        // 1
    }
    
}

