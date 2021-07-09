//
//  Netwoking.swift
//  iOSNetworking
//
//  Created by Govila, Dhruv on 04/03/20.
//  Copyright Â© 2020 Govila, Dhruv (US - Bengaluru). All rights reserved.
//

import Foundation
import UIKit

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
//    func getImage(from url: String, completion: @escaping ((UIImage?) -> Void))
}

struct NetworkingRegister: Networking {
    
    internal init(){}
    
    let session = URLSession.shared
    
    public func registerNetworkRequest(requestData: NetworkRequestParams, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let request = createURLRequest(requestData: requestData) else {
            completionHandler(nil, nil, nil)
            return
        }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            completionHandler(data, response, error)
        })
        task.resume()
    }
    
    private func createURLRequest(requestData: NetworkRequestParams) -> URLRequest? {
        
        guard var url = URL(string: requestData.url) else {
            return nil
        }
        
        switch requestData.method {
        case .post:
            if requestData.requestBody == nil {
                return nil
            }
        case .get:
            if let queryParams = requestData.queryParams {
                var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
                urlComponents?.queryItems = queryParams
                if let newURL = urlComponents?.url {
                    url = newURL
                }
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


