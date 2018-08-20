//
//  WeekViewModel.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 19.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import UIKit
import Action
import RxSwift
import RxCocoa

struct WeeKViewModel {

   //MARK :- Properties



    let forecastData: Observable<[Forecast]>

    //Mark :- User Realatable Data
    private let dateformatter =  DateFormatter()
    
//
//    var date : Driver<String> {
//        //configure DateFormatter
//         dateformatter.dateFormat = "EEE, MMMM d"
//        let val = dateformatter.string(from: forecastData.date)
//         return val
//    }
//
//    var image: AnyObserver<UIImage>  {
//        return UIImage(named: forecastData.imageID)
//    }


}
