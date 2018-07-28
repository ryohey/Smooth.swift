import Foundation

private func sinc(_ x: Float) -> Float {
    return x == 0 ? 1 : sin(.pi * x) / (.pi * x)
}

typealias WindowFunc = (Float) -> Float

// make a lanczos window function for a given filter size 'a'
private func makeLanczosWindow(_ a: Int) -> WindowFunc {
    return { sinc($0 / Float(a)) }
}

// Make a sinc kernel function by multiplying the sinc function by a window function
private func makeSincKernel(_ window: @escaping WindowFunc) -> WindowFunc {
    return { sinc($0) * window($0) }
}

public class SincFilterInterpolator: Interpolator {
    public typealias Value = Float
    public let points: [Value]
    private let filterSize: Int
    private let kernel: WindowFunc

    public init(points: [Value], filterSize: Int = 10) {
        self.points = points
        self.filterSize = filterSize

        let window = makeLanczosWindow(filterSize)
        kernel = makeSincKernel(window)
    }

    public func interpolate(_ t: Float) -> Value {
        let k = Int(floor(t))
        // Convolve with Lanczos kernel
        var sum: Float = 0
        for n in Array((k - filterSize + 1)...(k + filterSize)) {
            sum += kernel(t - Float(n)) * getClippedInput(n)
        }
        return sum
    }
}
