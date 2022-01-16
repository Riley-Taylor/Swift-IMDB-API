//
//  MovieItem.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 12/6/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//



import Foundation

class MovieItem: NSObject, Decodable {
    var title:String?
    var year:String?
    var imdbID:String?
    var poster:String?

    
    enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case poster = "Poster"
       
    }
}
