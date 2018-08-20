//
//  WeekViewController.swift
//  Cloudy
//
//  Created by Reshma Unnikrishnan on 18.07.18.
//  Copyright © 2018 Reshma Unnikrishnan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeekViewController: UIViewController , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let bag: DisposeBag = DisposeBag()

    var viewModel: WeeKViewModel?


    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup View
        setupView()
        bindTableView()

    }

    private func setupView() {
        //Configure View
        self.tableView.delegate = self
        view.backgroundColor = .green
    }

    private func registerCell() {
        let nib = UINib(nibName: WeatherCell.Identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: WeatherCell.Identifier)
    }
    private func bindTableView() {

        registerCell()
        tableView.rowHeight = 90
        let x = Observable.from(["parva", "sierro", "track"])

       x.bind(to: self.tableView.rx.items(cellIdentifier: WeatherCell.Identifier, cellType:WeatherCell.self))
            { _, element, cell in
              cell.dateLabel.text = element

        }.disposed(by: bag)
        }


}

class WeatherCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!

    static var Identifier = "CellIdentifier"


}
