







//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
//    }
//        struct User: Codable {
//            var name: String
//            var address: Address
//        }
//
//        struct Address: Codable {
//            var street: String
//            var city: String
//        }
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink(destination: Text("Detail \(row)"))
//                {
//                    Text("Row \(row)")
//                }
//            }
//            .navigationBarTitle("SwiftUI")
//        }
        
        
//        NavigationView {
//                   VStack {
//                     NavigationLink(destination: Text("Detail View")) {
//                       Text("Hello World")
//                   }
//                   }
//                   .navigationBarTitle("SwiftUI")
//               }
        
        
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
//
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//        struct CustomText: View {
//            var text: String
//
//            var body: some View {
//                Text(text)
//            }
//
//            init(_ text: String) {
//                print("Creating a new CustomText")
//                self.text = text
//            }
//        }
        
        
        
//        VStack {
//        GeometryReader { geo in
//        Image("kasumi")
//        .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: geo.size.width)
//        .clipped()
//    }
//}
