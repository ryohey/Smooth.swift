import Foundation
import XCTest
import SceneKit
@testable import Smooth

private let epsilon: Float = 0.0001

class InterpolatorTests: XCTestCase {
    func testLinearInterpolator() {
        let points: [Float] = [0, 1, 2]
        let ip = LinearInterpolator(points: points)
        XCTAssertEqual(ip.interpolate(0), points[0], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(1), points[1], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(2), points[2], accuracy: epsilon)
    }

    func testCubicInterpolator() {
        let points: [Float] = [0.6, 0.1, 2]
        let ip = CubicInterpolator(points: points)
        XCTAssertEqual(ip.interpolate(0), points[0], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(1), points[1], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(2), points[2], accuracy: epsilon)
    }

    func testSincFilterInterpolator() {
        let points: [Float] = [0.6, 0.1, 2]
        let ip = SincFilterInterpolator(points: points)
        XCTAssertEqual(ip.interpolate(0), points[0], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(1), points[1], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(2), points[2], accuracy: epsilon)
    }

    func testArrayInterpolator() {
        let points: [[Float]] = [[0, 1, 2], [0.6, 0.1, 2]]
        let ip = ArrayInterpolator(points: points, interpolatorCreator: { CubicInterpolator(points: $0).interpolate })
        XCTAssertEqual(ip.interpolate(0)[0], points[0][0], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(0)[1], points[1][0], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(1)[0], points[0][1], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(1)[1], points[1][1], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(2)[0], points[0][2], accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(2)[1], points[1][2], accuracy: epsilon)
    }

    func testVectorInterpolator() {
        let points: [SCNVector3] = [SCNVector3(0, 0.6, 0), SCNVector3(1, 0.1, 1), SCNVector3(2, 2, 2)]
        let ip = VectorInterpolator(points: points, interpolatorCreator: { CubicInterpolator(points: $0).interpolate })
        XCTAssertEqual(ip.interpolate(0).x, points[0].x, accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(0).y, points[0].y, accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(0).z, points[0].z, accuracy: epsilon)

        XCTAssertEqual(ip.interpolate(1).x, points[1].x, accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(1).y, points[1].y, accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(1).z, points[1].z, accuracy: epsilon)

        XCTAssertEqual(ip.interpolate(2).x, points[2].x, accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(2).y, points[2].y, accuracy: epsilon)
        XCTAssertEqual(ip.interpolate(2).z, points[2].z, accuracy: epsilon)
    }
}
