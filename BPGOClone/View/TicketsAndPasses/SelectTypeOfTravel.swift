//
//  SelectTypeOfTravel.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 14..
//

import SwiftUI

struct SelectTypeOfTravel: View {
    var body: some View {
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
                                    
                                    NavigationLink {
                                        TypeOfTravelView()
                                    } label: {
                                        HStack{
                                            Text("Helyi")
                                                .font(.subheadline)
                                            
                                            Image(systemName: "chevron.right")
                                        }
                                        .foregroundStyle(.white)
                                    }
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Város")
                                        .font(.caption)
                                    
                                    NavigationLink {
                                        CitySearcherView()
                                    } label: {
                                        HStack{
                                            Text("Budapest")
                                                .font(.subheadline)
                                            
                                            Image(systemName: "chevron.right")
                                        }
                                        .foregroundStyle(.white)
                                    }
                                }
                                
                                Spacer()
                                
                            }
                            .padding()
                        }
                }
                .padding(.top, 210)
                
            }
    }
}

#Preview {
    SelectTypeOfTravel()
}
