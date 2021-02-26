//
//  Supplement.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/21/21.
//

import Foundation
import UIKit

// TODO This is redundant right now because I'm treating each Supplement "type" like its own distinct item, instead of as a category for the items. Final version would have a database of all of the shops items, so they'd be their own objects. User should be able to have quick access to pages with information on each one.

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
