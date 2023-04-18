//
//  AnyLayoutExampleView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI
// MARK: - anyLayout changes vstack to hstack dynamicly based on environment
struct AnyLayoutExampleView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize // this is where accessibility sizes come from
    @Environment(\.horizontalSizeClass) var horizontalSizeClass // size based on screen type
    
    // a view that AnyLayout uses have to confirm to Layout protocol
    var body: some View {
        let layout = dynamicTypeSize == .medium ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())

        layout {
            Image(systemName:  "1.circle")
            Image(systemName:  "2.circle")
            Image(systemName:  "13.circle")
        }
        .font(.largeTitle)
    }
}

struct AnyLayoutExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AnyLayoutExampleView()
    }
}
