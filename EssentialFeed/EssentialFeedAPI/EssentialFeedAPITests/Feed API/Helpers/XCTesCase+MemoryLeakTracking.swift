//
//  XCTesCase+MemoryLeakTracking.swift
//  EssentialFeedCaseStudyTests
//
//  Created by RODRIGO FRANCISCO PABLO on 15/11/24.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should been dealloacted. Potential memory leak.", file: file, line: line)
        }
    }
}
