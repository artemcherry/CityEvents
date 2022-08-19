//
//  CityEventsPresenter.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

protocol CityEventsPresenterProtocol: AnyObject {}

class CityEventsPresenter: CityEventsPresenterProtocol {
    
    private let view: CityEventsViewProtocol?
    private let router: MainRouterProtocol?
    private let interactor: CityEventsInteractorProtocol?
    
    init(view: CityEventsViewProtocol, router: MainRouterProtocol, interactor: CityEventsInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}
