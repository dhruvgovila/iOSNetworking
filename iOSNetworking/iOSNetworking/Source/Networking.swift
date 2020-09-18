//
//  Netwoking.swift
//  iOSNetworking
//
//  Created by Govila, Dhruv on 04/03/20.
//  Copyright © 2020 Govila, Dhruv (US - Bengaluru). All rights reserved.
//

import Foundation

public protocol Networking {
    func registerNetworkRequest(requestData: NetworkRequestParams,
                                completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

open class NetworkingRegister: Networking {
    
    let session = URLSession.shared
    
    public func registerNetworkRequest(requestData: NetworkRequestParams, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: requestData.url)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            completionHandler(data, response, error)
        })
        task.resume()
    }
}



