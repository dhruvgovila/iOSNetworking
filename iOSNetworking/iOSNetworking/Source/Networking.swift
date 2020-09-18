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
        
        guard let request = createURLRequest(requestData: requestData) else {
            return
        }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            completionHandler(data, response, error)
        })
        task.resume()
    }
    
    internal func createURLRequest(requestData: NetworkRequestParams) -> URLRequest? {
        
        guard let url = URL(string: requestData.url) else {
            return nil
        }
        
        switch requestData.method {
        case .post :
            if requestData.requestBody == nil {
                return nil
            }
        default:
            break
        }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = requestData.method.rawValue
        request.httpBody = requestData.requestBody
        
        if let headerParams = requestData.headerParams {
            for (key, value) in headerParams {
                request.setValue(value, forHTTPHeaderField: key.rawValue)
            }
        }
        
        return request as URLRequest
    }
}



