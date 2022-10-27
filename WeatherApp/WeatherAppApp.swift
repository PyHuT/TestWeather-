//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import SwiftUI

@main
struct WeatherAppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(store: CityStore.shared)
        }
    }
}
