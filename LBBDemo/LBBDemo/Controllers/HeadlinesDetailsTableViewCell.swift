//
//  HeadlinesDetailsTableViewCell.swift
//  MVVMDemo
//
//  Created by Poonam Sharma on 15/07/21.
//  Copyright © 2021 Conduent. All rights reserved.
//

import UIKit

class HeadlinesDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headlineImageView: UIImageView!
    var headlines: Article?
    var clickURL = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.cornerRadius = 8.0
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureCellData(headlines: Article?) {
        if let title = headlines?.title {
        self.titleLabel.attributedText = NSMutableAttributedString().boldString("Title: ", title, font: UIFont.init(name: "Arial", size: 14.0)!)
        }
        if let description = headlines?.description {
            self.descriptionLabel.attributedText = NSMutableAttributedString().boldString("Description: ", description, font: UIFont.init(name: "Arial", size: 14.0)!)
        }
        if let url = headlines?.url {
          clickURL = url
            self.urlLabel.text = "URL: " +  url
            self.urlLabel.attributedText = NSMutableAttributedString().link(url, font: UIFont.init(name: "Arial", size: 12.0)!)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
            self.urlLabel.isUserInteractionEnabled = true
            self.urlLabel.addGestureRecognizer(tap)
        }
        if let publishedAT = headlines?.publishedAt {
            self.publishedAtLabel.attributedText = NSMutableAttributedString().boldString("Published At: ", publishedAT, font: UIFont.init(name: "Arial", size: 14.0)!)
        }
        if let author = headlines?.author {
            self.authorLabel.attributedText = NSMutableAttributedString().boldString("Author: ", author, font: UIFont.init(name: "Arial", size: 14.0)!)
        }
        if let content = headlines?.content {
            self.contentLabel.attributedText = NSMutableAttributedString().boldString("Content: ", content, font: UIFont.init(name: "Arial", size: 14.0)!)
        }
        if let url = URL(string: headlines?.urlToImage ?? "") {
            let data = try? Data(contentsOf: url)
            self.headlineImageView.image = UIImage(data: data ?? Data())
        }
    }
    @objc
        func tapFunction(sender:UITapGestureRecognizer) {
            if let url = URL(string: clickURL),
               UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
}
