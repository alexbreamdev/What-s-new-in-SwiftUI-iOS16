//
//  MultipleDatePickerView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 02.03.2023.
//

import SwiftUI

struct MultipleDatePickerView: View {
    @State private var dates: Set<DateComponents> = []
    @Environment(\.calendar) var calendar
    
    var body: some View {
        VStack {
            MultiDatePicker("Select your preferred dates", selection: $dates, in: Date.now...)
                .frame(height: 300)
           Text(summary)
        }
    }
    // transform dateComponents from set to
    // date string values
    var summary: String {
        dates.compactMap { components in
            calendar.date(from:components)?.formatted(date:.long, time:.omitted)
        }.formatted()
    }
}

struct MultipleDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleDatePickerView()
    }
}
