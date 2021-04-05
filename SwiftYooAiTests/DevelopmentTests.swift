//
//  DevelopmentTests.swift
//  SwiftYooAiTests
//
//  Created by Zachary Oxendine on 4/1/21.
//

import CoreData
import XCTest
@testable import SwiftYooAi

class DevelopmentTests: BaseTestCase {
    func testSampleDataCreationWorks() throws {
        // Given When
        try dataController.createSampleData()

        // Then
        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 5, "There should be 5 sample projects.")
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 50, "There should be 50 sample items.")
    }

    func testDeleteAllClearsEverything() throws {
        // Given
        try dataController.createSampleData()

        // When
        dataController.deleteAll()

        // Then
        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 0, "deleteAll() should leave 0 projects.")
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 0, "deleteAll() should leave 0 items.")
    }

    func testExampleProjectIsClosed() {
        // Given When
        let project = Project.example

        // Then
        XCTAssertTrue(project.closed, "The example project should be closed.")
    }

    func testExampleItemIsHighPriority() {
        // Given When
        let item = Item.example

        // Then
        XCTAssertEqual(item.priority, 3, "The example item should be high priority.")
    }
}
