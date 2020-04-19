//
//  Service.swift
//  BSCore
//
//  Created by Guillaume LAURES on 13/10/2019.
//  Copyright © 2019 Baguette Soft. All rights reserved.
//

import Foundation

protocol Service {

    var baseUrlComponents: URLComponents { get }
    var path: String { get }
    var parameters: [String: String] { get }
    var parameterEncoding: ParameterEncoding { get }
    var method: HTTPMethod { get }
}

extension Service {

    var buildURL: Result<URLRequest, Error> {

        var urlComponents = baseUrlComponents
        urlComponents.path.append(path)

        switch parameterEncoding {
        case .url:
            // Avoid adding a ? at the end of the url
            if !parameters.isEmpty {
                urlComponents.queryItems = [URLQueryItem]()
                parameters.forEach({ (key, value) in
                    urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
                })
            }
        }

        guard let url = urlComponents.url else {
            return .failure(NetworkError.notBuildableURLError)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return .success(urlRequest)
    }
}
