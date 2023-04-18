//
//  BottomSheetView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 18.11.2022.
//

import SwiftUI

struct BottomSheetView: View {
    @State private var showingCredits = false
    var body: some View {
        Button("Showing credits") {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Text("This application is made by Alex Bream")
            //.presentationDetents([.medium, .large])
            // OR
            // .presentationDetents([.height(300), .height(450)])
            // OR
                .presentationDetents([.fraction(0.25), .fraction(0.75)])
            // MARK: - Indicator -- on top hidden
                .presentationDragIndicator(.hidden)
        }
    #warning("Can't be dismissed in landscape mode")
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
