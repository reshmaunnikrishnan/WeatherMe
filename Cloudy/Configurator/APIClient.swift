
//
//  APIClient.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 18.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

import SwiftyJSON

struct APIDetails {
    static let APIForeCastPath = "/data/2.5/forecast"
    static let APIWeatherPath = "/data/2.5/weather"
}

class APIClient {
    enum Error: Swift.Error {
        case badRequestURL
        case encodeParameters
        case badHTTPStatus(code: Int)
        case requestTimeOut
        case noInternet
    }

    static let shared = APIClient()
    private  let baseURL = "https://api.openweathermap.org/data/2.5/"
    private  let APPID = "6a700a1e919dc96b0a98901c9f4bec47"


    func getWeatherForeCast(city: String? = "Berlin") -> Observable<Weather> {

        //adding params
        let params : [String: String] = [
            "q" : city! ,
            "units" :  "metric",
            "type" : "like",
            "APPID" : APPID,
            "Content-Type" : "application/json"
        ]


        var componets = URLComponents(string: baseURL)

        componets?.scheme = "https"
        componets?.host = "api.openweathermap.org"
        componets?.path = APIDetails.APIForeCastPath
        componets?.queryItems = params.map {
            URLQueryItem(name: String($0) , value: String($1))
        }

        let urlRequest = URLRequest(url: (componets?.url)!)

        return URLSession.shared.rx.response(request: urlRequest)
            .debug("hellooo") // this ust be printed out!!
            .observeOn(MainScheduler.instance)
            .map{ (arg: (response: HTTPURLResponse, data: Data)) -> Weather in

                let (response, data) = arg
                print(data)
                    guard 200..<400 ~= response.statusCode else {
                        throw Error.badHTTPStatus(code: response.statusCode)
                    }

                let json = try JSON(data: data)
                let weather = Weather(json: json)!
                return weather
                }.asObservable()
    }




}
