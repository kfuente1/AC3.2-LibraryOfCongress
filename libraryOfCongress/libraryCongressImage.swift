//
//  libraryCongressImage.swift
//  libraryOfCongress
//
//  Created by Karen Fuentes on 10/27/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import Foundation

struct LibraryCongressImage {
    let title : String
    let thumbImage: String
    let fullImage: String
    let subject: [String]
    
    static func giphys(from data: Data) -> [LibraryCongressImage]? {
        do {
            let libraryJsonData: Any = try JSONSerialization.jsonObject(with: data, options: [])
            guard let libraryCongressCasted: [String:AnyObject] = libraryJsonData as? [String: AnyObject] else {
                print("there was an error casting to \(libraryJsonData)")
                return nil
            }
            print("library congress was created\(libraryCongressCasted)")
            guard let castingLibraryJson: Any = libraryCongressCasted["results"] else {
                print("there was an error casting to any for [String:Any] \(libraryCongressCasted)")
                return nil
            }
            print("arrayOfGiphy was casted \(castingLibraryJson)")
            
            guard let arrayOfLibraryCongress: [AnyObject] = libraryCongressCasted["results"] as? [AnyObject] else {
                return nil
            }
            var libraryCongressArray: [LibraryCongressImage] = []
            
            arrayOfLibraryCongress.forEach({ (libraryCongressObject) in
                guard let libraryTitle: String = libraryCongressObject["title"] as? String,
                    let libraryImageDict : [String:Any] = libraryCongressObject["image"] as? [String:Any],
                    let libraryThumbImage: String = libraryImageDict["thumb"] as? String,
                    let libraryFullImage: String = libraryImageDict["full"] as? String,
                    let librarySubject: [String] = libraryCongressObject["subjects"] as? [String]
                    else {
                        return
                }
                let libraryThumbImageString = "http:" + libraryThumbImage
                let libraryFullImageString = "http:" + libraryFullImage
                
                libraryCongressArray.append(LibraryCongressImage(title: libraryTitle, thumbImage: libraryThumbImageString, fullImage: libraryFullImageString, subject: librarySubject))
            })
            return libraryCongressArray
            
        }
        catch _ as NSError {
            print ("errrrooorrrrrr")
        }
        return nil
    }
}
