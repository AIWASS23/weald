//
//  SidebarSectionHeader.swift
//  Weald
//
//  Created by Marcelo De Araújo on 15/09/23.
//

import SwiftUI

struct SidebarSectionHeader<T: StringProtocol>: View {
    let title: T

    init(_ title: T) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .foregroundColor(.secondary)
            .font(.headline)
    }
}

struct SidebarSectionHeaderPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
                List {
                    Section(header: SidebarSectionHeader("Title")) {
                        Text("Content")
                    }
                }
                .listStyle(.sidebar)
                .preferredColorScheme(colorScheme)
                .frame(width: 200, height: 80)
            }
        }
    }
}

