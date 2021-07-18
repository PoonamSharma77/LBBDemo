//
//  HeadlinesRepository.swift
//  LBBDemo
//
//  Created by Poonam Sharma on 17/07/21.
//

import Foundation
import CoreData
protocol HeadlinesRepository {
    func create(headline: [Article], index: Int, data: Data?)
    func getAll() -> [Article]?
}
struct HeadlinesDataRepository: HeadlinesRepository {
    func create(headline: [Article], index: Int, data: Data?) {
        let headlineObj = Headlines(context: PersistenceStorage.shared.context)
        
        let exist = getAll()
        if exist?.count ?? 0 > 20 {
            return
        }
        
        headlineObj.articleName = headline[index].source.name
        headlineObj.title = headline[index].title
        headlineObj.desc = headline[index].description
        headlineObj.author = headline[index].author
        headlineObj.url = headline[index].url
        headlineObj.publishedAt = headline[index].publishedAt
        headlineObj.urlToImage  = headline[index].urlToImage
        headlineObj.content = headline[index].content
        headlineObj.imageData = data
        PersistenceStorage.shared.saveContext()
    }
    
    func getAll() -> [Article]? {
        let result =   PersistenceStorage.shared.fetchManagedObject(managedObject: Headlines.self)
        var article:[Article] = []
        
        result?.forEach({ (headline) in
            article.append(headline.convertToArticle())
        })
        
        return article
    }
}
