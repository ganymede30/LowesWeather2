//
//  DailyWeatherVC.swift
//  LowesWeather2
//
//  Created by Michael Kenny on 3/30/21.
//

import UIKit

class DailyWeatherVC: UIViewController {

    let temp: UILabel = {
        let closureLabel = UILabel()
        closureLabel.backgroundColor = .red
        closureLabel.adjustsFontSizeToFitWidth = true
        closureLabel.font = UIFont.systemFont(ofSize: 40)
        return closureLabel
    }()
    
    let feelsLike: UILabel = {
        let closureLabel = UILabel()
        closureLabel.adjustsFontSizeToFitWidth = true
        closureLabel.backgroundColor = .red
        closureLabel.font = UIFont.systemFont(ofSize: 40)
        return closureLabel
    }()
    
    let weather: UILabel = {
        let closureLabel = UILabel()
        closureLabel.backgroundColor = .red
        closureLabel.adjustsFontSizeToFitWidth = true
        closureLabel.font = UIFont.systemFont(ofSize: 40)
        return closureLabel
    }()
    
    let weatherDescription: UILabel = {
        let closureLabel = UILabel()
        closureLabel.backgroundColor = .red
        closureLabel.numberOfLines = 0
//        closureLabel.adjustsFontSizeToFitWidth = true
        closureLabel.font = UIFont.systemFont(ofSize: 40)
        return closureLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubviews(temp, feelsLike, weather, weatherDescription)
        setUpAllConstraints()
    }

}

extension DailyWeatherVC {
    
    func setUpAllConstraints() {
        func setUpTempConstraints(){
            temp.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
//                temp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                temp.topAnchor.constraint(equalTo: view.topAnchor, constant: 175),
                temp.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
//                temp.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
                temp.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -175)
            ])
        }
        
        func setUpFeelsLikeConstraints(){
            feelsLike.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
//                feelsLike.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                feelsLike.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                feelsLike.topAnchor.constraint(equalTo: temp.bottomAnchor, constant: 15),
//                feelsLike.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
            ])
        }
        
        func setUpWeatherConstraints(){
            weather.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                weather.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//                weather.topAnchor.constraint(equalTo: view.topAnchor, constant: 175),
                weather.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
                weather.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
            ])
        }
        
        func setUpWeatherDescriptionConstraints(){
            weatherDescription.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                weatherDescription.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
//                weatherDescription.topAnchor.constraint(equalTo: weather.bottomAnchor, constant: 15),
                weatherDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
                weatherDescription.centerYAnchor.constraint(greaterThanOrEqualTo: view.centerYAnchor, constant: 50)
            ])
        }
        
        setUpTempConstraints()
        setUpFeelsLikeConstraints()
        setUpWeatherConstraints()
        setUpWeatherDescriptionConstraints()
    }
    
}
