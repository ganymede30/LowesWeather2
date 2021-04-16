//
//  ViewController.swift
//  LowesWeather2
//
//  Created by Michael Kenny on 3/25/21.
//

import UIKit

class ViewController: UIViewController {

    let cityEntry: UITextField = {
        let closureTextField = UITextField()
        closureTextField.placeholder = "City Name"
        closureTextField.borderStyle = UITextField.BorderStyle.roundedRect
        closureTextField.backgroundColor = UIColor.white
        closureTextField.textColor = UIColor.blue
        return closureTextField
    }()
    
    let searchButton: UIButton = {
        let closureButton = UIButton()
        closureButton.setTitle("Look Up", for: .normal)
        closureButton.backgroundColor = UIColor.black
        closureButton.addTarget(self, action: #selector (searchCity(_:)), for: .touchUpInside)
        return closureButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray
        view.addSubviews(cityEntry, searchButton)
        setUpAllConstraints()
        setUpNavigationBar()
    }
    
    @objc func searchCity(_ sender: UIButton!){
        let sb = UIStoryboard(name: "WeeklyWeather", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "weeklyWeather_VC") as! WeeklyWeatherVC
        vc.city = cityEntry.text!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .purple
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}

extension ViewController {
    
    func setUpAllConstraints() {
        func setUpCityEntryConstraints() {
            cityEntry.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cityEntry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                cityEntry.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                cityEntry.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
                cityEntry.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1)
            ])
        }
        
        func setUpSearchButtonConstraints() {
            searchButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                searchButton.topAnchor.constraint(equalTo: cityEntry.bottomAnchor, constant: 10),
                searchButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                searchButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1)
            ])
        }
        
        setUpCityEntryConstraints()
        setUpSearchButtonConstraints()
    }
    
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
