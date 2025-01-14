//
//  RegisterSheet.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum RegisterSection: String, Identifiable, CaseIterable {
    case apple = "Folytatás Apple-lel"
    case google = "Folytatás Google-lal"
    case facebook = "Folytatás Facebookkal"
    
    var iconName: String {
        switch self {
        case .apple:
            return "apple.logo"
        case .google:
            return "apple.logo"
        case .facebook:
            return "apple.logo"
        }
    }
    var id: String { return self.rawValue }
}

struct RegisterSheet: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var authVM: AuthViewModel
    var body: some View {
        ZStack {
            Color.navBG.ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Regisztrálj, vagy lépj be!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                        
                    }
                }
                .foregroundStyle(.white)
                .padding()
                
                Image(.auth1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                
                VStack(spacing: 15) {
                    ForEach(RegisterSection.allCases) { section in
                        Button {
                            authVM.authenticate()
                            dismiss()
                        } label: {
                            Capsule()
                                .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                                .overlay {
                                    HStack{
                                        Image(systemName: section.iconName)
                                        
                                        Text(section.rawValue)
                                            .bold()
                                    }
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                }
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .foregroundStyle(.button)
                        .overlay {
                            HStack{
                                Image(systemName: "envelope")
                                
                                Text("Folytatás e-mail-címmel")
                                    .bold()
                            }
                            .font(.title3)
                        
                        }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegisterSheet(authVM: AuthViewModel())
}
