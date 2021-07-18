//
//  HttpUtility.swift
//  MVVMDemo
//
//  Created by Poonam Sharma on 15/03/21.
//  Copyright © 2021 Conduent. All rights reserved.
//

import Foundation
import UIKit

struct HttpUtility {
    func getAPIData<T:Decodable >(requestURL: URL, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        
        URLSession.shared.dataTask(with: requestURL) { (serviceData, serviceResponse, error) in
            if error == nil && serviceData!.count > 0 {
                
                do {
                    let decoder =  JSONDecoder()
                    let result = try decoder.decode(T.self, from: serviceData!)
                    completionHandler(result)
                } catch let error {
                        debugPrint(error)
                }
            }
        }.resume()
    }
    func postAPIData<T:Decodable >(requestURL: URL, requestBody: Data, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (serviceData, serviceResponse, error) in
            if error == nil && serviceData!.count > 0 {
                
                do {
                    let decoder =  JSONDecoder()
                    let result = try decoder.decode(T.self, from: serviceData!)
                    completionHandler(result)
                } catch let error {
                        debugPrint(error)
                }
            }
        }
    }
}
