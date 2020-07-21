//
//  WeatherListViewModel.swift
//  GoodWeatherApp
//
//  Created by Sachin Bhardwaj 2 on 22/07/20.
//  Copyright © 2020 Sachin Bhardwaj 2. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
}

struct WeatherViewModel: Decodable {
    
    let name: String
    var currentTemperature: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
    
}

struct TemperatureViewModel: Decodable {
    
    var temperature: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}
