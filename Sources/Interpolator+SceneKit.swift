import SceneKit

extension SCNVector3: VectorType {
    init(values: [Float]) {
        self.init(values[0], values[1], values[2])
    }

    var values: [Float] { return [x, y, z] }
}

extension SCNVector4: VectorType {
    init(values: [Float]) {
        self.init(values[0], values[1], values[2], values[3])
    }

    var values: [Float] { return [x, y, z, w] }
}
