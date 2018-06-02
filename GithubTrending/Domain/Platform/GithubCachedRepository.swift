//
//  GithubCachedRepository.swift
//  GithubTrending
//
//  Created by KZLW4997 on 02/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import RealmSwift

class GithubCachedRepository: GithubTrendingRepositoryProtocol {
    let realm: Realm
    var repositories = List<GithubRepository>()
    
    init() {
        let syncConfig = SyncConfiguration(user: SyncUser.current!, realmURL: GithubTrendingConstants.Realm.REALM_URL)
        self.realm = try! Realm(configuration: Realm.Configuration(syncConfiguration: syncConfig, objectTypes:[GithubRepository.self]))
    }

    func getTrendingRepositoriesQuery(platform: String, completionBlock: @escaping (List<GithubRepository>) -> Void) {
        if let list = self.realm.objects(RepositoryList.self).first {
            completionBlock(list.items)
        }
    }
    
    func getContributorsNumberForRepository(repository: GithubRepository, completionBlock: @escaping (Int) -> Void) {
        
    }
    
    @objc func saveRealmRepositoriesArray() {
        try! realm.write {
            realm.add(repositories)
        }
    }
}
