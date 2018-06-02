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
    
    public func getTrendingRepositoriesQuery(platform: String, completionBlock: @escaping ([GithubRepository]) -> Void) {
        return githubTrendingUseCase.getTrendingRepositories(platform: platform, completionBlock: completionBlock)
    }
    
    public func getContributorsNumberForRepository(repository: GithubRepository, completionBlock: @escaping(Int) -> Void) {
        return githubTrendingUseCase.getContributorsNumberForRepository(repository: repository,completionBlock: completionBlock)
    }
    
    public func getApiPlatformWithPlatform(platform: String) -> String {
        let apiPlatform = platform == GithubTrendingConstants.Platforms.ios ? GithubTrendingConstants.API.ios : GithubTrendingConstants.API.android
        return apiPlatform
    }
}
