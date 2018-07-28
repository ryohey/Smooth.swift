import Foundation

class ArrayInterpolator: Interpolator {
    typealias Value = [Float]
    let points: [Value]
    private let interpolators: [InterpolateFunc<Float>]

    init(points: [Value], interpolatorCreator: ([Float]) -> InterpolateFunc<Float>) {
        self.points = points
        self.interpolators = points.map(interpolatorCreator)
    }

    func interpolate(_ t: Float) -> Value {
        return interpolators.map { $0(t) }
    }
}

public class VectorInterpolator<T>: Interpolator where T: VectorType {
    public typealias Value = T
    public let points: [T]
    private let arrayInterpolator: ArrayInterpolator

    public init(points: [T], interpolatorCreator: ([Float]) -> InterpolateFunc<Float>) {
        self.points = points
        arrayInterpolator = ArrayInterpolator(points: splitVectors(points), interpolatorCreator: interpolatorCreator)
    }

    public func interpolate(_ t: Float) -> T {
        return T(values: arrayInterpolator.interpolate(t))
    }
}
