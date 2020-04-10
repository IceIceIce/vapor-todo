//
//  Todo.swift
//  App
//
//  Created by Guillaume LAURES on 10/04/2020.
//

import Foundation
import Vapor

struct Todo {

    let id: Int
    let title: String
    let description: String
}

#if  canImport(Vapor)

extension Todo: Content {}

#endif
