//
//  ArticleCardCell.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 27/09/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import UIKit

class ArticleCardCell: UICollectionViewCell {
    @IBOutlet private var articleImage: UIImageView!
    @IBOutlet private var articleTitle: UILabel!
    @IBOutlet private var articleDescription: UILabel!
    @IBOutlet private var articleAuthor: UILabel!
    @IBOutlet private var articleCardContainer: UIView!

    let newsAPIAdapter = NewsAPIAdapter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleCardContainer.layer.cornerRadius = 20
        articleCardContainer.layer.masksToBounds = true
    }

    func configure(article: Article) {
        articleTitle.text = article.title
        articleDescription.text = article.description
        articleAuthor.text = article.author
        newsAPIAdapter.fetchArticleImage(url: article.urlToImage) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.articleImage.contentMode = .scaleAspectFill
                    self.articleImage.image = UIImage(data: data)
                case .failure(let error):
                    print("Could not fetch image: \(error)")
                    self.articleImage.backgroundColor = .lightGray
                }
            }
        }
    }
}
