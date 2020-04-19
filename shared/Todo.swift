//
//  Todo.swift
//  App
//
//  Created by Guillaume LAURES on 10/04/2020.
//

import Foundation

struct Todo {

    let id: Int
    let title: String
    let description: String
}

#if  canImport(Vapor)

import Vapor

extension Todo: Content {}

#endif

#if canImport(SwiftUI)

extension Todo: Codable {}

#endif
