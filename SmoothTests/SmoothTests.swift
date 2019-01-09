import XCTest
@testable import Smooth

class SmoothTests: XCTestCase {
    func testTransverse() {
        XCTAssertEqual(transverseArray2D([[0, 1, 2], [3, 4, 5]]), [[0, 3], [1, 4], [2, 5]])
        XCTAssertEqual(transverseArray2D([]), [])
    }
}
