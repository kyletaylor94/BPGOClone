//
//  MapView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI
import MapKit

struct MapView: View {
    var sheetOffset: CGFloat
    private let defaultCapsulePosition: CGFloat = -80

    var body: some View {
        ZStack{
            Map()
            VStack{
                NavigationLink {
                    TravelFromToView()
                } label: {
                    Capsule()
                        .fill(.tabBG)
                        .stroke(.gray,style: StrokeStyle(lineWidth: 2.0))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 40)
                        .overlay {
                            HStack{
                                Text("Keresés útvonalra, járatra, megállóra")
                                
                                Spacer()
                                
                                Image(systemName: "magnifyingglass")
                            }
                            .padding(.horizontal)
                            .padding(.trailing, 5)
                            .foregroundStyle(.gray)
                        }
                }
                .offset(y: defaultCapsulePosition + calculateCapsuleOffset())
                .animation(.easeInOut, value: sheetOffset)
                
                
                Spacer()
                
                VStack(spacing: 20) {
                    HStack{
                        Spacer()
                        Button {
                            //show vehicles
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.navBG)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 2))
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "bus")
                                        .foregroundStyle(.tabButton)
                                        .font(.title3)
                                }
                        }
                    }
                    
                    HStack{
                        Spacer()
                        Button {
                            //back to user
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(.navBG)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 2))
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundStyle(.tabButton)
                                        .font(.title2)
                                }
                        }
                    }

                }
                .padding(.trailing)
                .padding(.top, -70 + sheetOffset / 2)
                
                Spacer()
            }
        }
    }
      private func calculateCapsuleOffset() -> CGFloat {
          // A minimum és maximum pozíció, ahol a Capsule mozogni kezd
          let activeRange: ClosedRange<CGFloat> = 550...623
          
          if activeRange.contains(sheetOffset) {
              // A tartományban a Capsule arányosan felfelé mozdul
              let progress = (sheetOffset - activeRange.lowerBound) / (activeRange.upperBound - activeRange.lowerBound)
              return progress * 85 // Felfelé mozdul 130 pontot
          }
          
          return 0
      }
}

#Preview {
    MapView(sheetOffset: 0)
}
