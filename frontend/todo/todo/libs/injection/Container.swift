//
//  Container.swift
//  todo
//
//  Created by Guillaume LAURES on 19/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation

class Container {

    static let shared = Container()

    private var container: [ObjectIdentifier: Any]

    private init() {
        container = [:]
    }

    func register<T>(value: T) {

        let objectIdentifier = ObjectIdentifier(T.self)
        container[objectIdentifier] = value
    }

    func register<Protocol, Implementation>(protocol: Protocol.Type, value: Implementation) {

        guard value is Protocol else {
            fatalError("The value is not implementing the protocol")
        }

        let objectIdentifier = ObjectIdentifier(Protocol.self)
        container[objectIdentifier] = value
    }

    func resolve<T>() -> T {

        let objectIdentifier = ObjectIdentifier(T.self)
        guard let value = container[objectIdentifier] as? T else {
            fatalError("No value found in container")
        }

        return value
    }
}
