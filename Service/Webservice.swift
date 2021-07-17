//
//  Webservice.swift
//  Coin
//
//  Created by Mehmet Salih ÇELİK on 16.07.2021.
//

import Foundation

class Webservice {
    
    func downloadModel(url: URL, completion: @escaping ([Welcome]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let yep = try? JSONDecoder().decode([Welcome].self, from: data)
                if let yep = yep {
                    completion(yep)
                }
            }
        }.resume()
        
    }
    
}
