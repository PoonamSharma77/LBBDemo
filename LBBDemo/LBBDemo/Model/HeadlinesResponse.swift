//
//  HeadlinesResponse.swift
//  MVVMDemo
//
//  Created by Poonam Sharma on 13/07/21.
//  Copyright © 2021 Conduent. All rights reserved.
//

import Foundation
struct HeadlinesResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let imageData: Data?
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String
}
