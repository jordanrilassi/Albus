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
        static let detailCellIdentifier = "detailCellIdentifier"
        static let trendingCellNibName = "GithubTrendingCell"
        static let detailCellNibName = "GithubDetailCell"
    }
    
    struct Platforms {
        static let android = "Android"
        static let ios = "iOS"
    }
    
    struct String {
        static let homePageTitle = "Trending"
        static let showIOS = "Show iOS"
        static let showAndroid = "Show Android"
    }
    
    struct Config {
        static let numberOfCells = 6
        static let trendingViewCellHeight = 80
        static let detailViewCellHeight = 60
    }
    
    struct Realm {
        static let MY_INSTANCE_ADDRESS = "githubtrendingtest.us1.cloud.realm.io" //
        
        static let AUTH_URL  = URL(string: "https://\(MY_INSTANCE_ADDRESS)")!
        static let REALM_URL = URL(string: "realms://\(MY_INSTANCE_ADDRESS)/ToDo")!
    }
}
