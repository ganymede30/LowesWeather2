//
//  WeeklyWeatherVC.swift
//  LowesWeather2
//
//  Created by Michael Kenny on 3/25/21.
//

import UIKit

class WeeklyWeatherVC: UIViewController {

    var helper = Helper()

    let weeklyTableView: UITableView = {
        let closureTableView = UITableView()
        closureTableView.rowHeight = 50
        return closureTableView
    }()
    
    var city: String = ""
    
    lazy var weatherString: String = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=65d00499677e59496ca2f318eb68c049"
    
    var weatherTopLevel: WeatherTopLevel? {
        didSet {
            DispatchQueue.main.async {
                self.weeklyTableView.reloadData()
                self.navigationItem.title = "\(self.weatherTopLevel?.city.name ?? "Weekly") Weather"
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        view.addSubviews(weeklyTableView)
        setUpWeeklyTableView()
        getData()
    }
    
    func getData(){
        helper.getData(link: self.weatherString) { (resultWeatherTopLevel) in
            self.weatherTopLevel = resultWeatherTopLevel
        }
    }
    
    func setUpWeeklyTableView(){
        weeklyTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weeklyTableView.topAnchor.constraint(equalTo: view.topAnchor),
            weeklyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weeklyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            weeklyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        weeklyTableView.dataSource = self
        weeklyTableView.delegate = self
        weeklyTableView.register(WeeklyWeatherCell.self, forCellReuseIdentifier: WeeklyWeatherCell.id)
    }
    
}

extension WeeklyWeatherVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherTopLevel?.weeklyWeather.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weeklyTableView.dequeueReusableCell(withIdentifier: WeeklyWeatherCell.id, for: indexPath) as! WeeklyWeatherCell
        cell.temp.text = "Temp: \(String(describing: helper.kelvinToFahrenheit(temp: weatherTopLevel?.weeklyWeather[indexPath.row].main.temp ?? 0.0))) F"
        cell.weather.text = "Weather: \(String(describing: weatherTopLevel?.weeklyWeather[indexPath.row].weather[0].main ?? "Undetermined"))"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weeklyTableView.deselectRow(at: indexPath, animated: true)
        let sb = UIStoryboard(name: "DailyWeather", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "dailyWeather_VC") as? DailyWeatherVC {
            navigationController?.pushViewController(vc, animated: true)
            vc.temp.text = "Temp: \(String(describing: helper.kelvinToFahrenheit(temp: weatherTopLevel?.weeklyWeather[indexPath.row].main.temp ?? 0.0))) F"
            vc.feelsLike.text = "Feels Like: \(String(describing: helper.kelvinToFahrenheit(temp: weatherTopLevel?.weeklyWeather[indexPath.row].main.feels_like ?? 0.0))) F"
            vc.weather.text = weatherTopLevel?.weeklyWeather[indexPath.row].weather[0].main
            vc.weatherDescription.text = weatherTopLevel?.weeklyWeather[indexPath.row].weather[0].description
        }
    }
    
}
