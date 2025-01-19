//
//  SignOutAlert.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 19..
//

import SwiftUI

struct SignOutAlert: View {
    @ObservedObject var authVM: AuthViewModel
    @Binding var showAlert: Bool
    var dismiss: () -> Void

    var body: some View {
        Rectangle()
            .foregroundStyle(.navBG)
            .frame(width: UIScreen.main.bounds.width - 32, height: 170)
            .overlay {
                VStack(spacing: 20) {
                    Text("Várunk vissza!")
                        .font(.title3)
                        .bold()
                    
                    Text("Ha kijelentkezel, bizonyos funkciókat (pl. vásárlás) nem tudsz elérni.")
                        .font(.caption)
                    
                    HStack(spacing: 20) {
                        Button {
                            showAlert = false
                        } label: {
                            Text("Mégse")
                                .foregroundStyle(.white)
                                .bold()
                        }
                        
                        Button {
                            authVM.logOut()
                            showAlert = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                dismiss()
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.customBlackWhite)
                                .frame(width: 150, height: 40)
                                .overlay {
                                    Text("Kijelentkezem")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.customWhiteBlack)
                                }
                        }
                    }
                    .padding()
                }
                .multilineTextAlignment(.center)
                .padding(.top)
            }
    }
}
