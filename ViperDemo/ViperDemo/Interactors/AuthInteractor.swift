//
//  AuthInteractor.swift
//  ViperDemo
//
//  Created by Shreya on 21/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

enum AuthResult<T> {
    case success(result:T)
    case failure(result:String)
}

class AuthInteractor {
    
    private let authAPI  :AuthAPI
    
    static let shared : AuthInteractor = AuthInteractor()
    private init(authAPI : AuthAPI = AuthService.shared){
        self.authAPI = authAPI
    }
}

extension AuthInteractor {
    
    
    
    func signUp(username: String, email: String, password : String , completion: @escaping (AuthResult<String>) -> Void) -> Void {
        self.authAPI.signUp(username: username,
                            email: email,
                            password: password,
                            success: { _,_,_ in
                                completion(.success(result: "Signup is successsful"))
        })
        { (error) in
            completion(.failure(result: error))
        }
    }
    
    func login(email: String, password : String , completion: @escaping (AuthResult<String>) -> Void) -> Void {
        self.authAPI.login(email: email, password: password, success: { (token) in
            completion(.success(result: token))
        }) { (error) in
            completion(.failure(result: error))
        }
    }
}
