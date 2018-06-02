//
//  GithubTrendingNetworkRepository.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class GithubTrendingNetworkRepository: GithubTrendingRepositoryProtocol {
    
    func getTrendingRepositoriesQuery(platform: String, completionBlock: @escaping (List<GithubRepository>) -> Void) -> Void {
        guard let url = URL(string: "\(GithubTrendingConstants.API.urlString)\(platform)\(GithubTrendingConstants.API.parameters)") else {
            fatalError("Url not valid")
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                fatalError(error!.localizedDescription)
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, AnyObject>
            guard let jsonData = json["items"] else {
                return
            }
            
            guard let repositories = Mapper<GithubRepository>().mapArray(JSONObject: jsonData) else {
                completionBlock(List<GithubRepository>())
                return
            }
            let repositoryList = List<GithubRepository>()
            for repository in repositories {
                repositoryList.append(repository)
            }
//            let cachedRepository = GithubCachedRepository()
//            cachedRepository.repositories = repositoryList
//            cachedRepository.saveRealmRepositoriesArray()
            
            completionBlock(repositoryList)
        }
        task.resume()
    }
    
    func getContributorsNumberForRepository(repository: GithubRepository, completionBlock: @escaping(Int) -> Void) {
//        guard let contributors_url = repository.contributors_url, let url = URL(string: "\(contributors_url)?per_page=100") else {
//            fatalError("Url not valid")
//        }
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if error != nil {
//                fatalError(error!.localizedDescription)
//            }
//            guard let data = data else {
//                print("Data is empty")
//                return
//            }
//            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
//            guard let users = Mapper<Owner>().mapArray(JSONObject: json) else {
//                completionBlock(0)
//                return
//            }
//            completionBlock(users.count)
//        }
//        task.resume()
        completionBlock(0)

    }
}
