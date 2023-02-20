//
//  CoreDataBootcamp.swift
//  SwiftUiThinking
//
//  Created by Hanen Abdelkrim on 23/11/2022.
//

import SwiftUI
import CoreData
//View - UI
//Model - data point
//ViewModel _ managers the data for view
class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntites: [FruitEntity] = []
    init () {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores {
            (description, error) in
            if let error = error {
                print("ERROR Loading core Data \(error)")
            } else {
                print("Successfully")
            }
        }
        fetchFruits()
    }
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntites =  try container.viewContext.fetch(request)
        } catch let error {
            print("ERROR FETCHNING. \(error)")
        }
    }
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntites[index]
    }
}
struct CoreDataBootcamp: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
               TextField("Add fruit here ..", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                Button (action: {
                    guard textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                    
                }, label: {
                    Text("save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .cornerRadius(10)

                    
                })
                .padding(.horizontal)
                List {
                    ForEach(vm.savedEntites) {
                        entity in
                        Text(entity.name ?? "no name")
                    }
                    .onDelete(perform: vm.deleteFruit)
                 }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
        }
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
