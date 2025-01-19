//
//  MyTicketsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 05..
//

import SwiftUI

enum MyTicketsSection: Int, Identifiable, CaseIterable {
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
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30))
                    .fill(.navBG)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .ignoresSafeArea(edges: .top)
                    .overlay {
                        VStack(alignment: .center) {
                            HStack{
                                Spacer()
                                Text("Jegyeim")
                                    .font(.title2)
                                    .foregroundStyle(.customBlackWhite)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                NavigationLink {
                                    HowMobileTicketWorksView()
                                } label: {
                                    Image(systemName: "info.circle")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                }

                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                
                VStack(spacing: 0) {
                    HStack(spacing: 112) {
                        ForEach(MyTicketsSection.allCases) { section in
                            Button(action: {
                                withAnimation(.snappy) {
                                    selectedIndex = section.rawValue
                                }
                            }, label: {
                                Text(section.titleName)
                                    .padding()
                                    .foregroundStyle(selectedIndex == section.rawValue ? .white : .gray)
                            })
                        }
                    }
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 1)
                        .foregroundStyle(.gray)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width  / CGFloat(MyTicketsSection.allCases.count ), height: 1.0)
                        .offset(x: CGFloat(selectedIndex) * UIScreen.main.bounds.width / CGFloat(MyTicketsSection.allCases.count))
                        .padding(.trailing, 215)
                        .foregroundStyle(.white)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.top, -50)
                
                VStack{
                    switch selectedIndex {
                    case 0:
                        MyTicketsCell(
                            registerIsPresented: $registerIsPresented,
                            image: .unused,
                            subTitle: "A jegyeket csak akkor éred el, ha belépsz a fiókodba.",
                            selectedIndex: 0,
                            authVM: authVM
                        )
                    case 1:
                        MyTicketsCell(
                            registerIsPresented: $registerIsPresented,
                            image: .used,
                            subTitle: "A használt jegyeket csak akkor éred el, ha belépsz a fiókodba.",
                            selectedIndex: 1,
                            authVM: authVM
                        )
                    default:
                        EmptyView()
                    }
                }
                
                Spacer()
            }
        }
    }
}


#Preview {
    MyTicketsView(authVM: AuthViewModel())
}
