//
//  ForegroundcolorAnimationView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct ForegroundcolorAnimationView: View {
    @State private var useRed: Bool = false
    var body: some View {
        Text("WWDC22")
            .font(.largeTitle.bold())
            .foregroundColor(useRed ? .red: .blue)
            .onTapGesture {
                withAnimation {
                    useRed.toggle()
                }
            }
    }
}

struct ForegroundcolorAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundcolorAnimationView()
    }
}
