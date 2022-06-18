//
//  WeSplitApp.swift
//  WeSplit
//
//  Created by Jacek on 18/06/2022.
//

import SwiftUI

@main
struct WeSplitApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
