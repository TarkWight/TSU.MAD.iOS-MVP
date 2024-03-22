//
//  MVPApp.swift
//  MVP
//


import SwiftUI

@main
struct MVPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(presenter: PhoneNumberPresenter(formatter: PhoneNumberFormatter()))        }
    }
}
