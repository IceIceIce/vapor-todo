import Fluent
import Vapor

func routes(_ app: Application) throws {

    app.get { req in
        return "Todos backend"
    }

    let todoAPIRoute = app.grouped("api", "v1")
    try todoAPIRoute.grouped("todo").register(collection: TodoAPIController())

}
