//
//  TweetTableViewController.swift
//  Smashtag
//
//  Created by heyji on 2022/05/22.
//

import UIKit

class TweetTableViewController: UITableViewController {
    
    // 1. 모델 정의
    private var tweets = [Array<Tweet>]()
    var searchText: String? {
        didSet {
            tweets.removeAll()
            tableView.reloadData()
            searchForTweets()
            title = searchText
        }
    }
    
    private func twitterRequest() -> TwitterRequest {
        if let query = searchText, !query.isEmpty {
            return Request(search: query, count: 100)
        }
    }
    
    private func searchForTweets() {
        self.refreshControl?.endRefreshing()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 개발하고 테스트할 때 많이 사용
        searchText = "#stanford"
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
}
