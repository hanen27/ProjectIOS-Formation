//
//  ArraysBOOTCAMP.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 22/11/2022.
//

import SwiftUI
struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
    
}
class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var fileredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    init() {
        getUsers()
        updateFileredArray()
    }
    func updateFileredArray() {
        // map
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name
//        })
//        mappedArray = dataArray.compactMap({ (user) ->String? in
//            return user.name
//        })
//        mappedArray = dataArray.map({$0.name})
        //sort
//        fileredArray = dataArray.sorted {
//            (user1, user2)-> Bool in
//            return user1.points > user2.points
//        }
//        fileredArray = dataArray.sorted(by: {$0.points > $1.points})
        //filter
//        fileredArray = dataArray.filter({ (user) -> Bool in
//            return user.isVerified
//        })
      //  fileredArray = dataArray.filter({$0.isVerified})
        
    }
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "hanen", points: 6, isVerified: false)
        let user3 = UserModel(name: "sabri", points: 23, isVerified: false)
        let user4 = UserModel(name: "safwen", points: 4, isVerified: true)
        let user5 = UserModel(name: "sarah", points: 22, isVerified: true)
        let user6 = UserModel(name: nil, points: 15, isVerified: false)
        let user7 = UserModel(name: nil, points: 40, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7])
    }
}
struct ArraysBOOTCAMP: View {
    @StateObject var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) {
                    name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(vm.fileredArray) {
//                    user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("points:\(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBOOTCAMP_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBOOTCAMP()
    }
}
