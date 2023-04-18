//
//  SimpleGradientsAndShadowsView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct SimpleGradientsAndShadowsView: View {
    let colors: [Color] = [.blue, .green, .yellow, .orange, .red, .purple, .indigo]
    
    var body: some View {
//        Rectangle().fill(.blue.gradient)
        
        VStack {
            ForEach(colors, id: \.self) { color in
                Rectangle().fill(color.gradient)
            }
        }
        
    }
}

struct ShadowsView: View {
    var body: some View {
        HStack {
            // drop shadow
            Circle()
                .fill(.red.shadow(.drop(color: .black, radius: 20)))
                .padding()
            
            // inner shadow
            Circle()
                .fill(.blue.shadow(.inner( radius: 10)))
                .padding()
        }
    }
}

struct SimpleGradientsAndShadowsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SimpleGradientsAndShadowsView()
            ShadowsView()
        }
    }
}
