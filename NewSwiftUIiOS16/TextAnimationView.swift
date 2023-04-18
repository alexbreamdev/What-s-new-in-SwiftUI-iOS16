//
//  TextAnimationView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct TextAnimationView: View {
    @State private var useBlack = false
    
    var body: some View {
        Text("Hello world")
            .font(.largeTitle)
            .fontWeight(useBlack ? .black: .ultraLight)
            .onTapGesture {
                withAnimation {
                    useBlack.toggle()
                }
            }
    }
}

struct TextAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TextAnimationView()
    }
}
