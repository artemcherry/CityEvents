//
//  ModuleBuilder.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    func createCityEventsModule(router: MainRouter) -> UIViewController?
    func createEventModule(router: MainRouter, event: EventModel) -> UIViewController?
}
   
    

class ModuleBuilder: ModuleBuilderProtocol {
    func createCityEventsModule(router: MainRouter) -> UIViewController? {
        let view = CityEventsView()
        let interactor = CityEventsInteractor()
        let presenter = CityEventsPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        return view
    }
    
    func createEventModule(router: MainRouter, event: EventModel) -> UIViewController? {
        let view = EventView()
        let presenter = EventPresenter(view: view, router: router, model: event)
        view.presenter = presenter
        return view
    }
    


    
}
