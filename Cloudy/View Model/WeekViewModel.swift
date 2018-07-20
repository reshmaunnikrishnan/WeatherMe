//
//  WeekViewModel.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 19.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import UIKit
import Action

struct WeeKViewModel {

    //MARK :- Properties

    let forecastData : Forecast

    //Mark :- User Realatable Data
    private let dateformatter =  DateFormatter()

    var date : String {
        //configure DateFormatter
         dateformatter.dateFormat = "EEE, MMMM d"
         return dateformatter.string(from: forecastData.date)
    }

    var image: UIImage?  {
        return UIImage(named: forecastData.imageID)
    }

    var numberOfSections: Int {
        return 1
    }

    var numberOfRows: Int {
        return 7
    }

}
