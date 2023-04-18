//
//  RequestReviewFromUserView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 03.03.2023.
//

import SwiftUI
import StoreKit // -> import storekit


// MARK: - Enables request from users from the appstore
struct RequestReviewFromUserView: View {
    
    @Environment(\.requestReview) var requestReview
    
    // don't use on obvious ui input
    // use system features like: how many times app was launched
    var body: some View {
        Button("Review the app") {
            requestReview()
        }
    }
}

struct RequestReviewFromUserView_Previews: PreviewProvider {
    static var previews: some View {
        RequestReviewFromUserView()
    }
}
