//
//  MovieOnlineViewController.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 12/6/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//

import UIKit
import SafariServices

class MovieOnlineViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SHOWOMDB() {
        let web = SFSafariViewController(url: URL(string:"\(MovieSearch.MovieItem.CodingKeys.imdbID.self)")!)
        present(web,animated: true)
    }
}
