//
//  ExternalLinkButton.swift
//  BPGOClone
//
//  Created by Turdesan Csaba on 2025. 01. 21..
//

import SwiftUI

struct ExternalLinkButton: View {
    let text: String
    let icon: String
    let url: String
    
    var body: some View {
        Link(destination: URL(string: url)!) {
            CustomReuseableButton(
                text: text,
                icon: icon,
                topLeading: 24,
                topTrailing: 24,
                bottomLeading: 0,
                bottomTrailing: 0
            )
        }
    }
}

#Preview {
    ExternalLinkButton(text: "Hello there", icon: "gear", url: "https://google.com/")
}
