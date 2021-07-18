//
//  HeadlinesManager.swift
//  LBBDemo
//
//  Created by Poonam Sharma on 18/07/21.
//

import Foundation
import CoreData
struct HeadlinesManager {
    private let _headlinesDataRepository = HeadlinesDataRepository()
    func saveHeadlines(headline: [Article], index: Int, data: Data?)  {
        _headlinesDataRepository.create(headline: headline, index: index, data: data)
    }
    func fetchHeadlines() -> [Article] {
        return _headlinesDataRepository.getAll() ?? []
    }
}
