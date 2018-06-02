//
//  ViewController.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import UIKit
import RealmSwift

class GithubTrendingViewController: UITableViewController {
    private let githubTrendingProvider = GithubTrendingProvider()
    private var githubRepositories = List<GithubRepository>()
    private var androidButton: UIBarButtonItem = UIBarButtonItem(title: GithubTrendingConstants.String.showAndroid, style: .done, target: self, action: #selector(GithubTrendingViewController.myRightSideBarButtonItemTapped))
    private var platform = GithubTrendingConstants.Platforms.ios
    private var indicator = UIActivityIndicatorView()
    
    func activityIndicator() {
        self.tableView.backgroundView = indicator
        self.tableView.separatorStyle = .none
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.center = self.view.center
        indicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        self.tableView.separatorStyle = .singleLine
        indicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = androidButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: GithubTrendingConstants.String.showAndroid, style: .done, target: self, action: #selector(GithubTrendingViewController.myRightSideBarButtonItemTapped))

        let nib = UINib(nibName: GithubTrendingConstants.Cells.trendingCellNibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: GithubTrendingConstants.Cells.trendingCellIdentifier)
        
        
        self.getRepositories(platform: platform)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRepositories(platform: String) {
        self.githubRepositories.removeAll()
        self.tableView.reloadData()
        self.title = "\(GithubTrendingConstants.String.homePageTitle) \(platform)"

        
        self.activityIndicator()
        let apiPlatform = self.githubTrendingProvider.getApiPlatformWithPlatform(platform: platform)
        self.githubTrendingProvider.getTrendingRepositoriesQuery(platform: apiPlatform) { [weak self] result in
            self?.githubRepositories = result
            DispatchQueue.main.async {
                self?.stopActivityIndicator()
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
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        self.platform = self.platform == GithubTrendingConstants.Platforms.android ? GithubTrendingConstants.Platforms.ios : GithubTrendingConstants.Platforms.android
        self.navigationItem.rightBarButtonItem?.title = self.platform == GithubTrendingConstants.Platforms.android ? GithubTrendingConstants.String.showIOS : GithubTrendingConstants.String.showAndroid
        self.getRepositories(platform: self.platform)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.githubRepositories.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(GithubTrendingConstants.Config.trendingViewCellHeight)
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

