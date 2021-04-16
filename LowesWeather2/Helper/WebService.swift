//
//  WebService.swift
//  LowesWeather2
//
//  Created by Michael Kenny on 3/29/21.
//

import Foundation

struct Helper {
    
    func getData(link: String, updateDataClosure: @escaping (WeatherTopLevel) -> () ) {
        guard let urlLink = URL(string: link) else { return }
        let task = URLSession.shared.dataTask(with: urlLink, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print(error!)
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedWeatherTopLevel = try decoder.decode(WeatherTopLevel.self, from: data)
                updateDataClosure(decodedWeatherTopLevel)
            } catch {
                print(error)
            }
        })
        task.resume()
    }
    
    func kelvinToFahrenheit(temp: Double) -> Double{
        let newTemp = 1.8 * (temp - 273) + 32
        return Double(round(100*newTemp)/100)
    }
    
}
