
//
//  PreferencesView.swift
//  Swap Clothes
//
//  Created by Virgile Mino-Vercellis on 18/03/2021.
//

import SwiftUI

struct PreferencesView: View {
    
    @Binding var isPresented:Bool
    @ObservedObject var settingsStore: SettingsStore
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Clothes")) {
                    Toggle(isOn: $settingsStore.tshirt) {
                        Text("T-Shirt")
                    }.accentColor(.mint)
                    Toggle(isOn: $settingsStore.chemise) {
                        Text("Shirt")
                    }.accentColor(.mint)
                    Toggle(isOn: $settingsStore.jupe) {
                        Text("Skirt")
                    }.accentColor(.mint)
                    Toggle(isOn: $settingsStore.pantalon) {
                        Text("Pants")
                    }.accentColor(.mint)
                }
                Section(header: Text("Maximum distance")) {
                    Slider(value: $settingsStore.km, in: 0...100, step: 1)
                        .accentColor(.mint)
                    Text("\(settingsStore.km, specifier: "%.f")KM")
                }
            }
            
            .navigationBarTitle("Preferences")
            .navigationBarItems(leading: annulerButton, trailing: accepterButton)
        }
    }
    
}

extension PreferencesView {
    private var accepterButton: some View {
        Button("Save"){
            UserDefaults.standard.set(self.settingsStore.tshirt, forKey: UserDefaults.Keys.tshirt.rawValue);
            UserDefaults.standard.set(self.settingsStore.chemise, forKey: UserDefaults.Keys.chemise.rawValue);
            UserDefaults.standard.set(self.settingsStore.jupe, forKey: UserDefaults.Keys.jupe.rawValue);
            UserDefaults.standard.set(self.settingsStore.pantalon, forKey: UserDefaults.Keys.pantalon.rawValue);
            UserDefaults.standard.set(self.settingsStore.km, forKey: UserDefaults.Keys.km.rawValue)
            isPresented.toggle()
        }.foregroundColor(.mint)
    }
    private var annulerButton: some View {
        Button("Cancel"){
            isPresented.toggle()
            
        }.foregroundColor(.mint)
    }
}



struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(isPresented: .constant(true), settingsStore: SettingsStore())
    }
}
