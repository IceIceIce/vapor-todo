//
//  TodoAPIController.swift
//  App
//
//  Created by Guillaume LAURES on 10/04/2020.
//

import Foundation
import Vapor

final class TodoAPIController {

    static let todos = [
        Todo(id: 1, title: "Todo app", description: "Do a todo app"),
        Todo(id: 2, title: "Todo backend", description: "Do a todo backend")
    ]

    func getTodos(req: Request) -> [Todo] {
        return Self.todos
    }
}

extension TodoAPIController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: getTodos)
    }
}
