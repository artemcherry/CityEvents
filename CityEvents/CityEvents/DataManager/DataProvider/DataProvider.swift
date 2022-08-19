//
//  DataProvider.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

class DataProvider {
    static func getEventList(completion: @escaping ([EventNetworkModel]?, Error?) -> Void) {
        ApiManager.getEventNetworkModelList { responseData, error in
            if let responseData = responseData {
                DispatchQueue.main.async {
                    completion(responseData.results, nil)
                }
            }
            else {
                completion(nil, error)
            }
        }
        ApiManager.page += 1
    }
}
