//
//  AddFavoriteRouteCell.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 23..
//

import SwiftUI

struct Route: Identifiable {
    let id = UUID()
    let from: String
    let to: String
    let routeNumber: String
}

let sampleRoutes = [
    Route(from: "Kőbánya alsó vasútáll.", to: "Óbuda, Bogdáni út", routeNumber: "9"),
    Route(from: "Keleti pályaudvar", to: "Budaörs, Auchan", routeNumber: "139"),
    Route(from: "Blaha Lujza tér", to: "Újpest központ", routeNumber: "950"),
]

struct AddFavoriteRouteCell: View {
    let routes: [Route]
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                ForEach(routes.indices, id: \.self) { index in
                    let route = routes[index]
                    
                    NavigationLink {
                        EmptyView()
                    } label: {
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: index == 0 ? 24 : 0,
                                bottomLeading: index == routes.count - 1 ? 24 : 0,
                                bottomTrailing: index == routes.count - 1 ? 24 : 0,
                                topTrailing: index == 0 ? 24 : 0
                            )
                        )
                        .fill(.navBG)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 70)
                        .overlay {
                            HStack {
                                CustomImage(iconName: "location", circleColor: .navBG, iconColor: .white)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 80, height: 28)
                                    .foregroundStyle(.blue)
                                    .overlay {
                                        Text(route.routeNumber)
                                            .bold()
                                    }
                                
                                VStack(alignment: .leading) {
                                    Text(route.from)
                                    Text(route.to)
                                }
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding()
                        }
                    }
                    .foregroundStyle(.primary)
                }
            }
        }
    }
}

#Preview {
    ZStack{
        Color.backGround.ignoresSafeArea()
        AddFavoriteRouteCell(routes: sampleRoutes)
    }
}
