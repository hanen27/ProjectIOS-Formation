////
////  DownloadWithEscapingBootcamp.swift
////  SwiftUiThinking
////
////  Created by Hanen Abdelkrim on 24/11/2022.
////
//
//import SwiftUI
//struct PostModel: Identifiable, Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}
//class DownloadWithEscapinfViewmodel: ObservableObject {
//    @Published var posts: [PostModel] = []
//    init() {
//        getPosts()
//    }
//    func getPosts() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//
//        downloadData(fromUrl: url) { returnedData in
//            if let data = returnedData {
//                guard  let newPost = try? JSONDecoder().decode([PostModel].self, from: data) else {return}
//                DispatchQueue.main.async{ [weak self] in
//                    self?.posts = newPost
//
//                }
//            } else {
//                print("No  data")
//            }
//        }
//
//
//    }
//    func downloadData(fromUrl url: URL, completionHandler: @escaping(_ data: Data?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                print("No data.")
//                return
//            }
//            guard error == nil else {
//                print("ERROR: \(String(describing: error))")
//                return
//            }
//            guard let response = response as? HTTPURLResponse else {
//                print("Invalid response.")
//                return
//            }
//            guard response.statusCode >= 200 && response.statusCode < 300 else {
//                print("Status code should be 2xx, but is \(response.statusCode)")
//                completionHandler(nil)
//                return
//            }
//            completionHandler(data)
//        }.resume()
//    }
//}
//struct DownloadWithEscapingBootcamp: View {
//    @StateObject var vm = DownloadWithEscapinfViewmodel()
//    var body: some View {
//        List {
//            ForEach(vm.posts) {
//                post in
//                VStack(alignment: .leading){
//                    Text(post.title)
//                        .font(.headline)
//                    Text(post.body)
//                        .foregroundColor(.gray)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//            }
//        }
//    }
//}
//
//struct DownloadWithEscapingBootcamp_Previews: PreviewProvider {
//    static var previews: some View {
//        DownloadWithEscapingBootcamp()
//    }
//}
