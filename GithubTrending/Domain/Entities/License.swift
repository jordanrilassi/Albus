//
//  License.swift
//  GithubTrending
//
//  Created by KZLW4997 on 01/06/2018.
//  Copyright © 2018 jordanrilassi. All rights reserved.
//

import Foundation
import ObjectMapper

public class License: Mappable {
    var key: String?
    var name: String?
    var url: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        key             <- map["key"]
        name            <- map["name"]
        url             <- map["url"]
    }
}
