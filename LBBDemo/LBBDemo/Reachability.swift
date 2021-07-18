//
//  Reachability.swift
//  LBBDemo
//
//  Created by Poonam Sharma on 18/07/21.
//

import Foundation
import Network

public class Reachability {
    var pathMonitor: NWPathMonitor!
    var path: NWPath?
    lazy var pathUpdateHandler: ((NWPath) -> Void) = { path in
     self.path = path
     if path.status == NWPath.Status.satisfied {
         print("Connected")
     } else if path.status == NWPath.Status.unsatisfied {
         print("unsatisfied")
     } else if path.status == NWPath.Status.requiresConnection {
         print("requiresConnection")
     }
 }

 let backgroudQueue = DispatchQueue.global(qos: .background)
 init() {
     pathMonitor = NWPathMonitor()
     pathMonitor.pathUpdateHandler = self.pathUpdateHandler
     pathMonitor.start(queue: backgroudQueue)
    }

  func isNetworkAvailable() -> Bool {
         if let path = self.path {
            if path.status == NWPath.Status.satisfied {
             return true
           }
         }
        return false
    }
  }
