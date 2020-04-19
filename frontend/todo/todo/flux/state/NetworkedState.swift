//
//  NetworkedState.swift
//  todo
//
//  Created by Guillaume LAURES on 19/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation

enum NetworkedState<T> {
    
    case notStarted
    case loading
    case success(T)
    case failure(Error)
}
