//
//  CityEventsPresenter.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

protocol CityEventsPresenterProtocol: AnyObject {
    func getEvents()
    func openEvent(event: EventModel)
}

class CityEventsPresenter: CityEventsPresenterProtocol {
    
    private let view: CityEventsViewProtocol?
    private let router: MainRouterProtocol?
    private let interactor: CityEventsInteractorProtocol?
    
    init(view: CityEventsViewProtocol, router: MainRouterProtocol, interactor: CityEventsInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getEvents() {
        interactor?.getEventList(completion: { events, error in
            if let events = events {
                self.view?.updateModels(models: events)
            }
            else {
                print("error")
            }
        })
    }
    func openEvent(event: EventModel) {
        router?.goToEventScreen(event: event)
    }
}
