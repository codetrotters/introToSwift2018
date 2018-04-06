//
//  Vehicle.swift
//  Homework1_InClass
//
//  Created by Kevin Lopez on 4/5/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

struct Vehicle {
    let maker: String
    let model: String
    let price: Double
    let url: URL
}

extension Vehicle {
    
    var formattedPrice: String {
        return String(format: "%.2f", arguments: [self.price])
    }
}

extension Vehicle {
    static var testData: [Vehicle] {
        let firstVehicle = Vehicle(maker: "Chevy", model: "Bolt", price: 20000, url: URL(string: "https://img.gaadicdn.com/images/car-images/large/Chevrolet/Chevrolet-Beat/Chevrolet-Beat-Facelift/047.jpg")!)
        let secondVehicle = Vehicle(maker: "Nissan", model: "Bolt", price: 20000, url: URL(string: "https://img.gaadicdn.com/images/car-images/large/Chevrolet/Chevrolet-Beat/Chevrolet-Beat-Facelift/047.jpg")!)
        let thirdVehicle = Vehicle(maker: "Buick", model: "Bolt", price: 20000, url: URL(string: "https://img.gaadicdn.com/images/car-images/large/Chevrolet/Chevrolet-Beat/Chevrolet-Beat-Facelift/047.jpg")!)
        let fourthVehicle = Vehicle(maker: "Dodge", model: "Bolt", price: 20000, url: URL(string: "https://img.gaadicdn.com/images/car-images/large/Chevrolet/Chevrolet-Beat/Chevrolet-Beat-Facelift/047.jpg")!)
        return [firstVehicle, secondVehicle, thirdVehicle, fourthVehicle]
    }
}
