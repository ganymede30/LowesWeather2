//
//  Weather.swift
//  LowesWeather2
//
//  Created by Michael Kenny on 3/29/21.
//

import Foundation

struct WeatherTopLevel: Decodable {
    enum CodingKeys: String, CodingKey {
        case weeklyWeather = "list"
        case city
    }
    let weeklyWeather: [weeklyWeather]
    let city: City
}

struct City: Decodable {
    let name: String
}

struct weeklyWeather: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
}

struct Weather: Decodable {
    let main: String
    let description: String
}
