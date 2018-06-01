//
//  GithubTrendingConstants.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation

enum GithubTrendingConstants {
    struct API {
        static let urlString = "https://api.github.com/search/repositories?q=language:swift&sort=stars&order=desc"
    }
    
    struct Cells {
        static let trendingCellIdentifier = "trendingCellIdentifier"
    }
}
