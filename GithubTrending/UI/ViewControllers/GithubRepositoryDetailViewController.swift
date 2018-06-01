//
//  GithubRepositoryDetailViewController.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import UIKit

class GithubRepositoryDetailViewController : UIViewController {
    private var repository: GithubRepository?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    func setRepository(repository: GithubRepository) {
        self.repository = repository
    }
    
    func setUI() {
        self.titleLabel.text = repository?.name
        self.descriptionLabel.text = repository?.repoDescription
        self.otherLabel.text = repository?.license?.name
    }
}
