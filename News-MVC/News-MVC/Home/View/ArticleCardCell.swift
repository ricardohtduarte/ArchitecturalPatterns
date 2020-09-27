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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleImage.backgroundColor = .red
        articleCardContainer.layer.cornerRadius = 20
        articleImage.layer.cornerRadius = 20
    }

    func configure(article: Article) {
        articleTitle.text = article.title
        articleDescription.text = article.description
        articleAuthor.text = article.author
    }
}
