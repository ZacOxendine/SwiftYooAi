//
//  SwiftYooAiApp.swift
//  SwiftYooAi
//
//  Created by Zachary Oxendine on 10/26/20.
//

import SwiftUI

@main
struct SwiftYooAiApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
