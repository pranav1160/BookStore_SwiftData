//
//  BookStoreApp.swift
//  BookStore
//
//  Created by Pranav on 19/07/25.
//

import SwiftUI
import SwiftData


@main
struct BookStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(
            for: Book.self
        )
    }
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
