//
//  SettingsStore.swift
//  Swap Clothes
//
//  Created by Iliane Zedadra on 23/03/2021.
//

import Foundation

import Foundation
import Combine
import SwiftUI

class SettingsStore: ObservableObject{
   @Published var tshirt = UserDefaults.standard.bool(forKey: UserDefaults.Keys.tshirt.rawValue)
   @Published var jupe = UserDefaults.standard.bool(forKey: UserDefaults.Keys.jupe.rawValue)
   @Published var pantalon = UserDefaults.standard.bool(forKey: UserDefaults.Keys.pantalon.rawValue)
   @Published var chemise = UserDefaults.standard.bool(forKey: UserDefaults.Keys.chemise.rawValue)
    @Published var km = UserDefaults.standard.double(forKey: UserDefaults.Keys.km.rawValue) 
}
