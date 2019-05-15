//
//  WeatherDataModel.swift
//  Weather Test
//
//  Created by Natalia Martin on 14/05/2019.
//

import Foundation
class WeatherDataModel {
    var cityName: String!
    var temp: Double!
    var iconID: String!
    
    init(cityName: String, temp: Double, iconID: String) {
        self.cityName = cityName
        self.temp = temp
        self.iconID = iconID
    }
}
