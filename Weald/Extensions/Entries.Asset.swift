//
//  Extension.swift
//  Weald
//
//  Created by Marcelo De Araújo on 15/09/23.
//

import Foundation

extension Entries.Asset {
    struct LocalizedPointOfInterest: Codable, Hashable, Identifiable {
        let id: String
        let timestamp: String
        let value: String

        var timeInterval: TimeInterval {
            TimeInterval(timestamp) ?? .nan
        }
    }

    func decodePointsOfInterest(from bundle: Bundle) -> [LocalizedPointOfInterest] {
        pointsOfInterest.map { (timestamp, localizationKey) in
            let localizedString = bundle
                .localizedString(forKey: localizationKey, value: nil, table: "Localizable.nocache")
                .replacingOccurrences(of: "\n", with: " ") /* there are some random line breaks that don't seem meaningful */
            return LocalizedPointOfInterest(id: localizationKey, timestamp: timestamp, value: localizedString)
        }
    }
}

extension Entries.Asset {
    enum VideoVariant: CaseIterable, Identifiable {
        case c_1080_H264
        case c_1080_HDR
        case c_1080_SDR
        case c_4K_HDR
        case c_4K_SDR

        var name: String {
            switch self {
            case .c_1080_H264: return "1080 H264"
            case .c_1080_HDR: return "1080 HDR"
            case .c_1080_SDR: return "1080 SDR"
            case .c_4K_HDR: return "4K HDR"
            case .c_4K_SDR: return "4K SDR"
            }
        }

        var id: Self { self }
    }

    func url(for videoVariant: VideoVariant) -> URL {
        switch videoVariant {
        case .c_1080_H264: return url_1080_H264
        case .c_1080_HDR: return url_1080_HDR
        case .c_1080_SDR: return url_1080_SDR
        case .c_4K_HDR: return url_4K_HDR
        case .c_4K_SDR: return url_4K_SDR
        }
    }
}
