//
//  DayViewModel.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 19.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import Foundation
import Action
import RxSwift
import RxCocoa

protocol DayViewModelType {
    //MARK: - Properties
    var date: Driver<String> { get }
    var city: Driver<String> { get }

    var temperature: Driver<String> {get}
    var description: Driver<String> {get}
//    var isLoading: Driver<Bool> {get}
//    var hasFailed: Driver<Bool> {get}
//}
}
struct DayViewModel: DayViewModelType {
    var city: Driver<String> {
        return weatherData
            .map { $0.city }
            .asDriver(onErrorJustReturn: "unknown City")
    }


    private let bag: DisposeBag = DisposeBag()

    let weatherData: Observable<Weather>


    var date: Driver<String> {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMMM d"
        return weatherData
            .map{ $0.currentDate }
            .map { formatter.string(from: $0) }.asDriver(onErrorJustReturn: "Error")
    }

    var temperature: Driver<String> {
        return weatherData
            .map{ $0.temperature }
            .map { String(format:  "%.16f", $0)}.asDriver(onErrorJustReturn: "_")
    }

    var description: Driver<String> {
        return weatherData
            .map{ $0.currentWeather.description }.asDriver(onErrorJustReturn: "_")
    }



}
