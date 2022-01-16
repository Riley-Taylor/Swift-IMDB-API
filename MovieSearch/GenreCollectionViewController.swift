//
//  GenreCollectionViewController.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 11/26/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var Year: UISegmentedControl! //this is for uh.. the year of movie
    @IBAction func SelectYear(sender: AnyObject) {
        if (Year.selectedSegmentIndex == 0)
        {
            print ("2019")
        }
    }
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let manager = GenreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetch()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! CollectionViewCell
        
        let item = manager.explore(at: indexPath)
        cell.GenreView.image = UIImage(named: item.GenreView)
 
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    // Add Unwind here
    @IBAction func unwindYearCancel(segue:UIStoryboardSegue) {
            print("Press cancel button")
        }

        @IBAction func unwindYearDone(segue:UIStoryboardSegue)
        {
            print("Press done button")
        }
}
