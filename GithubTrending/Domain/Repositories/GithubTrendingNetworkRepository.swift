//
//  GithubTrendingNetworkRepository.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import ObjectMapper

class GithubTrendingNetworkRepository {
    
    func getTrendingRepositoriesQuery(completionBlock: @escaping ([GithubRepository]) -> Void) -> Void {
        guard let url = URL(string: GithubTrendingConstants.API.urlString) else {
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
            print(json)
            guard let jsonData = json["items"] else {
                return
            }
//            var repositories = Mapper<GithubRepository>().mapArray(JSONArray: jsonData)! //Swift 3
            let repositories = Mapper<GithubRepository>().mapArray(JSONObject: jsonData)
            completionBlock(repositories!)
//            if let restaurant = Mapper<Restaurant>().map(JSONObject: jsonData) {
                //                completionBlock(restaurant)
                //            }
        }
        task.resume()
    }
}
