//
//  GithubTrendingCell.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import UIKit

class GithubTrendingCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var contributorsLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    
    private var repository: GithubRepository? {
        didSet {
            setUI()
        }
    }
    
    func setRepository(repository: GithubRepository) {
        self.repository = repository
    }
    
    func setUI() {
        guard let repository = repository else {
            return
        }
        self.nameLabel.text = "\(repository.owner?.login ?? "no author name") / \(repository.name ?? "no repo name")"
        self.starsLabel.text = "\u{02b50} \(repository.stars ?? 0)"
        if let numberOfContributors = repository.contributors {
            self.contributorsLabel.text = "\u{1f477} \(numberOfContributors == 100 ? "+100" : "\(numberOfContributors)")"
        } else {
            self.contributorsLabel.text = ""
        }
       
        self.licenseLabel.text = repository.license != nil ? repository.license?.name : "no license"
    }
}
