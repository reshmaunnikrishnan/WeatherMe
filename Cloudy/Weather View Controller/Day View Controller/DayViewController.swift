//
//  DayViewController.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 18.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

//import UIKit
import RxCocoa
import RxSwift

class DayViewController: UIViewController {

    // MARK: -

    let bag: DisposeBag = DisposeBag()

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var temperature: UILabel!

    var viewModel: DayViewModel? {
        didSet {
            updateView()
        }
    }

    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup View
        setupView()

    }

    private func setupView() {
        //Configure View
        view.backgroundColor = .white
    }

    private func updateView() {

        viewModel?.city.drive(city.rx.text).disposed(by: bag)
        viewModel?.description.drive(feelsLike.rx.text).disposed(by: bag)
        viewModel?.temperature.map{"Temp:" + $0}.drive(temperature.rx.text).disposed(by: bag)

    }


}
