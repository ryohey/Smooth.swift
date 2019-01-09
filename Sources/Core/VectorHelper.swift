import Foundation

public protocol VectorType {
    init(values: [Float])
    var values: [Float] { get }
}

// [{x, y, z}, {x, y, z}, ...] -> [[x, x, ...], [y, y, ...], [z, z, ...]]
func splitVectors(_ points: [VectorType]) -> [[Float]] {
    return transverseArray2D(points.map({ $0.values }))
}

// [[x, x, ...], [y, y, ...], [z, z, ...]] -> [[x, y, z], [x, y, z], ...]
func assembleVectors<T>(_ values: [[Float]]) -> [T] where T: VectorType {
    return transverseArray2D(values).map { T(values: $0) }
}

// 転置する
func transverseArray2D(_ values: [[Float]]) -> [[Float]] {
    if (values.count == 0 || values[0].count == 0) {
        return []
    }
    return (0..<values[0].count).map({ i in values.map({ $0[i] }) })
}
