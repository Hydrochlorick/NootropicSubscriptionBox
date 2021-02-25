//
//  Supplement.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/21/21.
//

import Foundation
import UIKit



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
    case adaptogen = "adapt"
    case mito = "mito"
    case choline = "choline"
    case energy = "energy"
    case noot = "noot"
    case mushrooms = "mush"
}
