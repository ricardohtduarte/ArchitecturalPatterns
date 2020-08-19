//
//  Endpoint.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 19/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: URL? { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpMethod: HTTPMethod { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
