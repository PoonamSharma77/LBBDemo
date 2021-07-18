//
//  HeadlineViewModel.swift
//  MVVMDemo
//
//  Created by Poonam Sharma on 13/07/21.
//  Copyright © 2021 Conduent. All rights reserved.
//

import Foundation
import Foundation
protocol HeadlineViewModelDelegate {
    func didReceiveHeadlineResponse(response: HeadlinesResponse)
}
struct HeadlineViewModel {
    var delegate: HeadlineViewModelDelegate?
    func getHeadlines(request: HeadlinesRequest) {
        
        let headlineResource = HeadlineResource()
        headlineResource.getHeadlines(request: request) { (headlineResponse) in
            DispatchQueue.main.async {
                self.delegate?.didReceiveHeadlineResponse(response: headlineResponse)
            }
        }
    }
}
