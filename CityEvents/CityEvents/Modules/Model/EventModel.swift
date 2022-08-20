//
//  EventModel.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

struct EventModel {
    let title: String
    let description: String
    let images: [String]?
    let startDate: Date?
//    let endDate: Date?
    
    init() {
        self.title = ""
        self.description = ""
        self.images = nil
        self.startDate = nil
//        self.endDate = nil
    }
    
    init?(with model: EventNetworkModel) {
        self.title = model.title ?? ""
        self.description = model.description ?? ""
        self.images = EventModel.addImages(model: model)
        self.startDate = EventModel.addStartDate(model: model)
    }
    
    static func addImages(model: EventNetworkModel) -> [String] {
        var images = [String]()
        if let model = model.images {
            for image in model {
                images.append(image.image ?? "")
            }
        }
        return images
    }

    static func addStartDate(model: EventNetworkModel) -> Date {
        var returnStartDate = Date()
        guard model.dates?.count == 1 else {return Date()}
        if let dates = model.dates {
            for date in dates {
                let timeInterval = TimeInterval(date.startDate ?? 0)
                let startDate = Date(timeIntervalSince1970: timeInterval)
                returnStartDate = startDate
            }
        }
        return returnStartDate
    }
}
