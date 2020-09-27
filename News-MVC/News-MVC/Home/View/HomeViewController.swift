//
//  TopHeadlinesViewController.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 18/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

final class HomeViewController: UICollectionViewController {
    let newsAPIAdapter = NewsAPIAdapter()
    let topHeadlinesEndpoint = NewsAPIEndpoint.topHeadlines(country: "us", sources: nil, category: nil, query: nil)

    var articles: [Article] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    let carouselReuseId: String = "ArticleCardCell"

    init(sectionFactory: CompositionalLayoutSectionFactory = CompositionalLayoutSectionFactory()) {
        let layout = UICollectionViewCompositionalLayout {  (sectionNumber, env) -> NSCollectionLayoutSection in
            sectionFactory.createHeroCarousel()
        }
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ArticleCardCell", bundle: nil),
                                forCellWithReuseIdentifier: carouselReuseId)
        fetchTopHeadlines()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: carouselReuseId, for: indexPath) as? ArticleCardCell else {
            return UICollectionViewCell()
        }
        cell.configure(article: articles[indexPath.row])
        return cell
    }
    
    func fetchTopHeadlines() {
        newsAPIAdapter.fetchArticles(endpoint: topHeadlinesEndpoint) { (result: Result<TopHeadlines, Error>) in
            switch result {
            case .success(let topHeadlines):
                self.articles = topHeadlines.articles
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct CompositionalLayoutSectionFactory {
    func createHeroCarousel() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .absolute(600)))
        item.contentInsets.trailing = 30
        item.contentInsets.leading = 30
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .absolute(600)),
                                                       subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
}
