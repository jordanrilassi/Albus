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
        static let urlString = "https://api.github.com/search/repositories"
        static let ios = "?q=language:swift"
        static let android = "?q=language:kotlin"
        static let parameters = "&sort=stars&order=desc"
    }
    
    struct Cells {
        static let trendingCellIdentifier = "trendingCellIdentifier"
    }
    
    struct String {
        static let homePageTitle = "Trending"
        static let showIOS = "Show iOS"
        static let showAndroid = "Show Android"
    }
}
