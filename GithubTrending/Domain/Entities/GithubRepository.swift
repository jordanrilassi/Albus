//
//  GithubRepository.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class GithubRepository: Object, Mappable {
    var idRepo: Int!
    var name: String?
    var repoDescription: String?
    var owner: Owner?
    var license: License?
    var contributors: Int?
    var stars: Int?
    var contributors_url: String?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        idRepo                  <- map["id"]
        name                    <- map["name"]
        repoDescription         <- map["description"]
        stars                   <- map["stargazers_count"]
        license                 <- map["license"]
        owner                   <- map["owner"]
        contributors_url        <- map["contributors_url"]
    }
}
