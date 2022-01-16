//
//  MovieResultViewController.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 12/6/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//

import SafariServices
import UIKit

class MovieResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var movies:[MovieItem] = []
    var filler:String = ""
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.item]
        
        cell.lbTitle?.text = movie.title
        cell.lbYear?.text = movie.year
        cell.lbIMDBLink?.text = "https://www.imdb.com/title/\(movie.imdbID)/"
       
        
        
        if movie.poster != "N/A" && movie.poster != nil {
            let url = URL(string: movie.poster!)
            let data = try? Data(contentsOf: url!)

            if let imageData = data {
                let image = UIImage(data: imageData)
                cell.imgPoster?.image = image
            }
        }
        
        return cell
    }
    

    var result:String?
    @IBAction func SHOWOMDB2() {
        let web = SFSafariViewController(url: URL(string:"https://www.imdb.com/title/tt0371746/?ref_=fn_al_tt_1")!)
        present(web,animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if result != nil {
            do {
                let data = result?.data(using: .utf8)
                let movies = try JSONDecoder().decode([MovieItem].self, from: data!)
                //movies.append(movie);
            }catch {
                
                do {
                    let data = result?.data(using: .utf8)
                    let movie = try JSONDecoder().decode(MovieItem.self, from: data!)
                    movies.append(movie)
                } catch {
                    print("There is an error/errors")
                }
            }
            
        }

    }

}
