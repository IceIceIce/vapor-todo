//
//  NetworkError.swift
//  todo
//
//  Created by Guillaume LAURES on 18/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation

enum NetworkError: Error {

    case notBuildableURLError
    case badAnswer
    case emptyData
    case error(code: Int)
    case error(Error)
}
