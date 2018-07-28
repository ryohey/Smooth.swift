import Foundation

/**

 You can these protocols to work with SceneKit.

 extension SCNVector3: Vector3, VectorType {}
 extension SCNVector4: Vector4, VectorType {}

 */

public protocol Vector2 {
    init(x: Float, y: Float)
    var x: Float { get }
    var y: Float { get }
}

public protocol Vector3 {
    init(x: Float, y: Float, z: Float)
    var x: Float { get }
    var y: Float { get }
    var z: Float { get }
}

public protocol Vector4 {
    init(x: Float, y: Float, z: Float, w: Float)
    var x: Float { get }
    var y: Float { get }
    var z: Float { get }
    var w: Float { get }
}

extension Vector2 {
    public init(values: [Float]) {
        self.init(x: values[0], y: values[1])
    }

    public var values: [Float] { return [x, y] }
}

extension Vector3 {
    public init(values: [Float]) {
        self.init(x: values[0], y: values[1], z: values[2])
    }

    public var values: [Float] { return [x, y, z] }
}

extension Vector4 {
    public init(values: [Float]) {
        self.init(x: values[0], y: values[1], z: values[2], w: values[3])
    }

    public var values: [Float] { return [x, y, z, w] }
}
