//
//  Entries.swift
//  Weald
//
//  Created by Marcelo De Araújo on 15/09/23.
//

import Foundation

extension Entries {
    
    struct AssociatedAssets: Identifiable {
        let id: String
        let assets: [Entries.Asset]
    }

    var associatedAssets: [AssociatedAssets] {
        Dictionary(grouping: assets, by: \.accessibilityLabel)
            .map { (key: String, value: [Entries.Asset]) in
                AssociatedAssets(id: key, assets: value)
            }
            .sorted { $0.id < $1.id }
    }
}
