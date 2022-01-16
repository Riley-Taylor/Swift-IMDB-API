//
//  MovieLookerViewController.swift
//  MovieSearch
//
//  Created by RTAYLO25 on 12/6/21.
//  Copyright © 2021 Auburn University at Montgomery. All rights reserved.
//
import UIKit

class MovieLookerViewController: UIViewController {
    
    @IBOutlet weak var tbTitle:UITextField?
    @IBOutlet weak var tbYear:UITextField?
    var result = ""
    
    @IBAction func onSearch() {
        var title = ""
        var year = ""
        let apikey = "d59013d4"

        if(tbTitle != nil) {
            if(tbTitle!.hasText) {
                title = tbTitle!.text!
            }
        }
        else {print("Title is nil")}
        
        if(tbYear != nil) {
            if(tbYear!.hasText) {
                year = tbYear!.text!
            }
        }
        
        if title.contains(" ") {
            title = title.replacingOccurrences(of: " ", with: "%20")
        }
        
        let requestURL = "http://www.omdbapi.com/?t=\(title)&y=\(year)&apikey=\(apikey)"
        
        let url = URL(string: requestURL)
        guard let request_url = url else { fatalError() }
        
        var request = URLRequest(url: request_url)

        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error occured \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                self.result = dataString
            }
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showResult", sender: nil)
            }
            
        }
        task.resume()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destination = segue.destination as! MovieResultViewController
            destination.result = self.result
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


