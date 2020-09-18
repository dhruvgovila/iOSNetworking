//
//  NetworkingConfig.swift
//  iOSNetworking
//
//  Created by Govila, Dhruv on 18/09/20.
//  Copyright © 2020 Govila, Dhruv (US - Bengaluru). All rights reserved.
//

import Foundation

public enum HttpMethods: String {
    case post = "POST"
    case get = "GET"
}

public protocol NetworkRequestParams {
    var method: HttpMethods { get set }
    var requestData: Data? { get set }
    var url: String { get set }
}
