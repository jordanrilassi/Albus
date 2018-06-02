//
//  GithubTrendingUseCase.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation

public protocol GithubTrendingUseCaseProtocol {
    func getTrendingRepositories(platform: String, completionBlock: @escaping ([GithubRepository]) -> Void) -> Void
    func getContributorsNumberForRepository(repository: GithubRepository, completionBlock: @escaping(Int) -> Void)
}

final class GithubTrendingUseCase: GithubTrendingUseCaseProtocol {
    
    private let networkRepository: GithubTrendingNetworkRepository
//    private let cachedRepository: Github
    
    init(networkRepository: GithubTrendingNetworkRepository) {
        self.networkRepository = networkRepository
    }

    func getTrendingRepositories(platform: String, completionBlock: @escaping ([GithubRepository]) -> Void) {
        self.networkRepository.getTrendingRepositoriesQuery(platform: platform, completionBlock: completionBlock)
    }
    
    func getContributorsNumberForRepository(repository: GithubRepository, completionBlock: @escaping(Int) -> Void) {
        self.networkRepository.getContributorsNumberForRepository(repository: repository, completionBlock: completionBlock)
    }
}
