//
//  NetworkableViewModel.swift
//  todo
//
//  Created by Guillaume LAURES on 19/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation

enum NetworkableViewModel<ViewModel> {

    case idle
    case loading
    case loaded(ViewModel)
    case error(String)
}
