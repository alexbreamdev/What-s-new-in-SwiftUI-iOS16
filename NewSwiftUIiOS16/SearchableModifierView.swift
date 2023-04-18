//
//  SearchableModifierView.swift
//  NewSwiftUIiOS16
//
//  Created by Oleksii Leshchenko on 02.03.2023.
//

import SwiftUI

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct SearchableModifierView: View {
    @State private var messages: [Message] = []
    @State private var searchText: String = ""
    @State private var searchScope: SearchScope = .inbox
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredMessages) { message in
                    VStack(alignment: .leading) {
                        Text(message.user)
                            .font(.headline)
                        
                        Text(message.text)
                    }
                }
            }
            .searchable(text: $searchText)
            .searchScopes($searchScope) {
                // are shown if value entered in search field
                // not on start
                Text("Inbox").tag(SearchScope.inbox)
                Text("Favorites").tag(SearchScope.favorites)
                
            }
            .navigationTitle("Messages")
        }
        .onSubmit(of: .search, runSearch)
        // reacts on change in search field
        .onChange(of: searchScope) { _ in
            runSearch()
        }
        // added this to show that something happens on app start
        .onAppear {
            runSearch()
        }
    }
    
    var filteredMessages: [Message] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter {
                $0.text.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            messages = try JSONDecoder().decode([Message].self, from: data)
        }
    }
}

struct SearchableModifierView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableModifierView()
    }
}
