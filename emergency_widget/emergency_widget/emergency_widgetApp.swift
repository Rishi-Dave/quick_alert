//
//  emergency_widgetApp.swift
//  emergency_widget
//
//  Created by Rishi Dave on 11/18/23.
//

import SwiftUI
import Firebase
@main
struct emergency_widgetApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginSignupView()
        }
    }
}
