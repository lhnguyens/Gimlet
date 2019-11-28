//
//  FrontPage.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-14.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//


import Foundation

struct Post: Decodable {
    var id: String
    var title: String
    var author: String
    var url: String
    var subredditNamePrefixed: String
    var score: Int
    var numComments: Int
    var thumbnail: String
    var permaLink: String
}


extension Post {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case url
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case numComments = "num_comments"
        case score
        case thumbnail = "thumbnail"
        case permalink = "permalink"

        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        let dataContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)

        id = try dataContainer.decode(String.self, forKey: .id)
        title = try dataContainer.decode(String.self, forKey: .title)
        author = try dataContainer.decode(String.self, forKey: .author)
        url = try dataContainer.decode(String.self, forKey: .url)
        subredditNamePrefixed = try dataContainer.decode(String.self, forKey: .subredditNamePrefixed)
        score = try dataContainer.decode(Int.self, forKey: .score)
        numComments = try dataContainer.decode(Int.self, forKey: .numComments)
        thumbnail = try dataContainer.decode(String.self, forKey: .thumbnail)
        permaLink = try dataContainer.decode(String.self, forKey: .permalink)
    }
}

struct Listing: Decodable {
    var posts = [Post]()
}


extension Listing {
    enum CodingKeys: String, CodingKey {
        case posts = "children"
        
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let data = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        posts = try data.decode([Post].self, forKey: .posts)
    }
}
