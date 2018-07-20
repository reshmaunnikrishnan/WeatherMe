//
//  DayViewModel.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 19.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import Foundation
import Action

struct DayViewModel {

    //MARK: - Properties
    let weatherData : Weather
    init(weather : Weather) {
        self.weatherData = weather
    }

    //MARK: - Date Formatters

    private let dateFormatter = DateFormatter()

    var date: String {
        //Configure Date Formatter
        dateFormatter.dateFormat = "EEE, MMMM d"
        return dateFormatter.string(from: weatherData.currentDate)
    }

    var currentTemp : Double {
        return weatherData.temperature
    }
}
