//
//  AppDelegate.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        let window = UIWindow()
        
        let screenBuilder = ModuleBuilder()
        let router = MainRouter(screenBuilder: screenBuilder)
        guard let rootVC = screenBuilder.createCityEventsModule(router: router)
        else { return false }
        
        let navController = UINavigationController(rootViewController: rootVC)
        
        router.navigationController = navController
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}


