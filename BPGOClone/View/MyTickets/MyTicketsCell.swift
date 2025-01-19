//
//  MyTicketsCell.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 09..
//

import SwiftUI

struct MyTicketsCell: View {
    @Binding var registerIsPresented: Bool
    let image: ImageResource
    let subTitle: String
    var vote: Bool?
    var selectedIndex: Int
    
    @ObservedObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 5) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
                            
            Text("Lépj be a fiókodba, és vásárolj jegyet!")
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
            
            Text(subTitle)
                .foregroundStyle(.gray)
                .font(.system(size: 16))
                .padding(.horizontal)
            
            NavigationLink {
                HowMobileTicketWorksView()
            } label: {
                Text("Hogyan működik a mobiljegy?")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.top)
            }
            
            VStack{
                NavigationLink(destination: {
                    TicketsAndPassesView()
                }, label: {
                    RoundedRectangle(cornerRadius: 16)
                        .overlay {
                            Text("Vásárlás")
                                .font(.title3)
                                .foregroundStyle(.customWhiteBlack)
                                .bold()
                        }
                        .foregroundStyle(.button)
                })
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)

                
                NavigationLink(destination: {
                    HowAppDoesWorkView()
                }, label: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.navBG)
                        .stroke(.white, style: StrokeStyle())
                        .overlay {
                            Text("Hogyan működik?")
                                .bold()
                                .font(.title3)
                                .foregroundStyle(.customBlackWhite)
                        }
                })
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                .opacity(selectedIndex == 1 ? 0 : 1)

            }
            .padding(.top)
            .opacity(authVM.isAuthenticated ? 1 : 0)
       
            Spacer()
            
            VStack(spacing: 60) {
                if vote != nil {
                    Link(destination: URL(string: "https://www.azevhonlapja.hu/nevezes/benyujtott-palyamu/587/budapestgo-a-digit%C3%A1lis-%C3%BAtit%C3%A1rs")!) {
                        Image(.vote)
                            .resizable()
                            .scaledToFit()
                            .overlay {
                                HStack{
                                    Spacer()
                                    
                                    Button {
                                        //dismiss
                                    } label: {
                                        Image(systemName: "xmark")
                                    }
                                    .offset(x: 2)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                }
                                .padding(.bottom, 82)
                                
                                .padding()
                            }
                    }
                }
              
                    HStack{
                        NavigationLink {
                            TicketsAndPassesView()
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.button)
                                .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                                .frame(width: 200, height: 57)
                                .overlay {
                                    Text("Vásárlás")
                                        .bold()
                                        .foregroundStyle(.navBG)
                                        .font(.title3)
                                }
                        }
                        
                        
                        Button {
                            registerIsPresented = true
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.navBG)
                                .stroke(.white, style: StrokeStyle(lineWidth: 0.5))
                                .frame(width: 200, height: 57)
                                .overlay {
                                    Text("Belépés")
                                        .bold()
                                        .foregroundStyle(.white)
                                        .font(.title3)
                                }
                        }
                        .fullScreenCover(isPresented: $registerIsPresented) {
                            RegisterSheet(authVM: authVM)
                        }
                    }
                    .opacity(!authVM.isAuthenticated ? 1 : 0)

            }
            .padding(.bottom, 75)
        }
        .multilineTextAlignment(.center)
        .padding(.top)
    }
}

#Preview {
    MyTicketsCell(registerIsPresented: .constant(false), image: .unused, subTitle: "A jegyeket csak akkor éred el, ha belépsz a fiókodba.", vote: true, selectedIndex: 0, authVM: AuthViewModel())
}

