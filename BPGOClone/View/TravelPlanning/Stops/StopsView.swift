//
//  StopsView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 11..
//

import SwiftUI

struct StopsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<20) { _ in
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20))
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle())
                    .frame(width: UIScreen.main.bounds.width - 12, height: 90)
                    .overlay {
                        VStack{
                            HStack{
                                ZStack{
                                    Circle()
                                        .fill(.black)
                                        .stroke(.yellow, style: StrokeStyle(lineWidth: 5))
                                        .frame(height: 15)
                                    
                                    Circle()
                                        .stroke(style: StrokeStyle())
                                        .frame(height: 22)
                                    Image(systemName: "triangle.fill")
                                        .font(.system(size: 8))
                                        .offset(y: -15)
                                        .rotationEffect(.degrees(190))
                                }
                                
                                Text("Királyhágó tér")
                                    .bold()
                                    .foregroundStyle(.white)
                                
                                Button {
                                    //add to the favorite
                                } label: {
                                    Image(systemName: "star")
                                }
                                .foregroundStyle(.gray)
                                
                                Spacer()
                                
                                VStack{
                                    Text("18.9")
                                    Text("km")
                                }
                                .font(.caption)
                                
                            }
                            
                            HStack{
                                Circle()
                                    .frame(height: 25)
                                    .foregroundStyle(.yellow)
                                    .overlay {
                                        Image(systemName: "bus")
                                            .foregroundStyle(.black)
                                            .font(.subheadline)
                                    }
                                
                                ForEach(0..<3) { _ in
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 50, height: 20)
                                        .foregroundStyle(.yellow)
                                        .overlay {
                                            Text("24")
                                                .bold()
                                                .foregroundStyle(.black)
                                        }
                                }
                                Spacer()
                            }
                        }
                        .padding()
                    }
            }
        }
    }
}

#Preview {
    StopsView()
}
