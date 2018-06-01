//
//  GithubTrendingUseCase.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation

public protocol GithubTrendingUseCaseProtocol {
    func getTrendingRepositories(completionBlock: @escaping ([GithubRepository]) -> Void) -> Void
}

final class GithubTrendingUseCase: GithubTrendingUseCaseProtocol {
    
    
    private let networkRepository: GithubTrendingNetworkRepository
    
    init(networkRepository: GithubTrendingNetworkRepository) {
        self.networkRepository = networkRepository
    }

    func getTrendingRepositories(completionBlock: @escaping ([GithubRepository]) -> Void) {
        self.networkRepository.getTrendingRepositoriesQuery(completionBlock: completionBlock)
    }
}
