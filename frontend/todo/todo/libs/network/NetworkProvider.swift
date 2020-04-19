//
//  NetworkProvider.swift
//  BSCore
//
//  Created by Guillaume LAURES on 13/10/2019.
//  Copyright © 2019 Baguette Soft. All rights reserved.
//

import Foundation
import Combine


protocol NetworkProvider {

    var session: URLSession { get }
    var decoder: JSONDecoder { get }

    func process<T: Decodable>(request: Service, completion: @escaping (Result<T, NetworkError>) -> ())
}

extension NetworkProvider {

    func process<T: Decodable>(request: Service, completion: @escaping (Result<T, NetworkError>) -> ()) {

        switch request.buildURL {
        case .failure(let error):
            completion(.failure(.error(error)))

        case .success(let urlRequest):
            let task = session.dataTask(with: urlRequest) { (data, response, error) in

                let dispatchCompletion: (Result<T, NetworkError>) -> () = { (result) in
                    DispatchQueue.main.async {
                        completion(result)
                    }
                }

                if let error = error {
                    dispatchCompletion(.failure(.error(error)))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    dispatchCompletion(.failure(NetworkError.badAnswer))
                    return
                }

                guard 200 <= httpResponse.statusCode && httpResponse.statusCode < 300 else {
                    dispatchCompletion(.failure(NetworkError.error(code: httpResponse.statusCode)))
                    return
                }

                guard let data = data else {
                    if type(of: T.self) == EmptyAnswer.self {
                        dispatchCompletion(.success(EmptyAnswer() as! T))
                    } else {
                        dispatchCompletion(.failure(NetworkError.emptyData))
                    }
                    return
                }

                do {
                    let value = try self.decoder.decode(T.self, from: data)
                    dispatchCompletion(.success(value))
                } catch {
                    dispatchCompletion(.failure(.error(error)))
                }
            }
            task.resume()
        }
    }
}
