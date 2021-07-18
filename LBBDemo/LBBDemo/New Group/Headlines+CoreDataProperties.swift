//
//  Headlines+CoreDataProperties.swift
//  LBBDemo
//
//  Created by Poonam Sharma on 18/07/21.
//
//

import Foundation
import CoreData


extension Headlines {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Headlines> {
        return NSFetchRequest<Headlines>(entityName: "Headlines")
    }

    @NSManaged public var articleName: String?
    @NSManaged public var author: String?
    @NSManaged public var desc: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var publishedAt: String?
    @NSManaged public var content: String?
    @NSManaged public var imageData: Data?

    func convertToArticle() -> Article {
        return Article(source: Source(id: "", name: self.articleName ?? ""), author: self.author, title: self.title, description: self.desc, url: self.url, urlToImage: self.urlToImage, publishedAt: self.publishedAt, content: self.content, imageData: imageData)
    }
}

extension Headlines : Identifiable {

}
