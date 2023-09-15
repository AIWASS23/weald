//
//  WealdApp.swift
//  Weald
//
//  Created by Marcelo De Araújo on 15/09/23.
//

import SwiftUI

@main
struct WealdApp: App {

    var resourceDescriptor: Resources.Descriptor {
        let supportDirectories = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        guard let supportDirectory = supportDirectories.first else { fatalError("Could not locate resource directory") }
        let resourceURL = supportDirectory.appendingPathComponent("Weald/Resources-15")
        return Resources.Descriptor(directory: resourceURL)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(resourceDescriptor: resourceDescriptor)
                // set some minimum dimensions to avoid very small sizes, and odd re-sizing during the download flow
                .frame(minWidth: 360, minHeight: 240)
        }
        .commands {
            SidebarCommands()
        }
    }
}
