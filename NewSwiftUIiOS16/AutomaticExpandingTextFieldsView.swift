//
//  AutomaticExpandingTextFieldsView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct AutomaticExpandingTextFieldsView: View {
    @State private var bio = ""
    var body: some View {
        TextField("Enter your bio", text: $bio, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .lineLimit(...5) // limits textfield height and makes it scrolling
            .padding()
    }
}

struct AutomaticExpandingTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        AutomaticExpandingTextFieldsView()
    }
}
