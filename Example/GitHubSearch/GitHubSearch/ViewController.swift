//
//  ViewController.swift
//  GitHubSearch
//
//  Created by heyji on 2022/02/20.
//

import UIKit

class ViewController: UIViewController {
    let accept = "application/vnd.github.v3+json"
    let q = "tetris"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // using URLSession
        let strURL = "https://api.github.com/search/repositories?q=\(q)&sort=stars&order=desc"
        guard let url = URL(string: strURL) else { return }
        var request = URLRequest(url: url)
        request.addValue(accept, forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let dic = try JSONSerialization.jsonObject(with: data, options: [])
                print(dic)
                
                
                
            } catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }

    

}

