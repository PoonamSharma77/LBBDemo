//
//  HeadlineResource.swift
//  MVVMDemo
//
//  Created by Poonam Sharma on 13/07/21.
//  Copyright © 2021 Conduent. All rights reserved.
//

import Foundation
import UIKit

struct HeadlineResource {
    func getHeadlines(request: HeadlinesRequest, completionHandler: @escaping(_ _result: HeadlinesResponse)-> Void) {
        let headlineURL = URL(string: APIEndPoints.headlineAPI)!
        let httpUtility = HttpUtility()
            httpUtility.getAPIData(requestURL: headlineURL, resultType: HeadlinesResponse.self) { (headlineAPIResponse) in
                completionHandler(headlineAPIResponse!)
    }
}
}
