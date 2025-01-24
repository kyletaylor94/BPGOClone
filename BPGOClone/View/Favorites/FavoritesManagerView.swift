//
//  AddNewStopView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 12..
//

import SwiftUI

struct FavoritesManagerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text: String = ""
    let title: String
    let searchTitle: String
    var body: some View {
        ZStack(alignment: .top){
            Color.backGround.ignoresSafeArea()
            
            CustomNavTitle(title: title, dismissAvailable: true)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text(searchTitle)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .bold()
                    
                    Spacer()
                }
                .padding(.horizontal)

                RoundedRectangle(cornerRadius: 16)
                    .fill(.navBG)
                    .stroke(.white, style: StrokeStyle())
                    .frame(width: UIScreen.main.bounds.width - 32, height: 40, alignment: .center)
                    .overlay {
                        HStack{
                            TextField("", text: $text)
                                .padding()
                            
                            Button {
                                text = ""
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.caption)
                                    .foregroundStyle(.customBlackWhite)
                            }
                            .padding(.trailing)
                            .opacity(!text.isEmpty ? 1 : 0)

                        }
                    }
                
                ScrollView(.vertical, showsIndicators: false) {
                    if text.isEmpty {
                        ContentUnavailableView("Nem találunk '\(text)' nevű megállót.", systemImage: "xmark")
                    } else {
                        ForEach(0..<10) { _ in
                            NavigationLink {
                                
                            } label: {
                                FavoriteStopsCell()

                            }

                            //FIXME: - addfavoriteroutecell

                        }
                    }
                }
                .padding(.top)
            }
            .navigationBarBackButtonHidden()
            .padding(.top, 70)
        }
    }
}

#Preview {
    FavoritesManagerView(title: "Kedvenc megálló hozzáadása", searchTitle: "Add meg a megálló nevét")
}

