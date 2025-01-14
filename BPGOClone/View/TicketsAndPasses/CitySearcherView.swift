//
//  CitySearcherView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 13..
//

import SwiftUI

struct CitySearcherView: View {
    @Environment(\.dismiss) var dismiss
    let cities: [String] = ["Budapest", "Ajka", "Balassagyarmat", "Balatonfüred", "Balatonfüzfő", "Balmazújváros", "Bátaszék", "Bátonyterenye", "Békéscsaba", "Csongrád", "Debrecen", "Dunaújváros", "Eger", "Ercsi", "Érd", "Esztergom", "Fonyód", "Gödöllő", "Gyöngyös", "Győr", "Gyula", "Hajdúszoboszló", "Hódmezővásárhely", "Jászberény", "Karcag", "Kazincbarcika", "Kecskemét", "Keszthely", "Komárom", "Komló", "Körmend", "Lenti", "Makó", "Mezőberény", "Mezőtúr", "Miskolc", "Mohács", "Mosonmagyaróvár", "Nagykanizsa", "Nyíregyháza", "Orosháza", "Ózd", "Paks", "Pápa", "Pécs", "Salgótarján", "Siklós", "Siófok", "Sopron", "Szeged", "Székesfehérvár", "Szekszárd", "Szentes", "Szigetvár", "Szolnok", "Szombathely", "Tata", "Tatabánya", "Tiszafüred", "Tiszaújváros", "Trans-tour 90 kft.", "Újszász", "Vác", "Veszprém", "Zalaegerszeg"]
    
    var body: some View {
        VStack(spacing: 5) {
            UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 24))
                .fill(.navBG)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .ignoresSafeArea(edges: [.top])
                .overlay {
                    VStack{
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                
                            }
                            
                            Spacer()
                            
                            
                            Text("Városok")
                                .font(.title3)
                            
                            Spacer()
                            
                        }
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                        
                        Capsule()
                            .frame(width: UIScreen.main.bounds.width - 10, height: 45)
                            .overlay {
                                HStack{
                                    Text("Keresés városra...")
                                    
                                    Spacer()
                                    
                                    Image(systemName: "magnifyingglass")
                                }
                                .padding()
                                .foregroundStyle(.black)
                            }
                    }
                    .padding(.top, 50)
                }
            
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24))
                    .frame(height: 810)
                    .foregroundStyle(.backGround)
                    .ignoresSafeArea()
                
                ScrollView(.vertical,showsIndicators: true) {
                    VStack(spacing: 5) {
                    //firstcell
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24, topTrailing: 24))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                            .overlay {
                                HStack{
                                    Text(cities.first!)
                                        .font(.title3)
                                        .foregroundStyle(.black)
                                    Spacer()
                                }
                                .padding()
                            }
                //loop
                        ForEach(cities.dropFirst().dropLast(), id: \.self) { city in
                            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24))
                                .frame(width: UIScreen.main.bounds.width
                                        - 32, height: 50)
                                .overlay {
                                    HStack{
                                        Text(city)
                                            .font(.title3)
                                            .foregroundStyle(.black)
                                        Spacer()
                                    }
                                    .padding()
                                }
                        }
                //lastcell
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24, bottomTrailing: 24))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                            .overlay {
                                HStack{
                                    Text(cities.last!)
                                        .font(.title3)
                                        .foregroundStyle(.black)
                                    Spacer()
                                }
                                .padding()
                            }
                    }
                }
                .safeAreaPadding(.bottom, 120)
                
                
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CitySearcherView()
}
