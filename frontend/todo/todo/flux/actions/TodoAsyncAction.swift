//
//  GetTodosAsyncAction.swift
//  todo
//
//  Created by Guillaume LAURES on 19/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct GetTodosAsyncAction: AsyncAction {

    @Injected var network: NetworkProvider

    func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {

        dispatch(SetTodosStateAction(state: .loading))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.network.process(request: TodoService.getAll) { (result: Result<[Todo], NetworkError>) in

                switch result {
                case .success(let todos):
                    dispatch(SetTodosStateAction(state: .success(todos)))
                case .failure(let error):
                    dispatch(SetTodosStateAction(state: .failure(error)))
                }
            }
        }

    }

}
