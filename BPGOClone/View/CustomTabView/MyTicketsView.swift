//
//  MyTicketsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 05..
//

import SwiftUI

enum MyTicketsSection: Int, SelectorSection {
    case unused
    case used
    
    var titleName: String{
        switch self {
        case .unused:
            return "Felhasználható"
        case .used:
            return "Használt"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct MyTicketsView: View {
    @State private var selectedIndex: Int = 0
    @State private var registerIsPresented = false
    @ObservedObject var authVM: AuthViewModel
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()

            VStack(spacing: 0) {
//                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30))
//                    .fill(.navBG)
//                    .frame(width: UIScreen.main.bounds.width, height: 100)
//                    .ignoresSafeArea(edges: .top)
//                    .overlay {
//                        VStack(alignment: .center) {
//                            HStack{
//                                Spacer()
//                                Text("Jegyeim")
//                                    .font(.title2)
//                                    .foregroundStyle(.customBlackWhite)
//                                    .fontWeight(.semibold)
//                                
//                                Spacer()
//                                
//                                NavigationLink {
//                                    HowMobileTicketWorksView()
//                                } label: {
//                                    Image(systemName: "info.circle")
//                                        .font(.title3)
//                                        .foregroundStyle(.white)
//                                }
//
//                            }
//                            .padding()
//                            
//                            Spacer()
//                        }
//                    }
                CustomNavTitle(
                    title: "Jegyeim",
                    secondaryButtonAvailable: true,
                    secondaryButtonIcon: "info.circle",
                    secondaryButtonAction: AnyView(
                        HowAppDoesWorkView()
                    )
                )
                .ignoresSafeArea()
                
                SelectorView(selectedIndex: $selectedIndex, sections: MyTicketsSection.allCases)
                    .padding(.top, -50)
                
                
                TabView(selection: $selectedIndex) {
                    MyTicketsCell(
                        registerIsPresented: $registerIsPresented,
                        image: .unused,
                        subTitle: "A jegyeket csak akkor éred el, ha belépsz a fiókodba.",
                        selectedIndex: 0,
                        authVM: authVM
                    )
                    .tag(0)
                    
                    MyTicketsCell(
                        registerIsPresented: $registerIsPresented,
                        image: .used,
                        subTitle: "A használt jegyeket csak akkor éred el, ha belépsz a fiókodba.",
                        selectedIndex: 1,
                        authVM: authVM
                    )
                    .tag(1)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Spacer()
            }
        }
    }
}


#Preview {
    MyTicketsView(authVM: AuthViewModel())
}
