//
//  TravelSheetView.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 08..
//

import SwiftUI

enum TravelSheetSection: Int, Identifiable, CaseIterable {
    case departures
    case routes
    case stops
    case filter
    
    var titleName: String {
        switch self {
        case .departures:
            return "Indulások"
        case .routes:
            return "Járatok"
        case .stops:
            return "Megállók"
        case .filter:
            return "Szűrő"
        }
    }
    
    var id: Int { return self.rawValue }
}

struct TravelSheetView: View {
    @Binding var selectedIndex: Int
    @Binding var interactionIsHappened: Bool
    var body: some View {
        ZStack(alignment: .top) {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, topTrailing: 24))
            
            VStack{
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, bottomLeading: 30, bottomTrailing: 0, topTrailing: 24))
                    .fill(.customWhiteBlack)
                    .frame(width: UIScreen.main.bounds.width, height: 150)
                    .overlay {
                        VStack{
                            CustomTravelSelector(selectedIndex: $selectedIndex, interactionIsHappened: $interactionIsHappened)
                        }
                        .padding(.top,70)
                    }
                
                VStack{
                    switch selectedIndex {
                    case 0:
                        DeparturesView()
                        
                    case 1:
                        RoutesView()
                        
                    case 2:
                        StopsView()
                        
                    case 3:
                        Text("Szűrő")
                            .foregroundStyle(.white)
                        
                    default:
                        Text("default")
                            .foregroundStyle(.white)
                    }
                }
                
            }
            .ignoresSafeArea()
            .overlay {
                VStack{
                    Capsule()
                        .frame(width: 60, height: 5)
                        .foregroundStyle(.gray)
                    
                    Text("Németh László utca közelében")
                        .font(.title3)
                        .foregroundStyle(.customWhiteBlack)
                        .bold()
                        .padding(.top)
                        .padding(.trailing, 110)
                    
                    Spacer()
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    TravelSheetView(selectedIndex: .constant(2), interactionIsHappened: .constant(false))
}

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


struct DeparturesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack{
                Image(.planning1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 32)
            }
            
            VStack(spacing: 3) {
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
