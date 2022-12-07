//
//  ApiServices.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 6/12/22.
//

import Foundation
import Combine
import Alamofire

struct ApiError: Error
{
    let error: Error
    let serverError: ServerError?
}

struct ServerError: Codable, Error
{
    var status: String
    var message: String
}

struct CustomError: Error
{
    var code: Int
    var message: String
}

protocol UsersApiProtocol
{
    func getUsers() -> AnyPublisher<DataResponse<[UserApi], ApiError>, Never>
    func getUsersPosts(id: Int) -> AnyPublisher<DataResponse<[UserPublication], ApiError>, Never>
}

class ApiClient
{
    private let urlBase: String = "https://jsonplaceholder.typicode.com"
    private let apiEndpoints: ApiEndpoints
    
    public init(apiEndpoints: ApiEndpoints) {
        self.apiEndpoints = apiEndpoints
    }
}

extension ApiClient: UsersApiProtocol
{
    func getUsers() -> AnyPublisher<Alamofire.DataResponse<[UserApi], ApiError>, Never> {
        guard let url = URL(string: "\(urlBase)/users")
                else
        {
            return emptyPublisher(error: CustomError(code: 555, message: "Url no valida"))
        }
                
        return AF.request(url, method:.get)
            .proccesResponse(type: [UserApi].self)
    }
    
    func getUsersPosts(id: Int) -> AnyPublisher<Alamofire.DataResponse<[UserPublication], ApiError>, Never> {
        guard let url = URL(string: "\(urlBase)/posts?userId=\(String(id))")
                else
        {
            return emptyPublisher(error: CustomError(code: 555, message: "Url no valida"))
        }
                
        return AF.request(url, method:.get)
            .proccesResponse(type: [UserPublication].self)
    }
    
    
    private func emptyPublisher<T: Decodable>(error:CustomError) -> AnyPublisher<DataResponse<T, ApiError>, Never>
    {
        return Just<DataResponse<T, ApiError>>(
            DataResponse(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: .failure(ApiError(error: error, serverError: nil)))).eraseToAnyPublisher()
    }
    
    
}

extension DataRequest
{
    func proccesResponse<T: Codable>(type: T.Type) -> AnyPublisher<DataResponse<T, ApiError>, Never>
    {
        validate().publishDecodable(type: type.self)
            .map{response in
                response.mapError
                { error in
                    let serverError = response.data.flatMap{try? JSONDecoder().decode(ServerError.self, from: $0)}
                    return ApiError(error: error, serverError: serverError)
                    
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
