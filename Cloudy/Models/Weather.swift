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
    let tempMin: Float
    let tempMax: Float
    let description : String

    init?(json: JSON) {
        guard
            let timestamp = json["dt"].double ,
            let imageID = json["weather"][0]["icon"].string,
            let tempMin = json["main"]["temp_min"].float,
            let tempMax = json["main"]["temp_max"].float,
            let temp = json["main"]["temp"].float,

            let description = json["weather"][0]["description"].string
            else  {
                return nil
        }

        self.date = Date(timeIntervalSince1970: timestamp)
        self.imageID = imageID
        self.temp = temp
        self.description = description
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
}

struct Weather {

    let city: String
    let currentDate: Date
    let temperature: Double
    let foreCasts : [Forecast]
    let currentWeather : Forecast
    init?(json: JSON) {
        guard
            let currentTimeStamp = json["list"][0]["dt"].double,
            let currentTemp =  json["list"][0]["main"]["temp"].double,
            let foreCastData =  json["list"].array,
            let cityName = json["city"]["name"].string
            else {
                return nil
                    }
        self.currentDate = Date(timeIntervalSince1970: currentTimeStamp)
        self.temperature = currentTemp
        self.city = cityName
        let forecasts = foreCastData.map(Forecast.init)
        guard !forecasts.isEmpty else {
            return nil
        }

        self.foreCasts = forecasts as! [Forecast]
        self.currentWeather = forecasts[0] as! Forecast
    }
}

