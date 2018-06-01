//
//  ViewController.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    private let githubTrendingProvider = GithubTrendingProvider()
    private var githubRepositories = [GithubRepository]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "GithubTrendingCell", bundle: nil), forCellReuseIdentifier: GithubTrendingConstants.Cells.trendingCellIdentifier)
        
        self.githubTrendingProvider.getTrendingRepositoriesQuery { [weak self] result in
            self?.githubRepositories = result
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.githubRepositories.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTrendingConstants.Cells.trendingCellIdentifier, for: indexPath) as! GithubTrendingCell
        let repository = githubRepositories[indexPath.row]
//        cell.nameLabel.text = repository.name
        cell.setRepository(repository: repository)
        return cell
    }
}

