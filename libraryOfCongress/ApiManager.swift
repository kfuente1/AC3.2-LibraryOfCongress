//
//  ApiManager.swift
//  libraryOfCongress
//
//  Created by Karen Fuentes on 10/27/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import Foundation

class ApiManager {
   static let manager: ApiManager = ApiManager()
    init (){}
    
    func retrieveData(completion:@escaping ((Data?) ->Void)) {
        guard let url = URL(string: "https://loc.gov/pictures/search/?q=mark%20twain&fo=json") else {return}
        let session = URLSession.init(configuration: .default)
        session.dataTask(with: url) { (data:Data? , response: URLResponse? , error:Error?) in
            if error != nil {
                print("there is an error of type \(error)")
            }
            guard let validData = data else {
                return
            }
            completion(validData)
            } .resume()
        
    }
    
}
