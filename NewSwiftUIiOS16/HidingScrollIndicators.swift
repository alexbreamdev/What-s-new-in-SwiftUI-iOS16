//
//  HidingScrollIndicators.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct HidingScrollIndicators: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Some text")
                Text("Othertext")
            }
        }
//        Use this modifier to hide or show scroll indicators on scrollable content in views like a ScrollView, List, or TextEditor. This modifier applies the prefered visibility to any scrollable content within a view hierarchy.
        .scrollIndicators(.hidden)
//        Use this modifier if you would like to customise the immersive experience of your app by hiding or showing system overlays that may affect user experience. The following example hides every persistent system overlay.
        .persistentSystemOverlays(.hidden)
    }

}

struct HidingScrollIndicators_Previews: PreviewProvider {
    static var previews: some View {
        HidingScrollIndicators()
    }
}
