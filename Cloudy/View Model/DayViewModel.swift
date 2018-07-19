//
//  DayViewModel.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 19.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import Foundation

struct DayViewModel {

    //MARK: - Properties
    let weatherData : Weather

    //MARK: - Date Formatters

    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()

    var date: String {
        //Configure Date Formatter
        dateFormatter.dateFormat = "EEE, MMMM d"
        return dateFormatter.string(from: weatherData.currentDate)
    }

    var city : String {
        return weatherData.city
    }

    var currentTemp : Double {
        return weatherData.temperature
    }
}
