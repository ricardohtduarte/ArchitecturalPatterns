//
//  TopHeadlinesViewController.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 18/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

class TopHeadlinesViewController: UIViewController {
    let newsAPIRouter = NewsAPIRouter()

    var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTopHeadlines()
    }

    func fetchTopHeadlines() {
        newsAPIRouter.fetchTopHeadlines(country: "us",
                                        sources: nil,
                                        category: nil,
                                        query: nil) { (result: Result<TopHeadlines, Error>) in
            switch result {
            case .success(let topHeadlines):
                self.articles = topHeadlines.articles
            case .failure(let error):
                print(error)
            }
        }
    }
}
