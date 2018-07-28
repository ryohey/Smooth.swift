import Foundation

public class LinearInterpolator: Interpolator {
    public typealias Value = Float
    public let points: [Value]

    public required init(points: [Value]) {
        self.points = points
    }

    public func interpolate(_ t: Float) -> Value {
        let k = Int(floor(t))
        let t2 = t - Float(k)
        return (1 - t2) * getClippedInput(k) + (t2) * getClippedInput(k + 1)
    }
}
