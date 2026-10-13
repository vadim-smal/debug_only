import LinkedLibs
import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup { Text(LinkedLibs.names.joined(separator: "\n")) }
    }
}
