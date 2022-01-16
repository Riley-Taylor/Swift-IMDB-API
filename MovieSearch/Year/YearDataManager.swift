//
//  YearSelector.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 11/28/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//

import Foundation

class YearDataManager
{
    
    private var Years:[YearItem] = []
    
    func fetch()
    {
        for Year in loadData()
        {
        
            Years.append(MovieSearch.YearItem(dict: Year))
        
        }
    }
    
    func numberOfItems() -> Int {
        return Years.count
    }
    
    func YearItem(at index:IndexPath) -> YearItem {
        return Years[index.item]
    }
    
    private func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "years", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String : AnyObject]]
    }
    
    func findYear(by name:String) -> (isFound:Bool, position:Int)
    {
        guard let index = Years.index(where: {$0.year==name}) else {return (isFound:false, position:-1)}
        return (isFound: true, position:index)
    }
}

