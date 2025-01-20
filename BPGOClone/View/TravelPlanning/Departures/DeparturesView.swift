//
//  DeparturesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 11..
//

import SwiftUI

struct DeparturesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack{
                Image(.planning1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 32)
            }
            
            VStack(spacing: 8) {
                //MARK: - departurescells
                ForEach(0..<20) { _ in
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24))
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle())
                        .frame(width: UIScreen.main.bounds.width - 12, height: 100)
                        .overlay {
                            VStack(spacing: 5) {
                                HStack{
                                    Circle()
                                        .frame(height: 25)
                                        .foregroundStyle(.cyan)
                                        .overlay {
                                            Image(systemName: "bus")
                                                .font(.system(size: 13))
                                                .foregroundStyle(.white)
                                        }
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 60, height: 23)
                                        .foregroundStyle(.cyan)
                                        .overlay {
                                            Text("105")
                                                .foregroundStyle(.white)
                                                .bold()
                                        }
                                    
                                    Image(systemName: "triangle.fill")
                                        .rotationEffect(.degrees(90))
                                    
                                    Text("Gyöngyösi utca M")
                                        .bold()
                                        .font(.subheadline)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "wifi")
                                    
                                    Text("MOST")
                                    
                                    Circle()
                                        .frame(height: 10)
                                }
                                
                                HStack{
                                    Circle()
                                        .frame(height: 8)
                                        .foregroundStyle(.cyan)
                                    
                                    Text("Kiss János altábornagy utca")
                                        .font(.caption)
                                    
                                    Spacer()
                                    
                                    Text("8 perc")
                                        .font(.caption)
                                    
                                    Circle()
                                        .frame(height: 10)
                                }
                                
                                HStack{
                                    Text("19.3km")
                                        .bold()
                                        .font(.caption)
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Text("29 perc")
                                        .bold()
                                        .font(.caption)
                                    
                                    Circle()
                                        .frame(height: 10)
                                }
                            }
                            .padding()
                        }
                }
            }
        }
    }
}

#Preview {
    DeparturesView()
}
