//
//  GenreDataManager.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 11/26/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//

import Foundation


class GenreDataManager {
    
    fileprivate var items:[GenreItem] = []
    
    func fetch() {
        for data in loadData() {
            items.append(GenreItem(dict: data))
        }
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "Collectiondata", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        
        return items as! [[String: AnyObject]]
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func explore(at index:IndexPath) -> GenreItem {
        return items[index.item]
    }
}
