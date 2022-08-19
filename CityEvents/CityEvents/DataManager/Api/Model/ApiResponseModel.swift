//
//  ApiResponseModel.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

struct ApiResponseModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [EventNetworkModel]?
}
