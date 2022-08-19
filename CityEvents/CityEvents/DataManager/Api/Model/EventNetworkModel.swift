//
//  EventNetworkModel.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

struct EventNetworkModel: Codable {
    let dates: [Dates]?
    let title: String?
    let description: String?
    let images: [ImageModel]?
}

struct Dates: Codable {
    let startDate: Int?
    let endDate: Int?
    
    enum CodingKeys: String, CodingKey {
        case startDate = "start"
        case endDate = "end"
    }
}

struct ImageModel: Codable {
    let image: String?
    let source: ImageSource?
}

struct ImageSource: Codable {
    let name: String?
    let link: String?
}
