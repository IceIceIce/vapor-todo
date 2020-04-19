//
//  InjectPropertyWrapper.swift
//  todo
//
//  Created by Guillaume LAURES on 19/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation

@propertyWrapper
struct Injected<T> {

    var cache: T

    init() {
        cache = Container.shared.resolve()
    }

    public var wrappedValue: T {
        get {
            return cache
        }
        set {
            cache = newValue
        }
    }
}
