//
//  weakSelfBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 23/11/2022.
//

import SwiftUI

struct weakSelfBootcamp: View {
    @AppStorage("count") var count: Int?
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen())
                .navigationTitle("screen 1")
        }
        .overlay(
        Text("\(count ?? 0)")
            .font(.largeTitle)
            .padding()
            .background(Color.green.cornerRadius(10))
        , alignment: .topTrailing
        
        )
    }
}
struct WeakSelfSecondScreen: View {
@StateObject var vm = WeakSelfSecondScreenViewModel()
    var body: some View {
        VStack{
            Text("second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            if let data = vm.data {
                Text(data)
            }
        }
       
    }
}
class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    init() {
        print("INITALIZÉ  NOW")
        let currentCount =  UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    deinit {
        print("Deninitailize now")
        let currentCount =  UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    func getData() {
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "new data !!"

        }
    }
}
struct weakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        weakSelfBootcamp()
    }
}
