//
//  HowMobileTicketWorksView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 09..
//

import SwiftUI

//struct HowMobileTicketWorksView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var currentIndex: HowMobileTicketWorksSection = .first
//    
//    var body: some View {
//        ZStack(alignment: .top) {
//            Color.backGround
//                .ignoresSafeArea()
//            
//            VStack(spacing: 70) {
//                CustomNavTitle(title: "Hogyan működik?")
//                    .ignoresSafeArea()
//                
//                
//                TabView(selection: $currentIndex) {
//                    ForEach(HowMobileTicketWorksSection.allCases) { section in
//                        VStack(spacing: 20) {
//                            Image(section.image)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 300, height: 200)
//                            
//                            Text(section.title)
//                                .font(.title3)
//                                .bold()
//                            
//                            Text(section.subTitle)
//                                .padding(.horizontal)
//                        }
//                        .tag(section)
//                        .foregroundStyle(.white)
//                        .multilineTextAlignment(.center)
//                    }
//                }
//                .tabViewStyle(.page(indexDisplayMode: .never))
//                .toolbarVisibility(.hidden, for: .tabBar)
//                
//                
//                VStack(spacing: 30) {
//                    HStack(spacing: 12) {
//                        ForEach(0..<5, id: \.self) { index in
//                            Circle()
//                                .fill(currentIndex.rawValue == index ? .white : .black)
//                                .stroke(.gray,style: StrokeStyle())
//                                .frame(height: 10)
//                        }
//                    }
//                    
//                    Button {
//                        if currentIndex == .fifth {
//                            dismiss()
//                        }
//                        if currentIndex.rawValue < HowMobileTicketWorksSection.allCases.count - 1 {
//                            withAnimation {
//                                currentIndex = HowMobileTicketWorksSection(rawValue: currentIndex.rawValue + 1)!
//                            }
//                        }
//                    } label: {
//                        RoundedRectangle(cornerRadius: 14)
//                    }
//                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
//                    .foregroundStyle(.button)
//                    .overlay {
//                        Text(currentIndex == .fifth ? "Bezárás" : "Következő")
//                            .bold()
//                            .font(.title3)
//                    }
//                    
//                    Link(destination: URL(string: "https://bkk.hu/gyik/budapestgo/?frame=1&app=prod")!) {
//                        Text("További kérdeseim vannak")
//                            .bold()
//                            .foregroundStyle(.white)
//                            .font(.title3)
//                    }
//                    .opacity(currentIndex == .fifth ? 1 : 0)
//                }
//                Spacer()
//                
//            }
//            .navigationBarBackButtonHidden()
//        }
//    }
//}

//#Preview {
//    NavigationStack{
//        HowMobileTicketWorksView()
//    }
//}
