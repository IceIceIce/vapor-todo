//
//  TodoActions.swift
//  todo
//
//  Created by Guillaume LAURES on 19/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct SetTodosStateAction: Action {

    let state: NetworkedState<[Todo]>
}
