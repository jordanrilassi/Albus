//
//  License.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class License: Object, Mappable {
    var key: String?
    var name: String?
    var url: String?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        key             <- map["key"]
        name            <- map["name"]
        url             <- map["url"]
    }
}
