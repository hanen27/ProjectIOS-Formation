//
//  CodableBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 24/11/2022.
//

import SwiftUI
struct CustomModel : Identifiable, Decodable, Encodable {
    let id : String
    let name: String
    let points: Int
    let isPremium: Bool
    enum CodingKeyss: String , CodingKey {
        case id
        case name
        case points
        case isPremium
    }
    init(id: String, name: String, points: Int, isPremium: Bool ){
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
        
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeyss.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
        

    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeyss.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(points, forKey: .points)
        try container.encode(isPremium, forKey: .isPremium)

    }
}
class CodableViewModel: ObservableObject {
    @Published var customer: CustomModel? = nil
    init() {
        getData()
    }
    func getData() {
        guard let data = getJSONData() else {return}
        do {
            self.customer = try JSONDecoder().decode(CustomModel.self, from: data)
        } catch let error {
            print("error \(error)")
        }
      
//        if
//        let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//        let dictionary = localData as? [String:Any] ,
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//        let isPremium = dictionary["isPremium"] as? Bool {
//
//            let newCustomer = CustomModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//        }
        
    }
    func getJSONData() -> Data?{
        let customer = CustomModel(id: "111", name: "Emily", points: 100, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        let disctionary: [String:Any] = [
            "id" : "12345",
            "name" : "joe",
            "points" : 4,
            "isPremium" : true
        ]
        //let jsonData = try? JSONSerialization.data(withJSONObject: disctionary , options: [] )
        return jsonData
    }
}

struct CodableBootcamp: View {
    @StateObject var vm = CodableViewModel()
    var body: some View {
        VStack(spacing: 20)
        {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
            
        }
        
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
