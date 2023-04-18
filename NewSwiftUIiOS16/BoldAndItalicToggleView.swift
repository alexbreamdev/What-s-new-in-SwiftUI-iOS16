//
//  BoldAndItalicToggleView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct BoldAndItalicToggleView: View {
    @State private var useBold: Bool = false
    @State private var useItalic: Bool = false
    var body: some View {
        VStack {
            Text("Welcome to SwiftUI 4.0")
                .bold(useBold)
                .italic(useItalic)
            
            
            Toggle("Use Bold", isOn: $useBold)
            Toggle("Use Italic", isOn: $useItalic)
        }
        .padding()
        .font(.title)
    }
}

struct BoldAndItalicToggleView_Previews: PreviewProvider {
    static var previews: some View {
        BoldAndItalicToggleView()
    }
}
