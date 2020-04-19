//
//  DashboardView.swift
//  todo
//
//  Created by Guillaume LAURES on 14/04/2020.
//  Copyright © 2020 Baguette Soft. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIFlux

struct DashboardView: ConnectedView {

    @EnvironmentObject private var store: Store<AppState>

    struct Props {

        let viewModel: NetworkableViewModel<[Todo]>
        let dispatch: DispatchFunction?
    }

    func body(props: Props) -> some View {

        var view: AnyView
        switch props.viewModel {
        case .loading:
            view = AnyView(ActivityIndicator(isAnimating: true, style: .large))
        case .loaded(let todos):
            view = AnyView(List {
                ForEach(todos, id: \.id) { (task) in
                    Text(task.title)
                }
            })
        case .error(let message):
            view = AnyView(Text(message))
        case .idle:
            view = AnyView(EmptyView().onAppear(perform: {
                props.dispatch?(GetTodosAsyncAction())
            }))
        }
        return view.animation(.default).transition(AnyTransition.opacity.animation(.easeInOut))
    }
}

extension DashboardView {

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {

        switch state.todosState {
        case .loading:
            return Props(viewModel: .loading, dispatch: dispatch)
        case .success(let todos):
            return Props(viewModel: .loaded(todos), dispatch: dispatch)
        case .failure(let error):
            return Props(viewModel: .error(error.localizedDescription), dispatch: dispatch)
        case .notStarted:
            return Props(viewModel: .idle, dispatch: dispatch)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let todos = [Todo(id: 1, title: "Test", description: "To do test")]
        let props = DashboardView.Props(viewModel: .loaded(todos), dispatch: nil)
        return DashboardView().body(props: props)
    }
}
