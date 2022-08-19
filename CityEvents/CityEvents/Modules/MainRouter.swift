//
//  MainRouter.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    var screenBuilder: ModuleBuilderProtocol? {get set}
    func goToEventScreen(event: EventModel)
}

class MainRouter: MainRouterProtocol {
    
    var screenBuilder: ModuleBuilderProtocol?
    var navigationController: UINavigationController?
    
    init(screenBuilder: ModuleBuilderProtocol) {
        self.screenBuilder = screenBuilder
    }
    
    func goToEventScreen(event: EventModel) {
        guard let eventViewController = screenBuilder?.createEventModule(router: self, event: event) else { return }
        self.navigationController?.pushViewController(eventViewController, animated: true)
    }

    
}
