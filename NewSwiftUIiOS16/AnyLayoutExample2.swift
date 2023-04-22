//
//  AnyLayoutExample2.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 22.04.2023.
//

import SwiftUI

struct MyColors {
    var color: Color
    var width: CGFloat
    var height: CGFloat
    
    static var allColors:[MyColors] {
        [
            .init(color: .red, width: 60, height: 75),
            .init(color: .teal, width: 100, height: 100),
            .init(color: .purple, width: 40, height: 80),
            .init(color: .indigo, width: 120, height: 100)
        ]
    }
}


struct AnyLayoutExample2: View {
    var body: some View {
        NavigationStack {
            HStack {
                ForEach(MyColors.allColors, id: \.color) { myColor in
                    myColor.color
                        .frame(width: myColor.width, height: myColor.height)
                }
            }
            .padding()
            .navigationTitle("AnyLayout")
        }
    }
}

struct AnyLayoutExample2_Previews: PreviewProvider {
    static var previews: some View {
        AnyLayoutExample2()
    }
}
