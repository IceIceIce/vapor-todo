//
//  AppReducer.swift
//  todo
//
//  Created by Guillaume LAURES on 14/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation
import SwiftUIFlux

func appStateReducer(state: AppState, action: Action) -> AppState {
    var newState = state

    switch action {
    case let action as SetTodosStateAction:
        newState.todosState = action.state
    default:
        break
    }
    
    return newState
}
