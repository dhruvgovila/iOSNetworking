//
//  Netwoking.swift
//  iOSNetworking
//
//  Created by Govila, Dhruv on 04/03/20.
//  Copyright © 2020 Govila, Dhruv (US - Bengaluru). All rights reserved.
//

import Foundation
let session = URLSession.shared

open class Networking {
    
    public static let shared: Networking = Networking()
    
    open func makeApiCall(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: "https://learnappmaking.com/ex/users.json")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            completionHandler(data, response, error)
        })
        task.resume()
    }
    
    open func makeAnotherApiCall() -> Bool {
        return true
    }
}



