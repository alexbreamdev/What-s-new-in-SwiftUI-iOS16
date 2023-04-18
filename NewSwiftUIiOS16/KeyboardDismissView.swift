//
//  KeyboardDismissView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct KeyboardDismissView: View {
    @State private var username: String = "Anonymous"
    @State private var bio: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Username", text: $username)
                TextEditor(text: $bio)
                    .frame(height: 400)
                    .border(.quaternary, width: 1)
            }
            .padding(.horizontal)
        }
        // Apple Guideline: texteditor - interactively
        // other views - .immediately
        .scrollDismissesKeyboard(.interactively)
    }
}

struct KeyboardDismissView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardDismissView()
    }
}
