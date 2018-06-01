//
//  ViewController.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import UIKit

class GithubTrendingViewController: UITableViewController {
    private let githubTrendingProvider = GithubTrendingProvider()
    private var githubRepositories = [GithubRepository]()
    var androidButton: UIBarButtonItem = UIBarButtonItem(title: GithubTrendingConstants.String.showAndroid, style: .done, target: self, action: #selector(GithubTrendingViewController.myRightSideBarButtonItemTapped))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = GithubTrendingConstants.String.homePageTitle
        self.navigationItem.rightBarButtonItem = androidButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Android", style: .done, target: self, action: #selector(GithubTrendingViewController.myRightSideBarButtonItemTapped))

        
        let nib = UINib(nibName: "GithubTrendingCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: GithubTrendingConstants.Cells.trendingCellIdentifier)
        
        self.githubTrendingProvider.getTrendingRepositoriesQuery(platform: GithubTrendingConstants.API.ios) { [weak self] result in
            self?.githubRepositories = result
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }

            let myGroup = DispatchGroup()
            for repository in (self?.githubRepositories)! {
                myGroup.enter()
                self?.githubTrendingProvider.getContributorsNumberForRepository(repository: repository, completionBlock: { result in
                    repository.contributors = result
                    myGroup.leave()
                })
            }
            myGroup.notify(queue: .main) {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        self.navigationItem.rightBarButtonItem?.title = self.navigationItem.rightBarButtonItem?.title == GithubTrendingConstants.String.showAndroid ? GithubTrendingConstants.String.showIOS : GithubTrendingConstants.String.showAndroid
        
        print("myRightSideBarButtonItemTapped")
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
        cell.setRepository(repository: repository)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repository = self.githubRepositories[indexPath.row]
        let detailViewController = GithubRepositoryDetailViewController()
        detailViewController.setRepository(repository: repository)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

