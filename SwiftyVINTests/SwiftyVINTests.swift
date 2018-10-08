//
//  SwiftyVINTests.swift
//  SwiftyVINTests
//
//  Created by Majd Sabah on 10/7/18.
//  Copyright © 2018 Majd Sabah. All rights reserved.
//

import XCTest
@testable import SwiftyVIN

class SwiftyVINTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVINLength() {
        
        XCTAssertEqual(SwiftyVIN.validVINLength("1FACP45EXLF192944"), true, "vaild length")
        XCTAssertEqual(SwiftyVIN.validVINLength("1FACP45EXLF19294"), false, "invaild length")
        XCTAssertEqual(SwiftyVIN.validVINLength("1FACP45EXLF1929444"), false, "invaild length")
        
    }
    
    func testVINCharacters() {
        
        XCTAssertEqual(SwiftyVIN.validVINCharacters("1FACP45EXLF192944"), true, "vaild characters")
        XCTAssertEqual(SwiftyVIN.validVINCharacters("1FACP45EXLF19294Q"), false, "invaild characters")
        XCTAssertEqual(SwiftyVIN.validVINCharacters("1FACP45EXLF19294I"), false, "invaild characters")
        XCTAssertEqual(SwiftyVIN.validVINCharacters("1FACP45EXLF19294O"), false, "invaild characters")
        
    }
    
    func testVINCharacterAtIndex() {
        
        XCTAssertEqual(SwiftyVIN.validVINCharacter("1FACP45EXLF192944", at: VINConstants.tenthCharIndex), true, "vaild character at character 10")
        XCTAssertEqual(SwiftyVIN.validVINCharacter("1FACP45EXUF192944", at: VINConstants.tenthCharIndex), false, "invaild character at character 10")
        XCTAssertEqual(SwiftyVIN.validVINCharacter("1FACP45EXZF192944", at: VINConstants.tenthCharIndex), false, "invaild character at character 10")
        XCTAssertEqual(SwiftyVIN.validVINCharacter("1FACP45EX0F192944", at: VINConstants.tenthCharIndex), false, "invaild character at character 10")
        
    }
    
    func testVINCheckDigit() {
        
        XCTAssertEqual(SwiftyVIN.validVINCheckDigit("1FACP45EXLF192944"), true, "vaild check digit")
        XCTAssertEqual(SwiftyVIN.validVINCheckDigit("1B4YEM9P4KP186543"), false, "invaild check digit")
        XCTAssertEqual(SwiftyVIN.validVINCheckDigit("1FACP45EGLF192944"), false, "invaild check digit")
        
    }
    
    func testVINRepeatedCharacter() {
        
        XCTAssertEqual(SwiftyVIN.validVINRepeatedCharacters("1FACP45EXLF192944"), true, "vaild vin")
        XCTAssertEqual(SwiftyVIN.validVINRepeatedCharacters("11111111111111111"), false, "invaild vin")
        XCTAssertEqual(SwiftyVIN.validVINRepeatedCharacters("22222222222222222"), false, "invaild vin")
        
    }
    
    func testVINValiation() {
        
        var swiftyVIN: SwiftyVIN = SwiftyVIN("1FACP45EXLF192944")
        
        XCTAssertEqual(swiftyVIN.isValid(), true, "vaild vin")
        
        swiftyVIN = SwiftyVIN("1FACP45EXLF19294")
        
        XCTAssertEqual(swiftyVIN.isValid(), false, "invaild vin length")
        
        swiftyVIN = SwiftyVIN("1FACP45EXLF19294Q")
        
        XCTAssertEqual(swiftyVIN.isValid(), false, "invaild vin characters")
        
        swiftyVIN = SwiftyVIN("1FACP45EXUF192944")
        
        XCTAssertEqual(swiftyVIN.isValid(), false, "invaild vin character at character 10")
        
        swiftyVIN = SwiftyVIN("1B4YEM9P4KP186543")
        
        XCTAssertEqual(swiftyVIN.isValid(), false, "invaild vin check digit")
        
        swiftyVIN = SwiftyVIN("11111111111111111")
        
        XCTAssertEqual(swiftyVIN.isValid(), false, "invaild vin")
        
    }

}
