//
//  QiitaAPI.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import Moya

enum QiitaAPI {
    case getQiita
}

extension QiitaAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://qiita.com")!
    }
    
    var path: String {
        return "/api/v2/items"
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["per_page": "10", "query": "swift"],
                                  encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
