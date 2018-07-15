//
//  ApiService.swift
//  nyt-pop
//
//  Created by m on 7/15/18.
//  Copyright © 2018 mihai.ro. All rights reserved.
//

import Foundation

class ApiService {
    let key: String

    init(_ key: String? = nil) {
        self.key = key ?? ApiKeys.NYT_KEY
    }

    func query() {
        let m = AppModel.shared
        let a1 = Article("100000005955815", "Opposition to Breast-Feeding Resolution by U.S. Stuns World Health Officials")
        a1.agency = "The New York Times"
        a1.author = "By ANDREW JACOBS"
        a1.summary = "Trade sanctions. Withdrawal of military aid. The Trump administration used both to try to block a measure that was considered uncontroversial and embraced by countries around the world."
        a1.timestampString = "2018-07-08"
        a1.url = "https://www.nytimes.com/2018/07/08/health/world-health-breastfeeding-ecuador-trump.html"
        a1.imageUrl = "https://static01.nyt.com/images/2018/07/09/business/09breastfeeding-1-sub-2/merlin_74866264_0e99440c-95bc-40f5-8b74-c30bc48e93e4-square320.jpg"

        let a2 = Article("100000005995865", "Inside the Thailand Cave: The Obstacles That Rescuers Faced")
        a2.agency = "The New York Times"
        a2.author = "By GUILBERT GATES, TROY GRIGGS, DENISE LU, TIM WALLACE and JEREMY WHITE"
        a2.imageUrl = "https://static01.nyt.com/images/2018/07/07/us/inside-the-cave-rescuers-soccer-team-thailand-promo-1530979062697/inside-the-cave-rescuers-soccer-team-thailand-promo-1530979062697-square320.jpg"

        let a3 = Article("100000005999668", "Boris Johnson Has Ruined Britain")
        a3.agency = "Thomson"
        a3.author = "By JENNI RUSSELL"
        a3.imageUrl = "https://static01.nyt.com/images/2018/08/09/opinion/09russellSub/09russellSub-square320.jpg"

        let a4 = Article("100000005996800", "4 Team Members Are Out of Thailand Cave, With 9 to Go")
        a4.agency = "The New York Times"
        a4.author = "By THE NEW YORK TIMES"
        a4.imageUrl = "https://static01.nyt.com/images/2018/07/10/world/11THAILAND2-alpha/11THAILAND2-alpha-square320.jpg"

        m.replacePopularArticles([a1, a2, a3, a4])
    }

}
