//
//  WebService.swift
//  GoodWeatherApp
//
//  Created by Sachin Bhardwaj 2 on 22/07/20.
//  Copyright © 2020 Sachin Bhardwaj 2. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {
    
    func load<T>(resource: Resource<T>, complation: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    complation(resource.parse(data))
                }
            } else {
                complation(nil)
            }
        }.resume()
    }
    
}
