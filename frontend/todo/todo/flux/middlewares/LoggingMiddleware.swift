//
//  LoggingMiddleware.swift
//  todo
//
//  Created by Guillaume LAURES on 14/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation
import SwiftUIFlux

let loggingMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            #if DEBUG
            print("#Action: \(action.self)")
            #endif
            return next(action)
        }
    }
}
