//
//  EventPresenter.swift
//  CityEvents
//
//  Created by Артем Вишняков on 20.08.2022.
//

import Foundation

protocol EventPresenterProtocol: AnyObject {
    func updateEvent()
}

class EventPresenter: EventPresenterProtocol {
    
    
    private let view: EventViewProtocol?
    private let router: MainRouterProtocol?
    private let model: EventModel?
    
    init(view: EventViewProtocol, router: MainRouterProtocol, model: EventModel) {
        self.view  = view
        self.router = router
        self.model = model
    }
    
    func updateEvent() {
        guard let model = model else { return }
        view?.updateEvent(model: model)
    }
    
}
