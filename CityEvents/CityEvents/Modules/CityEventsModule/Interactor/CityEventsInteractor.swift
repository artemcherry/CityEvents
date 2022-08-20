//
//  CityEventsInteractor.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

protocol CityEventsInteractorProtocol: AnyObject {
    func getEventList(completion: @escaping ([EventModel]?, Error?) -> Void)    
}

class CityEventsInteractor: CityEventsInteractorProtocol {
    
    func getEventList(completion: @escaping ([EventModel]?, Error?) -> Void) {
        DataProvider.getEventList { eventsNetwork, error in
            var eventModels = [EventModel]()
            if let eventsNetwork = eventsNetwork {
                for eventModel in eventsNetwork {
                    eventModels.append(EventModel.init(with: eventModel) ?? EventModel())
                }
                completion(eventModels, nil)
            }
            else {
                completion(nil, error)
            }
        }
    }
    
    
}
