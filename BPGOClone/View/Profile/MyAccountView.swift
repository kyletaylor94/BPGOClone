//
//  MyAccountView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 15..
//

import SwiftUI

enum ProfileSection: String, Identifiable, CaseIterable {
    case personaldata = "Személyes adatok"
    case passwordchange = "Jelszó módosítása"
    case biometricauth = "Azonosítás 5000 Ft feletti\nvásárlásnál (PIN-kód /\nujjlenyomat / Face ID)"
    case joinedaccounts = "Kapcsolt fiókok"
    
    var iconName: String {
        switch self {
        case .personaldata:
            return "person"
        case .passwordchange:
            return "lock"
        case .biometricauth:
            return "touchid"
        case .joinedaccounts:
            return "person.line.dotted.person"
        }
    }
    
    var topLeading: CGFloat {
        switch self {
        case .personaldata:
            return 24
        case .passwordchange:
            return 0
        case .biometricauth:
            return 0
        case .joinedaccounts:
            return 0
        }
    }
    
    var topTrailing: CGFloat {
        switch self {
        case .personaldata:
            return 24
        case .passwordchange:
            return 0
        case .biometricauth:
            return 0
        case .joinedaccounts:
            return 0
        }
    }
    
    var bottomLeading: CGFloat {
        switch self {
        case .personaldata:
            return 0
        case .passwordchange:
            return 0
        case .biometricauth:
            return 0
        case .joinedaccounts:
            return 24
        }
    }
    
    var bottomTrailing: CGFloat {
        switch self {
        case .personaldata:
            return 0
        case .passwordchange:
            return 0
        case .biometricauth:
            return 0
        case .joinedaccounts:
            return 24
        }
    }
    
    var height: CGFloat {
        switch self {
        case .personaldata:
            return 50
        case .passwordchange:
            return 50
        case .biometricauth:
            return 80
        case .joinedaccounts:
            return 50
        }
    }
    var id: String { return self.rawValue }
}

struct MyAccountView: View {
    @ObservedObject var authVM: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var alertPresented: Bool = false
    var body: some View {
        ZStack{
            ZStack(alignment: .top) {
                Color.backGround.ignoresSafeArea()
                
                CustomNavTitle(title: "Fiókom")
                    .ignoresSafeArea()
                
                VStack(spacing: 3) {
                    ForEach(ProfileSection.allCases) { section in
                        if section == .biometricauth {
                            Rectangle()
                                .fill(.navBG)
                                .frame(width: UIScreen.main.bounds.width - 32, height: 98)
                                .overlay {
                                    HStack{
                                        Toggle(isOn: .constant(true)) {
                                            HStack{
                                                Image(systemName: section.iconName)
                                                Text(section.rawValue)
                                            }
                                        }
                                    }
                                    .padding()
                                }
                        } else {
                            CustomReuseableButton(
                                text: section.rawValue,
                                icon: section.iconName,
                                topLeading: section.topLeading,
                                topTrailing: section.topTrailing,
                                bottomLeading: section.bottomLeading,
                                bottomTrailing: section.bottomTrailing,
                                height: section.height
                            )
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            alertPresented.toggle()
                        }
                    } label: {
                        HStack{
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Kijelentkezés")
                        }
                    }
                    .bold()
                    .foregroundStyle(.customBlackWhite)
                    .padding(.bottom)
                    
                }
                .padding(.top, 90)
                .navigationBarBackButtonHidden()
            }
            .opacity(alertPresented ? 0.5 : 1)
            
            SignOutAlert(authVM: authVM, showAlert: $alertPresented, dismiss: {
                dismiss()
            })
                .opacity(alertPresented ? 1 : 0)
                .scaleEffect(alertPresented ? 1 : 0)
        }
    }
}

#Preview {
    MyAccountView(authVM: AuthViewModel())
}
