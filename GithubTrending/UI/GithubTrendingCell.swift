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
    
    private var repository: GithubRepository?
    
    func setRepository(repository: GithubRepository) {
        self.repository = repository
        self.setUI()
    }
    
    func setUI() {
        guard let repository = repository else {
            return
        }
        self.nameLabel.text = repository.name
        self.starsLabel.text = "\(repository.stars ?? 0)"
        self.contributorsLabel.text = repository.license?.name
    }
}
