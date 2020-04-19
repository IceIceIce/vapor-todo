//
//  TodoService.swift
//  todo
//
//  Created by Guillaume LAURES on 18/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation

enum TodoService: Service {

    static let components: URLComponents = {
        var composents = URLComponents()
        composents.scheme = "http"
        composents.host = "127.0.0.1"
        composents.port = 8080
        composents.path = "/api/v1/"
        return composents
    } ()

    case getAll

    var baseUrlComponents: URLComponents {
        Self.components
    }

    var path: String {
        switch self {
        case .getAll: return "todo"
        }
    }

    var parameters: [String : String] {
        switch self {
        case .getAll: return [:]
        }
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getAll: return .url
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getAll: return .get
        }
    }
}
