//
//  DownloadWithCombine.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 25/11/2022.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    init() {
        getPosts()
    }
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data? in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
        //1.
    }
}
struct DownloadWithCombine: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct DownloadWithCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombine()
    }
}
