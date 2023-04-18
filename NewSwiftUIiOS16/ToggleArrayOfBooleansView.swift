//
//  ToggleArrayOfBooleansView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI

struct EmailList: Identifiable {
    var id: String
    var isSubscribed = false
    
}

struct ToggleArrayOfBooleansView: View {
    @State private var lists = [
       EmailList(id: "Monthly Updates", isSubscribed: true),
       EmailList(id: "Newsflashes", isSubscribed: true),
       EmailList(id: "Special Offers", isSubscribed: true)
    ]
    var body: some View {
        Form {
            Section {
                ForEach($lists) { $list in
                    Toggle(list.id, isOn: $list.isSubscribed)
                }
            }
            
            Section {
                Toggle(sources: $lists, isOn: \.isSubscribed) {
                    Text("Subscribe to All")
                }
            }
        }
        
    }
}

struct ToggleArrayOfBooleansView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleArrayOfBooleansView()
    }
}
