import Foundation

public class CubicInterpolator: Interpolator {
    public typealias Value = Float
    public let points: [Float]
    private let tangentFactor: Float

    public init(points: [Value], tension: Float = 0.0) {
        self.points = points
        tangentFactor = 1.0 - max(0.0, min(1.0, tension))
    }

    // Cardinal spline with tension 0.5)
    private func getTangent(_ k: Int) -> Value {
        return tangentFactor * (getClippedInput(k + 1) - getClippedInput(k - 1)) / 2
    }

    public func interpolate(_ t: Float) -> Value {
        let k = Int(floor(t))
        let m = [getTangent(k), getTangent(k + 1)]
        let p = [getClippedInput(k), getClippedInput(k + 1)]
        let t1 = t - Float(k)
        let t2 = t1 * t1
        let t3 = t1 * t2
        return (2 * t3 - 3 * t2 + 1) * p[0] +
            (t3 - 2 * t2 + t1) * m[0] +
            (-2 * t3 + 3 * t2) * p[1] +
            (t3 - t2) * m[1]
    }
}
