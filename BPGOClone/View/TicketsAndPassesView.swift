//
//  TicketsAndPassesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 12..
//

import SwiftUI

struct TicketsAndPassesView: View {
    var body: some View {
        VStack(spacing: 0) {
            UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 24))
                .fill(.navBG)
                .frame(width: UIScreen.main.bounds.width, height: 110)
                .ignoresSafeArea(edges: [.top])
                .overlay {
                    VStack{
                        HStack{
                            Button {
                                //dismiss
                            } label: {
                                Image(systemName: "chevron.left")
                                
                            }
                            
                            Spacer()
                            
                            
                            Text("Jegyek és bérletek")
                                .font(.title3)
                            
                            Spacer()
                            
                        }
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                    }
                    .padding(.top, 50)
                }
            
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                    .frame(height: 850)
                    .foregroundStyle(.backGround)
                    .ignoresSafeArea()
                
                VStack{
                    Image(.ticketsandpasses)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 280)
                        .overlay {
                            VStack{
                                RoundedRectangle(cornerRadius: 24)
                                    .foregroundStyle(.navBG)
                                    .frame(width: UIScreen.main.bounds.width - 64, height: 80)
                                    .overlay {
                                        HStack{
                                            VStack(alignment: .leading, spacing: 12) {
                                                Text("Közlekedés típusa")
                                                    .font(.caption)
                                                
                                                Button {
                                                    //local
                                                } label: {
                                                    HStack{
                                                        Text("Helyi")
                                                            .font(.subheadline)
                                                        
                                                        Image(systemName: "chevron.right")
                                                    }
                                                }
                                                .foregroundStyle(.white)
                                                
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 12) {
                                                Text("Város")
                                                    .font(.caption)
                                                
                                                Button {
                                                    //local
                                                } label: {
                                                    HStack{
                                                        Text("Budapest")
                                                            .font(.subheadline)
                                                        
                                                        Image(systemName: "chevron.right")
                                                    }
                                                }
                                                .foregroundStyle(.white)
                                                
                                                
                                            }
                                            
                                            Spacer()
                                            
                                        }
                                        .padding()
                                    }
                            }
                            .padding(.top, 210)
                            
                        }
                    
                    VStack(spacing: 3) {
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24, topTrailing: 24))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 80)
                            .foregroundStyle(.navBG)
                            .overlay {
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text("Bérletek")
                                            .bold()
                                            .foregroundStyle(.white)
                                            .font(.title3)
                                        
                                        Text("havi, félhavi, többhavi")
                                            .font(.caption)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.title2)
                                        .bold()
                                }
                                .padding()
                            }
                        
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 80)
                            .foregroundStyle(.navBG)
                            .overlay {
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text("Eseti jegyek")
                                            .bold()
                                            .foregroundStyle(.white)
                                            .font(.title3)
                                        
                                        Text("vonaljegy, reptéri vonaljegy, időalapú jegyek")
                                            .font(.caption)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.title2)
                                        .bold()
                                }
                                .padding()
                            }
                        
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 60)
                            .foregroundStyle(.navBG)
                            .overlay {
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text("Napijegyek")
                                            .bold()
                                            .foregroundStyle(.white)
                                            .font(.title3)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.title2)
                                        .bold()
                                }
                                .padding()
                            }
                        
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24,bottomLeading: 24, bottomTrailing: 24))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 80)
                            .foregroundStyle(.navBG)
                            .overlay {
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text("Pest vármegyebérletek")
                                            .bold()
                                            .foregroundStyle(.white)
                                            .font(.title3)
                                        
                                        Text("és országbérletek")
                                            .font(.caption)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.title2)
                                        .bold()
                                }
                                .padding()
                            }
                    }
                    .padding(.top)
                    
                }
            }
        }
    }
}

#Preview {
    TicketsAndPassesView()
}
