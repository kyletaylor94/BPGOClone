//
//  RoutesView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 11..
//

import SwiftUI

struct RoutesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
//MARK: - Routes first and last cell!
            VStack(spacing: 2) {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, bottomLeading: 40))
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle())
                    .frame(width: UIScreen.main.bounds.width - 12, height: 50)
                    .overlay {
                        HStack{
                            Circle()
                                .frame(height: 25)
                                .foregroundStyle(.yellow)
                                .overlay {
                                    Image(systemName: "bus")
                                        .font(.subheadline)
                                        .foregroundStyle(.black)
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
                        .padding()
                    }
                
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 24))
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle())
                    .frame(width: UIScreen.main.bounds.width - 12, height: 110)
                    .overlay {
                        HStack(alignment: .top, spacing: 22) {
                            Circle()
                                .frame(height: 25)
                                .foregroundStyle(.cyan)
                                .overlay {
                                    Image(systemName: "bus")
                                        .font(.subheadline)
                                        .foregroundStyle(.white)
                                }
                            LazyVGrid(columns: Array(repeating: GridItem(.fixed(50)), count: 5), spacing: 10) {
                                ForEach(0..<13) { _ in
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 50, height: 20)
                                        .foregroundStyle(.yellow)
                                        .overlay {
                                            Text("24")
                                                .bold()
                                                .foregroundStyle(.black)
                                        }
                                }
                            }
                            Spacer()
                        }
                        .padding()
                    }
                
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 40, bottomLeading: 40))
                    .fill(.navBG)
                    .stroke(.gray, style: StrokeStyle())
                    .frame(width: UIScreen.main.bounds.width - 12, height: 50)
                    .overlay {
                        HStack{
                            Circle()
                                .frame(height: 25)
                                .foregroundStyle(.yellow)
                                .overlay {
                                    Image(systemName: "bus")
                                        .font(.subheadline)
                                        .foregroundStyle(.black)
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
                        .padding()
                    }
            }
        }
    }
}

#Preview {
    RoutesView()
}
