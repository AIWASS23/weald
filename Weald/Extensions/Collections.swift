//
//  Collections.swift
//  Weald
//
//  Created by Marcelo De Araújo on 15/09/23.
//

import Foundation

extension Collection where Element: Identifiable {
    var identifiableLookup: [Element.ID: Element] {
        reduce(into: [:]) { lookup, element in
            lookup[element.id] = element
        }
    }
}
