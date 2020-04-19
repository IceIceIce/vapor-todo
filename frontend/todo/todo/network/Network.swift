//
//  Network.swift
//  todo
//
//  Created by Guillaume LAURES on 18/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation

struct Network: NetworkProvider {

    let session = URLSession.shared
    let decoder = JSONDecoder()
}
