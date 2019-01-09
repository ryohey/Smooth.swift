import SceneKit
import Smooth

extension SCNVector3: VectorType {
    public init(values: [Float]) {
        self.init(values[0], values[1], values[2])
    }

    public var values: [Float] { return [x, y, z] }
}

extension SCNVector4: VectorType {
    public init(values: [Float]) {
        self.init(values[0], values[1], values[2], values[3])
    }

    public var values: [Float] { return [x, y, z, w] }
}
