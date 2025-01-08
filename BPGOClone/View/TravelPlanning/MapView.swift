//
//  MapView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        ZStack{
            Map()
            
            VStack{
                Capsule()
                    .fill(.black)
                    .stroke(.gray,style: StrokeStyle(lineWidth: 2.0))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 40)
                    .overlay {
                        HStack{
                            Text("Keresés útvonalra, járatra, megállóra")
                            
                            Spacer()
                            
                            Image(systemName: "magnifyingglass")
                        }
                        .padding(.horizontal)
                        .padding(.trailing)
                        .foregroundStyle(.white)
                    }
                
                Spacer()
                
                VStack(spacing: 20) {
                    HStack{
                        Spacer()
                        Button {
                            //show vehicles
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.black)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 2))
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "house")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                }
                        }
                    }
                    
                    HStack{
                        Spacer()
                        Button {
                            //back to user
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.black)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 2))
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "house")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                }
                        }
                    }
                }
                .padding(.trailing)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MapView()
}
