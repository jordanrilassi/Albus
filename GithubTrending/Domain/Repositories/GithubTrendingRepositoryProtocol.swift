//
//  GithubTrendingRepositoryProtocol.swift
//  GithubTrending
//
//  Created by KZLW4997 on 02/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation

public protocol GithubTrendingRepositoryProtocol {
    func getTrendingRepositoriesQuery(platform: String, completionBlock: @escaping ([GithubRepository]) -> Void) -> Void
    func getContributorsNumberForRepository(repository: GithubRepository, completionBlock: @escaping(Int) -> Void)
}
