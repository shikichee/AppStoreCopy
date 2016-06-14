//
//  AppStoreService.swift
//  AppStoreCopy
//
//  Created by 敷地琢也 on 2016/06/14.
//  Copyright © 2016年 takuya shikichi. All rights reserved.
//

import Foundation
import Moya

enum AppStoreService {
    case Ranking
}

extension AppStoreService: TargetType{
    var baseURL: NSURL { return NSURL(string: "https://itunes.apple.com")! }
    var path: String {
        switch self {
        case .Ranking:
            return "/jp/rss/topfreeapplications/limit=30/json"
        }
    }
    var method: Moya.Method {
        switch self {
        case .Ranking:
            return .GET
        }
        
    }
    var parameters: [String : AnyObject]? {
        switch self {
        case .Ranking:
            return nil
        }
    }
    var sampleData: NSData {
        switch self {
        case .Ranking:
            return "AA".dataUsingEncoding(NSUTF8StringEncoding)!
        }
        
    }
}