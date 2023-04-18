//
//  NavigationStackView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 17.11.2022.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(1..<50) { i in
                NavigationLink {
                    Text("Detail \(i)")
                } label: {
                    Label("Row of \(i)", systemImage: "\(i).circle" )
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

struct NavigationStackView2: View {
    var body: some View {
        NavigationStack {
            List(1..<50) { i in
                NavigationLink(value: i )
                {
                    Label("Row of \(i)", systemImage: "\(i).circle" )
                }
            }
            .navigationDestination(for: Int.self) { value in
                Text("Detail Value \(value)")
            }
            .navigationTitle("Navigation 2")
        }
    }
}
// MARK: - Navigation Path
struct NavigationStackView3: View {
    
    @State var preselectedValues = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $preselectedValues) {
            NavigationLink(value: "Example"){
               Text("Tap me")
            }
            
            List(1..<50) { i in
                NavigationLink(value: i) {
                    Label("Row of \(i)", systemImage: "\(i).circle" )
                }
            }
            .navigationDestination(for: Int.self) { value in
                Text("Int Destination Detail Value \(value)")
            }
            .navigationDestination(for: String.self) { value in
                Text("String Destination Detail Value \(value)")
            }
            .navigationTitle("Navigation 3")
        }
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStackView()
            NavigationStackView2()
                .previewDisplayName("Nav Stack 2")
            NavigationStackView3()
                .previewDisplayName("Nav Stack 3")
        }
    }
}
