//
//  Weather.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 18.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import Foundation

import UIKit
import SwiftyJSON

struct Forecast {
    let date : Date
    let imageID : String
    let temp: Float
    let description : String

    init?(json: JSON) {
        guard
            let timestamp = json["dt"].double ,
            let imageID = json["weather"][0]["icon"].string,
            let temp = json["main"]["temp"].float,
            let description = json["weather"][0]["description"].string
            else  {
                return nil
        }

        self.date = Date(timeIntervalSince1970: timestamp)
        self.imageID = imageID
        self.temp = temp
        self.description = description
    }
}

struct Weather {
    let city: String
    let currentDate: Date
    let temperature: Double
    let icon: String
    let foreCasts : [Forecast]
    let currentWeather : Forecast
    init?(json: JSON) {
        guard
            let currentTimeStamp = json["list"][0]["dt"].double,
            let currentTemp =  json["list"][0]["main"]["temp"].double,
            let imageIcon = json["list"][0]["weather"]["icon"].string,
            let city = json["city"]["name"].string ,
            let foreCastData =  json["list"].array
            else {
                return nil
                    }
        self.city = city
        self.currentDate = Date(timeIntervalSince1970: currentTimeStamp)
        self.temperature = currentTemp
        self.icon = imageIcon
        let forecasts = foreCastData.map(Forecast.init)
        guard !forecasts.isEmpty else {
            return nil
        }

        self.foreCasts = forecasts as! [Forecast]
        self.currentWeather = forecasts[0] as! Forecast
    }
}

