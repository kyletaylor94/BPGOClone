//
//  AuthViewModel.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    
    func authenticate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isAuthenticated = true
        }
    }
    
    func logOut() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isAuthenticated = false
        }
    }
}
