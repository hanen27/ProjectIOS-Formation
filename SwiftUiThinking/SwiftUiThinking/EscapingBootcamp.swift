//
//  EscapingBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 24/11/2022.
//

import SwiftUI
class EscapingViewModel : ObservableObject {
    @Published var text: String = "hello"
    func getData() {
        downloadData2 { [weak self] (result) in
            self?.text = result.data
        }
    }
    func downloadData(completionHandler: (_ data: String) -> Void) {
        completionHandler("New Data")
    }
    func downloadData2(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data")
            completionHandler(result)

        }
    }}
struct DownloadResult {
    let data: String
}
typealias downloadCompletion = (DownloadResult) -> () 
struct EscapingBootcamp: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
