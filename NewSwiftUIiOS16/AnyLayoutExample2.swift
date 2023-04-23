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
//    @State private var changeLayout: Bool = false
    @State private var layoutType: LayoutType = .zStack
    var body: some View {
        let layout = AnyLayout(layoutType.layout)
        NavigationStack {
            layout {
                ForEach(MyColors.allColors, id: \.color) { myColor in
                    myColor.color
                        .frame(width: myColor.width, height: myColor.height)
                }
            }
            .padding()
            .navigationTitle("AnyLayout")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            if layoutType == .zStack {
                                layoutType = .hStack
                            } else if layoutType == .hStack {
                                layoutType = .vStack
                            } else if layoutType == .vStack {
                                layoutType = .altStack
                            } else if layoutType == .altStack {
                                layoutType = .zStack
                            }
                        }
                    } label: {
                        Image(systemName: "list.bullet.rectangle")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

struct AnyLayoutExample2_Previews: PreviewProvider {
    static var previews: some View {
        AnyLayoutExample2()
    }
}

// MARK: - AnyLayout Controlling Enum
//
enum LayoutType: Int, CaseIterable {
    case zStack, hStack, vStack, altStack
    
    var index: Int {
        LayoutType.allCases.firstIndex(where: {$0 == self})!
    }
    
    var layout: any Layout {
        switch self {
        case .zStack:
            return ZStackLayout()
        case .hStack:
            return HStackLayout(alignment: .top, spacing: 0)
        case .vStack:
            return VStackLayout(alignment: .trailing)
        case .altStack:
            return AlternativeStackLayout()
        }
    }
}
