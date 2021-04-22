import SwiftUI
struct Contact: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String?
}
