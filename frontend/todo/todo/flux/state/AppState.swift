//
//  AppState.swift
//  todo
//
//  Created by Guillaume LAURES on 14/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct AppState: FluxState {

    var todosState: NetworkedState<[Todo]> = .notStarted
}
