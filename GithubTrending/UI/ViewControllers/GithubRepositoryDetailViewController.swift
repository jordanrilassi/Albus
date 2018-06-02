//
//  GithubRepositoryDetailViewController.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import UIKit

class GithubRepositoryDetailViewController : UITableViewController {
    private var repository: GithubRepository? {
        didSet {
            setUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: GithubTrendingConstants.Cells.detailCellNibName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: GithubTrendingConstants.Cells.detailCellIdentifier)
    }
    
    func setRepository(repository: GithubRepository) {
        self.repository = repository
    }
    
    func setUI() {
        self.title = repository?.name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GithubTrendingConstants.Config.numberOfCells
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTrendingConstants.Cells.detailCellIdentifier, for: indexPath) as! GithubDetailCell
        if indexPath.row == 0 {
            cell.titleLabel.text = "Author :"
            cell.contentLabel.text = repository?.owner?.login
        } else if indexPath.row == 1 {
            cell.titleLabel.text = "Description : "
            cell.contentLabel.text = repository?.repoDescription
        } else {
            cell.titleLabel.text = "Number of contributors : "
            cell.contentLabel.text = "\(repository?.contributors ?? 0)"
        }
        return cell
    }
}
