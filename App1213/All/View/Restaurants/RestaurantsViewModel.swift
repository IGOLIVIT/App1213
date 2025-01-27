//
//  RestaurantsViewModel.swift
//  App1213
//
//  Created by IGOR on 27/01/2025.
//

import SwiftUI
import CoreData

final class RestaurantsViewModel: ObservableObject {

    @Published var images: [String] = ["re1", "re2", "re3"]
    @Published var curIm = ""
    
    @Published var imagesFood: [String] = ["t1", "t2", "t3", "t4", "t5"]
    @Published var curImFood = ""

    @Published var isAdd: Bool = false
    @Published var isAddFood: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var curRate: Int = 1
    @Published var curRateFood: Int = 1

    @Published var reNF: String = ""
    @Published var rePhoto: String = ""
    @Published var reRate: String = ""
    @Published var reCom: String = ""
    @Published var reNewCom: String = ""

    @Published var restaurants: [RestModel] = []
    @Published var selectedRest: RestModel?

    func addRest() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "RestModel", into: context) as! RestModel

        loan.reNF = reNF
        loan.rePhoto = rePhoto
        loan.reCom = reCom
        loan.reNewCom = reNewCom
        loan.reRate = reRate

        CoreDataStack.shared.saveContext()
    }

    func fetchRests() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RestModel>(entityName: "RestModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.restaurants = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.restaurants = []
        }
    }

    @Published var fNF: String = ""
    @Published var fPhoto: String = ""
    @Published var fRate: String = ""
    @Published var fRest: String = ""
    @Published var fCost: String = ""

    @Published var foods: [FoodModel] = []
    @Published var selectedFood: FoodModel?

    func addFood() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FoodModel", into: context) as! FoodModel

        loan.fNF = fNF
        loan.fPhoto = fPhoto
        loan.fRate = fRate
        loan.fRest = fRest
        loan.fCost = fCost

        CoreDataStack.shared.saveContext()
    }

    func fetchFoods() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FoodModel>(entityName: "FoodModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.foods = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.foods = []
        }
    }
}
