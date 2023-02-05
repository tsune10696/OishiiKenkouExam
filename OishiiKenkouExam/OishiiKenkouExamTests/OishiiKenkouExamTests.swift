//
//  OishiiKenkouExamTests.swift
//  OishiiKenkouExamTests
//
//  Created by tsune on 2023/02/05.
//
import SwiftUI
import XCTest
@testable import OishiiKenkouExam

final class OishiiKenkouExamTests: XCTestCase {
    
    //getAPIDataがnilでないことのチェック
    func testAPIData() {
        let app = APIData()
        XCTAssertNotNil(app.getAPIData.self)
    }
}
