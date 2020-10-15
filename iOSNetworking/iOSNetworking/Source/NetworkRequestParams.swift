//
//  NetworkingConfig.swift
//  iOSNetworking
//
//  Created by Govila, Dhruv on 18/09/20.
//  Copyright Â© 2020 Govila, Dhruv (US - Bengaluru). All rights reserved.
//

import Foundation

public enum HttpMethods: String {
    case post = "POST"
    case get = "GET"
}

public enum HeaderDefaultParamsKeys: String {
    case authorization = "Authorization"
    case contentType = "Content-Type"
}

public protocol NetworkRequestParams {
    var method: HttpMethods { get set }
    var requestBody: Data? { get set }
    var url: String { get set }
    var headerParams: [HeaderDefaultParamsKeys: String]? { get set }
}
