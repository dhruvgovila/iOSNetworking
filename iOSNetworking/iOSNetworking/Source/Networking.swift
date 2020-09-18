//
//  Netwoking.swift
//  iOSNetworking
//
//  Created by Govila, Dhruv on 04/03/20.
//  Copyright © 2020 Govila, Dhruv (US - Bengaluru). All rights reserved.
//

import Foundation

public protocol NetworkingProvider{
    var networkingProvider: Networking { get }
}

public extension NetworkingProvider {
    var networkingProvider: Networking {
        NetworkingRegister()
    }
}

public protocol Networking {
    func registerNetworkRequest(requestData: NetworkRequestParams,
                                completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

struct NetworkingRegister: Networking {
    
    internal init(){}
    
    let session = URLSession.shared
    
    public func registerNetworkRequest(requestData: NetworkRequestParams, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let urlRequest = createURLRequest(requestData: requestData) else {
            return
        }
        
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            completionHandler(data, response, error)
        })
        task.resume()
    }
    
    internal func createURLRequest(requestData: NetworkRequestParams) -> URLRequest? {
        
        guard let url = URL(string: requestData.url) else {
            return nil
        }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = requestData.method.rawValue
        
        if let headerParams = requestData.headerParams {
            for (key, value) in headerParams {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request as URLRequest
    }
}



