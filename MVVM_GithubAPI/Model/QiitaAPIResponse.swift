//
//  QiitaAPIResponse.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import Foundation

struct  QiitaItem: Codable {
    let title: String
    let url: String
    let user: User
}

struct User: Codable {
    let id: String
    let name: String
    let profileImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case profileImageURL = "profile_image_url"
    }
}
