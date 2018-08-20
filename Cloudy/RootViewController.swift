//
//  ViewController.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 18.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class RootViewController: UIViewController {

    private var weatherService: APIClient {
        return APIClient.shared
    }

    let disposeBag = DisposeBag()


    //MARK: - Properties

    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to instantiare DayViewController!!")
        }
        //Configure Day View Controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false

        return dayViewController

    }()

    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to instantiare WeekViewController!!")

        }
        // Configure Day View Controller
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return weekViewController
    }()

    //MARK: - Life Cycle View

    override func viewDidLoad() {
        super.viewDidLoad()

        //add ChildViewControllers

        setupChildViewControllers()

        setUpDetailsForView()
    }


    func setupChildViewControllers() {

        addChildViewController(dayViewController)
        addChildViewController(weekViewController)

        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)


        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive =  true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height).isActive = true


        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        dayViewController.didMove(toParentViewController: self)
        weekViewController.didMove(toParentViewController: self)

    }

    func setUpDetailsForView() {


        let weather: Observable<Weather> = weatherService.getWeatherForeCast(city: "Berlin")
        dayViewController.viewModel = DayViewModel(weatherData: weather)
        weekViewController.viewModel = WeeKViewModel(forecastData: weather.map{$0.foreCasts})
}
}


extension RootViewController {

    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 200.0
        }
    }

}

