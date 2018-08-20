//
//  WeatherWeekViewViewModel.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 20.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import UIKit

struct WeatherWeekViewViewModel {


    //MARK:- Parameters

//    let weatherData: [Forecast]
    //MARK:- Table View Detailings

    var numberOfSections: Int {
        return 1
    }

    var numberOfRows: Int {
        return 7
    }

    //Mark: - MEthods
//    func viewModel(for Index: Int) -> WeeKViewModel {
//        return WeeKViewModel(foreCast: weatherData[Index])
//    }
}
