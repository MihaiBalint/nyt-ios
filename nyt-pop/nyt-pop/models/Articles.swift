//
//  Articles.swift
//  nyt-pop
//
//  Created by m on 7/15/18.
//  Copyright © 2018 mihai.ro. All rights reserved.
//

import Foundation

class Article {
    let id: String
    let title: String
    var summary: String?
    var author: String?
    var agency: String?
    var timestamp: Date?
    var timestampString: String?
    var url: String?
    var imageUrl: String?

    init(_ id: String, _ title: String) {
        self.id = id
        self.title = title
    }
}

class ArticleCollection {
    let id: String
    let description: String
    var articles: [Article] = []

    init(_ id: String, _ description: String) {
        self.id = id
        self.description = description
    }
}
