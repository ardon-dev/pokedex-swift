//
//  ApiManager.swift
//  Pokedex
//
//  Created by Josue on 27/1/25.
//

import Foundation
import Alamofire

private let API_BASE_URL = "https://pokeapi.co/api/v2/"

public class NetworkManager {
    
    public static let shared = NetworkManager()
    private init() {}
    
    private let maxWaitTime = 15.0
    var commonHeaders: HTTPHeaders = [
        "content-type": "application/json"
    ]
    
    func get(
        endpoint: String,
        parameters: Parameters?
    ) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                API_BASE_URL + endpoint,
                parameters: parameters,
                headers: commonHeaders,
                requestModifier: {
                    $0.timeoutInterval = self.maxWaitTime
                }
            )
            .responseData { response in
                print(response)
                switch(response.result) {
                case let .success(data):
                    continuation.resume(returning: data)
                case let .failure(error):
                    continuation
                        .resume(throwing: self.handleError(error: error))
                }
            }
        }
    }
    
    private func handleError(error: AFError) -> Error {
        if let underlyingError = error.underlyingError {
            let nserror = underlyingError as NSError
            let code = nserror.code
            if code == NSURLErrorNotConnectedToInternet ||
                code == NSURLErrorTimedOut ||
                code == NSURLErrorInternationalRoamingOff ||
                code == NSURLErrorDataNotAllowed ||
                code == NSURLErrorCannotFindHost ||
                code == NSURLErrorCannotConnectToHost ||
                code == NSURLErrorNetworkConnectionLost
            {
                var userInfo = nserror.userInfo
                userInfo[NSLocalizedDescriptionKey] = "Unable to connect to the server"
                let currentError = NSError(
                    domain: nserror.domain,
                    code: code,
                    userInfo: userInfo
                )
                return currentError
            }
        }
        return error
    }
    
}


