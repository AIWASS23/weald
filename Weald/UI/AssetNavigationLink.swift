//
//  AssetNavigationLink.swift
//  Weald
//
//  Created by Marcelo De Araújo on 15/09/23.
//

import SwiftUI

struct AssetNavigationLink: View {
    let asset: Entries.Asset
    let pointsOfInterest: [Entries.Asset.LocalizedPointOfInterest]

    init(asset: Entries.Asset, decodeBundle: Bundle) {
        self.asset = asset
        self.pointsOfInterest = asset.decodePointsOfInterest(from: decodeBundle)
            .sorted { $0.timeInterval < $1.timeInterval }
    }

    var navigationTitle: String {
        pointsOfInterest.first?.value ?? asset.accessibilityLabel
    }

    var body: some View {
        NavigationLink {
            AssetView(asset: asset, pointsOfInterest: pointsOfInterest)
        } label: {
            Text(navigationTitle)
                .font(.body)
                .lineLimit(nil)
        }
    }
}
