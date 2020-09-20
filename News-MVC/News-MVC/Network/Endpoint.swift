//
//  Endpoint.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 19/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: String? { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpMethod: HTTPMethod { get }
}

extension Endpoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = baseURL
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
