//
//  AssetTests.swift
//  SwiftYooAiTests
//
//  Created by Zachary Oxendine on 1/19/21.
//

import XCTest
@testable import SwiftYooAi

class AssetTests: XCTestCase {
    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }

    func testJSONLoadsCorrectly() {
        XCTAssertFalse(Award.allAwards.isEmpty, "Failed to load awards from JSON.")
    }
}
