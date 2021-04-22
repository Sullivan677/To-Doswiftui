import SwiftUI
import Firebase
@main
struct TodoFirebaseApp: App {
    
    init() {
    FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
