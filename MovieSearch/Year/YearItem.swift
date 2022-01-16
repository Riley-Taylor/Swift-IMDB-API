//THIS IS THE ACTUAL YEAR I T E M ! ! !
import Foundation
struct YearItem {
    var year: String?
    
    init(dict:[String:AnyObject]) {
        self.year = dict["year"] as? String
    }
    
    var full:String
    {
        guard let year=self.year else {return""}
        return "\(year)"
    }
}
