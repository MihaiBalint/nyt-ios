//
//  BrowseArticlesViewController.swift
//  nyt-pop
//
//  Created by m on 7/15/18.
//  Copyright © 2018 mihai.ro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ArticleCell: UITableViewCell {

    @IBOutlet var media: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var agency: UILabel!
    @IBOutlet var timestamp: UILabel!
    var articleId: String?

    @IBAction func tapDetail(_ sender: Any) {

    }

    func populate(_ article: Article) {
        self.title.text = article.title
        self.author.text = article.author ?? ""
        self.agency.text = article.agency ?? ""
        self.timestamp.text = article.timestampString ?? ""
        self.articleId = article.id
        if let img = article.imageUrl, img != "" {
            Alamofire.request(img).responseImage { response in
                guard let image = response.result.value else { return }
                DispatchQueue.main.async(execute: {
                    guard self.articleId == article.id else { return }
                    self.media.image = image.af_imageRoundedIntoCircle()
                })
            }
        }
        // self.media.image = UIImage(contentsOf)
    }

    override func prepareForReuse() {
        self.articleId = nil
        self.media.image = #imageLiteral(resourceName: "nyt-favicon")
    }
}

class BrowseArticlesViewController: UIViewController {
    @IBOutlet var articles: UITableView!
    private let model = AppModel.shared
    private let service = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.query()
    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(BrowseArticlesViewController.reloadArticles), name: AppModel.PopularUpdatedNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: AppModel.PopularUpdatedNotification, object: nil)
    }

    @objc func reloadArticles() {
        self.articles.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BrowseArticlesViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.popular.articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell")! as! ArticleCell
        let article = self.model.popular.articles[indexPath.row]
        cell.populate(article)
        return cell
    }


}

class ArticleDetailViewController: UIViewController {
    @IBOutlet var author: UILabel!
    @IBOutlet var agency: UILabel!
    @IBOutlet var timestamp: UILabel!
    @IBOutlet var summary: UILabel!
    
}
