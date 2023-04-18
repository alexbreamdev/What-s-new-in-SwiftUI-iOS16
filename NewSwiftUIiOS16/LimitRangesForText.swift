//
//  LimitRangesForText.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct LimitRangesForText: View {
  
    var body: some View {
        Text("This is a very long text that is limited to a specific line range, so anything beyond that range will cause text to clip")
            .lineLimit(3...6)
            .frame(width: 200)
            .font(.title)
    }
}

struct LimitRangesForText_Previews: PreviewProvider {
    static var previews: some View {
        LimitRangesForText()
    }
}
