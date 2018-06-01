//
//  GithubTrendingProvider.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation

public class GithubTrendingProvider {
    private var githubTrendingUseCase:GithubTrendingUseCase
    
    public init() {
        self.githubTrendingUseCase = GithubTrendingUseCase(networkRepository: GithubTrendingNetworkRepository())
    }
    
    public func getTrendingRepositoriesQuery(completionBlock: @escaping ([GithubRepository]) -> Void) {
        return githubTrendingUseCase.getTrendingRepositories(completionBlock: completionBlock)
    }
}
