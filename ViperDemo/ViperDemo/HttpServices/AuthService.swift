//
//  AuthService.swift
//  ViperDemo
//
//  Created by Shreya on 22/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


class AuthService {
    private let httpService : AuthHttpService
    static let shared : AuthService = AuthService()
    
    private init(httpService:AuthHttpService = AuthHttpService()) {
        self.httpService = httpService 
    }
}


extension AuthService : AuthAPI {
    func signUp(username: String,
                email: String,
                password: String,
                success: @escaping (String, String, Int) -> Void,
                failure: @escaping (String) -> Void) {
        
        do {
            try AuthHttpRouter.signup(AuthModel(name: username, email: email, password: password))
                .request(usingHttpService: httpService)
                .responseJSON { (response ) in
                    guard response.response?.statusCode ==  200 else {
                        print("statuscode error")
                       
                        do{
                            if let data = response.data { // error
                                let authError = try JSONDecoder().decode(SignUpError.self, from: data)
                                
                                if let nameError = authError.validationErrors.name?.first {
                                    failure(nameError)
                                    return
                                }
                                if let emailError = authError.validationErrors.email?.first {
                                    failure(emailError)
                                    return
                                }
                                if let passwordError = authError.validationErrors.password?.first {
                                    failure(passwordError)
                                    return
                                }
                            }
                        }catch {
                            print("Signup failed with error \(error.localizedDescription)")
                            return
                        }
                        
                        return
                    }
                    
                    let dict = response.result.value as? [String : Any]
                    
                    guard
                    let accessToken = dict?["access_token"] as? String,
                    let tokenType = dict?["token_type"] as? String,
                    let expiredIn = dict?["expires_in"] as? Int
                    else {
                            print("Sign up token parsing failed")
                            return
                    }
                    success(accessToken,tokenType,expiredIn)
                    
            }
            
        } catch {
            print("Signup failed with error \(error.localizedDescription)")
        }
       
    }
    
    func login(email: String,
               password: String,
               success: @escaping (String) -> Void,
               failure: @escaping (String) -> Void) {
        
        do {
            try AuthHttpRouter
                .login(AuthModel(email: email, password: password))
                .request(usingHttpService: httpService)
                .responseJSON { (result) in
                    
                    guard result.response?.statusCode ==  200 else {
                        print("statuscode error")
                        
                        do{
                            if let data = result .data { // error
                                let loginError = try JSONDecoder().decode(LoginError.self, from: data)
                                failure(loginError.error)
                               
                            }
                        }catch {
                            print("Login  failed with error \(error.localizedDescription)")
                            failure("Login failed")
                            return
                        }
                        
                        return
                    }
                    
                    //if success, get token
                    guard let dict = result.result.value as? [String:Any],
                          let token = dict["token"] as? String else {
                            failure("Login failed")
                            return
                        }
                        success(token)
                    }
                 }
        catch {
            print("Login error \(error)")
            failure("Login failed")
        }
        
        
    }
    
    
}
