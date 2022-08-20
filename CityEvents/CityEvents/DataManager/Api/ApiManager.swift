//
//  ApiManager.swift
//  CityEvents
//
//  Created by Артем Вишняков on 19.08.2022.
//

import Foundation

class ApiManager {
        
    static var page = 1

    
    static func getEventNetworkModelList(completion: @escaping (ApiResponseModel?, Error?) -> Void) {
        let urlString = "https://kudago.com/public-api/v1.4/events/?fields=title%2Cdescription%2Cimages%2Cdates&location=smr&text_format=text&expand=images&page=\(page)"
        guard let url = URL(string: urlString) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                guard let parcedData = try? JSONDecoder().decode(ApiResponseModel.self, from: data) else {return}
                completion(parcedData, nil)
            }
            else {
                completion(nil, error)
            }
        }
        dataTask.resume()
        page += 1
    }
}
