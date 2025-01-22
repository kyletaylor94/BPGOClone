//
//  HowDoesItWorkTest.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 22..
//

import SwiftUI

protocol HowDoesItWorkSection {
    var image: ImageResource { get }
    var title: String { get }
    var subTitle: String { get }
    var id: Int { get }
}

struct HowDoesItWorkTest<Sections: HowDoesItWorkSection & CaseIterable & Identifiable & Hashable>: View
where Sections: RawRepresentable, Sections.RawValue == Int {
    var sections: [Sections]
    @Environment(\.dismiss) var dismiss
    //@State var currentIndex: Sections = Sections.allCases.first!
    @Binding var currentIndex: Sections
    
    var isAppWork: Bool
    
    var imageCount: Int {
        return sections.count
    }
    
    var body: some View {
        ZStack{
            Color.backGround.ignoresSafeArea()
            
            VStack(spacing: 70) {
                if isAppWork {
                    HStack{
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .foregroundStyle(.white)
                        
                    }
                    .padding()
                    
                    Spacer()
                } else {
                    CustomNavTitle(title: "Hogyan működik?", dismissAvailable: true)
                        .ignoresSafeArea()
                }
                
                TabView(selection: $currentIndex) {
                    ForEach(sections, id: \.id) { section in
                        VStack(spacing: 20) {
                            Image(section.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 200)
                            
                            Text(section.title)
                                .font(.title3)
                                .bold()
                            
                            Text(section.subTitle)
                        }
                        .tag(section)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                
                
                VStack(spacing: 30) {
                    HStack(spacing: 12) {
                        ForEach(0..<imageCount, id: \.self) { index in
                            Circle()
                                .fill(currentIndex.rawValue == index ? .white : .black)
                                .stroke(.gray,style: StrokeStyle())
                                .frame(height: 10)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}
