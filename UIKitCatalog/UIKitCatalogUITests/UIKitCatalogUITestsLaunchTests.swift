//
//  UIKitCatalogUITestsLaunchTests.swift
//  UIKitCatalogUITests
//
//  Created by Alex Andrade on 19/10/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import XCTest

final class UIKitCatalogUITestsLaunchTests: XCTestCase {
    
    var app = XCUIApplication(); // Extends XCUIElment

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // do nothing
    }

    //@MainActor
    /*func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }*/
    
    override func setUp() {
        super.setUp()
        
        app.launchArguments.append("-AppleInterfaceStyle")
        app.launchArguments.append("Light")
        app.launch()
        print("App launched");
    }
    
    func testExample() throws {
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Buttons"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Person"]/*[[".cells.buttons[\"Person\"]",".buttons[\"Person\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Buttons"].buttons["UIKitCatalog"].tap()
    }
    
    func testExample1() throws {
        app.staticTexts["Alert Views"].tap()
        
        // Handle the alert
        app.staticTexts["Simple"].tap()
        app.buttons["OK"].tap()
        
        // Handle the alert
        app.staticTexts["Okay / Cancel"].tap()
        app.buttons["Cancel"].tap()
    }
    
    func testExample11() throws {
        app.staticTexts["Search"].tap()
        app.staticTexts["Default"].tap()
        
        // Selection by index
        app.searchFields.element(boundBy: 0).tap()
        // Selection by default element
        app.searchFields.element.typeText("Hello, World!");
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    override func tearDown() {
        app.terminate();
    }
}
