//
//  OnTapGestureLocationView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 18.11.2022.
//

import SwiftUI

// MARK: - Tap gives local coordinates
struct OnTapGestureLocationView: View {
    
    @State var locationTapped: CGPoint = CGPoint(x: 0, y: 0)
    
    var body: some View {
        VStack {
            Circle()
                .fill(.blue.opacity(0.7))
                .frame(width: 150, height: 150)
                .onTapGesture { location in
                    locationTapped = location
            }
            
            Text("Location tapped \nx: \(locationTapped.x) y: \(locationTapped.y) ")
                .font(.title3)
                .padding(.top, 40)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
        }
    }
}

// MARK: - Tap gives global coordinates
struct OnTapGestureLocationGlobalView: View {
    
    @State var locationTapped: CGPoint = CGPoint(x: 0, y: 0)
    
    var body: some View {
        VStack {
            Circle()
                .fill(.blue.opacity(0.7))
                .frame(width: 150, height: 150)
                .onTapGesture(coordinateSpace: .global) { location in
                    locationTapped = location
            }
            
            Text("Location tapped \nx: \(locationTapped.x) y: \(locationTapped.y) ")
                .font(.title3)
                .padding(.top, 40)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
        }
    }
}

struct OnTapGestureLocationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnTapGestureLocationView()
            OnTapGestureLocationGlobalView().previewDisplayName("Global")
        }
    }
}
