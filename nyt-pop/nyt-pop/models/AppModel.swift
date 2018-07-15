//
//  AppModel.swift
//  nyt-pop
//
//  Created by m on 7/15/18.
//  Copyright © 2018 mihai.ro. All rights reserved.
//

import Foundation

class AppModel {
    static let PopularUpdatedNotification = NSNotification.Name("PopularUpdatedNotification")
    
    static let shared = AppModel()

    let popular: ArticleCollection

    private init() {
        self.popular = ArticleCollection("all-sections", "Most popular in all sections")
    }

    func replacePopularArticles(_ newPopularArticles: [Article]) {
        self.popular.articles.removeAll()
        self.popular.articles.append(contentsOf: newPopularArticles)
        NotificationCenter.default.post(name: AppModel.PopularUpdatedNotification, object: nil)
    }
}
