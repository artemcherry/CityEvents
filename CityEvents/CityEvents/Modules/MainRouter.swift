//
//  MainRouter.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    var screenBuilder: ModuleBuilderProtocol? {get set}
}

class MainRouter: MainRouterProtocol {
    
    var screenBuilder: ModuleBuilderProtocol?
    var navigationController: UINavigationController?
    
    init(screenBuilder: ModuleBuilderProtocol) {
        self.screenBuilder = screenBuilder
    }
    

    
}
