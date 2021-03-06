//
//  CarTabViewController.swift
//  demo
//
//  Created by Bassem Qoulta on 4/3/18.
//  Copyright © 2018 Bassem Qoulta. All rights reserved.
//

import UIKit

class CarTabViewController: BaseViewController{
    
    @IBOutlet var dataSource: CarTableViewDataSource!
    @IBOutlet weak var carsTableView: UITableView!
    
    private var presenter: PlaceMarkTabPresenterInput!
    private var carIntractor: PlaceMarkInteractorInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        initializePresenter()
        presenter.viewDidLoad()
    }
    
    private func initializePresenter(){
        presenter = PlaceMarkPresenter()
        carIntractor = PlaceMarkInteractor()
        carIntractor.output = presenter as? PlaceMarkInteractorOutput
        presenter.carView = self
        presenter.intractor = carIntractor
    }
    
    private func prepareTableView(){
        carsTableView.estimatedRowHeight = 100
        carsTableView.dataSource = dataSource
        carsTableView.delegate = dataSource
    }
}

//MARK: CarTabViewInput
extension CarTabViewController: PlaceMarkTabViewInput{
    
    func showLoadingCarsError(_ message: String) {
        showErrorMessage(message)
    }
    
    func showLoadingCars(){
        showLoadingView(self.carsTableView)
    }
    
    func showCars(for list: [Placemark]){
        dataSource.setPlaceMarkList(list)
        carsTableView.reloadData()
    }
    
    func hideLoadingCars(){
        hideLoadingView(self.carsTableView)
    }
}
