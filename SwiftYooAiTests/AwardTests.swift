//
//  AwardTests.swift
//  SwiftYooAiTests
//
//  Created by Zachary Oxendine on 3/17/21.
//

import CoreData
import XCTest
@testable import SwiftYooAi

class AwardTests: BaseTestCase {
    let awards = Award.allAwards

    func testAwardIDMatchesName() {
        // Given When
        for award in awards {
            // Then
            XCTAssertEqual(award.id, award.name, "Award ID should always match its name.")
        }
    }

    func testNewUserHasNoAwards() {
        // Given When
        for award in awards {
            // Then
            XCTAssertFalse(dataController.hasEarned(award: award), "New users should have no earned awards.")
        }
    }

    func testAddingItems() {
        // Given
        let values = [1, 10, 20, 50, 100, 250, 500, 1000]

        // When
        for (count, value) in values.enumerated() {
            for _ in 0..<value {
                _ = Item(context: managedObjectContext)
            }

            let matches = awards.filter { award in
                award.criterion == "items" && dataController.hasEarned(award: award)
            }

            // Then
            XCTAssertEqual(matches.count, count + 1, "Adding \(value) items should unlock \(count + 1) awards.")

            dataController.deleteAll()
        }
    }

    func testCompletingItems() {
        // Given
        let values = [1, 10, 20, 50, 100, 250, 500, 1000]

        // When
        for (count, value) in values.enumerated() {
            for _ in 0..<value {
                let item = Item(context: managedObjectContext)
                item.completed = true
            }

            let matches = awards.filter { award in
                award.criterion == "complete" && dataController.hasEarned(award: award)
            }

            // Then
            XCTAssertEqual(matches.count, count + 1, "Completing \(value) items should unlock \(count + 1) awards.")

            dataController.deleteAll()
        }
    }
}
