//
//  URLSessionManager.swift
//  News-MVC
//
//  Created by Ricardo Duarte on 19/08/2020.
//  Copyright © 2020 HappiOS. All rights reserved.
//

import Foundation

final class NetworkFactory {
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)

    func fetch<T: Codable>(url: URL,
                           httpMethod: HTTPMethod,
                           completion: @escaping ((Result<T, Error>) -> Void)) {

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue

        urlSession.dataTask(with: request) { (data, urlResponse, error) in
            if
                let error = error {
                    completion(.failure(error))
                    return
            }

            guard let data = data else {
                let missingDataError = NSError(domain: "",
                                               code: 0,
                                               userInfo: [NSLocalizedDescriptionKey: "Missing data from url: \(url.absoluteString)"]) as Error
                completion(.failure(missingDataError))
                return
            }

            do {
                let news = try JSONDecoder().decode(T.self, from: data)
                completion(.success(news))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
