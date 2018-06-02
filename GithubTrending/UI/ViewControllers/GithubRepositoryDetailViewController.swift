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
        return CGFloat(GithubTrendingConstants.Config.detailViewCellHeight)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GithubTrendingConstants.Cells.detailCellIdentifier, for: indexPath) as! GithubDetailCell
        if indexPath.row == 0 {
            cell.titleLabel.text = "\u{02139} Name :"
            cell.contentLabel.text = repository?.name
        }
        else if indexPath.row == 1 {
            cell.titleLabel.text = "\u{1f4dd} Author :"
            cell.contentLabel.text = repository?.owner?.login
        } else if indexPath.row == 2 {
            cell.titleLabel.text = "\u{1f4d6} Description : "
            cell.contentLabel.text = repository?.repoDescription
        } else if indexPath.row == 3 {
            cell.titleLabel.text = "\u{1f477} Contributors : "
            cell.contentLabel.text = "\(repository?.contributors ?? 0)"
        } else if indexPath.row == 4 {
            cell.titleLabel.text = "\u{02b50} Stars : "
            cell.contentLabel.text = "\(repository?.stars ?? 0)"
        } else if indexPath.row == 5 {
            cell.titleLabel.text = "\u{000a9} License : "
            var licenseName = "no license"
            if let repo = repository, let license = repo.license, let licName = license.name {
                licenseName = licName
            }
            cell.contentLabel.text = licenseName
        }
        return cell
    }
}
