import Foundation
import FirebaseFirestore
class ContactViewModel: ObservableObject {
    
    @Published var contacts = [Contact]()
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("contacts").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.contacts = documents.map { (queryDocumentSnapshot) -> Contact in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                return Contact(name: name)
            }
        }
    }
    
    func addData(name: String) {
        do {
            _ = try db.collection("contacts").addDocument(data: ["name": name])
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
