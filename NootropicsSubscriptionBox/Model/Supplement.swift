//
//  Supplement.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/21/21.
//

import Foundation
import UIKit

struct Order {
    var date: Date
    var contents: [Supplement]
    var imgName: String
}

struct SuppCategory {
    var title: String
    var image: UIImage
}

struct Supplement {
    var name: String
    var suppType: SuppType
    
}

enum ProductType: String, CaseIterable {
    case powder = "Powder"
    case capsule = "Capsule"
    case liquid = "Liquid"
    case combo = "Combo"
}

enum SuppType: String, CaseIterable {
    case adaptogen = "Adaptogens"
    case mito = "Mitochondrial Support"
    case cardio = "Cardiovascular Support"
    case energy = "Energy"
    case cognition = "Cognitive"
    case mushrooms = "Mushrooms"
}
