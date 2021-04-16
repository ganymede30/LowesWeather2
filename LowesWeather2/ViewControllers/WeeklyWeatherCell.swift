//
//  WeeklyWeatherCell.swift
//  LowesWeather2
//
//  Created by Michael Kenny on 3/29/21.
//

import UIKit

class WeeklyWeatherCell: UITableViewCell {

    static let id = String(describing: WeeklyWeatherCell.self)
    
    var temp: UILabel = {
        let closureLabel = UILabel()
        return closureLabel
    }()
    
    var weather: UILabel = {
        let closureLabel = UILabel()
        return closureLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubviews(temp, weather)
        setUpAllConstraints()
        // Configure the view for the selected state
    }

}

extension WeeklyWeatherCell {
    
    func setUpAllConstraints() {
        func setUpTempConstraints() {
            temp.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                temp.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
                temp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                temp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
            ])
        }
        
        func setUpWeatherConstraints() {
            weather.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                weather.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                weather.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
                weather.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
            ])
        }
        
        setUpTempConstraints()
        setUpWeatherConstraints()
    }
    
}
