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
    var realm: Realm!
    
    func getTrendingRepositoriesQuery(platform: String, completionBlock: @escaping ([GithubRepository]) -> Void) {
        
    }
    
    func getContributorsNumberForRepository(repository: GithubRepository, completionBlock: @escaping (Int) -> Void) {
        
    }
    
    func setupRealm() {
        // Log in existing user with username and password
        let username = "jordan.rilassi@gmail.com"  // <--- Update this
        let password = "mavieprivee"  // <--- Update this
        
        SyncUser.logIn(with: .usernamePassword(username: username, password: password, register: false), server: URL(string: "http://127.0.0.1:9080")!) { user, error in
            guard let user = user else {
                fatalError(String(describing: error))
            }
            
            DispatchQueue.main.async {
                // Open Realm
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realmtestjordan.us1.cloud.realm.io")!)
                )
                self.realm = try! Realm(configuration: configuration)
                
                // Show initial tasks
//                func updateList() {
//                    if self.items.realm == nil, let list = self.realm.objects(TaskList.self).first {
//                        self.items = list.items
//                    }
//                    self.tableView.reloadData()
//                }
//                updateList()
//                
//                // Notify us when Realm changes
//                self.notificationToken = self.realm.observe { _,_ in
//                    updateList()
//                }
            }
        }
    }
}
