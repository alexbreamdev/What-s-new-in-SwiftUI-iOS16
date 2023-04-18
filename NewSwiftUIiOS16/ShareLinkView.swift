//
//  ShareLinkView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 18.11.2022.
//

import SwiftUI

struct ShareLinkView: View {
    let link = URL(string: "https://hackingwithswift.com")!
    var body: some View {
        
        VStack(spacing: 20) {
            ShareLink(item: link, message: Text("The best of the best"))
            ShareLink("Learn swift here", item: link)
            ShareLink(item: link) {
                Label("Swift Here", systemImage: "swift")
            }
        }
    }
}

struct ShareLinkView2: View {
    let link = URL(string: "https://hackingwithswift.com")!
    var body: some View {
        
        VStack(spacing: 20) {
            ShareLink(item: link, preview: SharePreview(Text("Tap the text"), image: Image(systemName: "plus")))
        }
    }
}


struct ShareLinkView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShareLinkView()
            ShareLinkView2().previewDisplayName("Link view 2")
        }
    }
}
