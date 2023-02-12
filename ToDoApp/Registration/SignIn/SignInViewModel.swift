//
//  SignInViewModel.swift
//  ToDoApp
//
//  Created by Mirzabek on 07/02/23.
//

import Foundation


class SignInViewModel: ObservableObject {
    
    @Published var isLoading = false
    
    
    func apiSignIn(email: String, password: String, completion: @escaping (Bool) -> ()){
        isLoading = true
        SessionStore().signIn(email: email, password: password, completion: {(res,err) in
            self.isLoading = false
            if err != nil {
                print("Check email or password")
                completion(false)
            }else{
                print("User signed in")
                completion(true)
            }
        })
    }
    
}
