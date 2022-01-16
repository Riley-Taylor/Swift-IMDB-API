//
//  CollectionGenreItem.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 11/26/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//

import Foundation

struct GenreItem{
    var GenreView:String
}

extension GenreItem {
    init(dict:[String:AnyObject]) {
        self.GenreView = dict["image"] as! String
    }
}
