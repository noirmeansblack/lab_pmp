//
//  test.swift
//  test1Tests
//
//  Created by jake on 3/25/19.
//  Copyright © 2019 jake. All rights reserved.
//

import XCTest
@testable import Lab1

class test: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        
        let ourScreen = ViewController()
        var numberToSqr = 10
        let expectedResult = 100
        
        ourScreen.square(&numberToSqr)
        
        XCTAssertEqual(numberToSqr, expectedResult)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
