//
//  SwiftYooAiTests.swift
//  SwiftYooAiTests
//
//  Created by Zachary Oxendine on 1/19/21.
//

import CoreData
import XCTest
@testable import SwiftYooAi

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
