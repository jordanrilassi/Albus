//
//  GithubRepository.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import ObjectMapper

public class GithubRepository: Mappable {
    var idRepo: Int!
    var name: String?
    var owner: Owner?
    var license: License?
    var contributors: Int?
    var stars: Int?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        idRepo                  <- map["id"]
        name                    <- map["name"]
        stars                   <- map["stargazers_count"]
        license                 <- map["license"]
        owner                   <- map["owner"]
    }
}
