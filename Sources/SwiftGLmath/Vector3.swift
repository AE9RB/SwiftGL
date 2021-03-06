// Copyright (c) 2015-2016 David Turnbull
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and/or associated documentation files (the
// "Materials"), to deal in the Materials without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Materials, and to
// permit persons to whom the Materials are furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Materials.
//
// THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.


public struct Vector3<T:ArithmeticType> : VectorType {

    public typealias Element = T
    public typealias FloatVector = Vector3<Float>
    public typealias DoubleVector = Vector3<Double>
    public typealias Int32Vector = Vector3<Int32>
    public typealias UInt32Vector = Vector3<UInt32>
    public typealias BooleanVector = Vector3b

    public var x:T, y:T, z:T

    public var r:T { get {return x} set {x = newValue} }
    public var g:T { get {return y} set {y = newValue} }
    public var b:T { get {return z} set {z = newValue} }

    public var s:T { get {return x} set {x = newValue} }
    public var t:T { get {return y} set {y = newValue} }
    public var p:T { get {return z} set {z = newValue} }

    public var startIndex: Int { return 0 }
    public var endIndex: Int { return 3 }

    public subscript(index: Int) -> T {
        get {

            switch(index) {
            case 0: return x
            case 1: return y
            case 2: return z
            default: preconditionFailure("Vector index out of range")
            }
        }
        set {
            switch(index) {
            case 0: x = newValue
            case 1: y = newValue
            case 2: z = newValue
            default: preconditionFailure("Vector index out of range")
            }
        }
    }

    public var debugDescription: String {
        return String(self.dynamicType) + "(\(x), \(y), \(z))"
    }

    public var hashValue: Int {
        return GLmath.hash(x.hashValue, y.hashValue, z.hashValue)
    }

    public init () {
        self.x = 0
        self.y = 0
        self.z = 0
    }

    public init (_ v:T) {
        self.x = v
        self.y = v
        self.z = v
    }

    public init(_ array:[T]) {
        precondition(array.count == 3, "Vector3 requires a 3-element array")
        self.x = array[0]
        self.y = array[1]
        self.z = array[2]
    }

    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
    
    public init (_ x:T, _ y:T, _ z:T) {
        self.x = x
        self.y = y
        self.z = z
    }

    public init (_ v:Vector2<T>, _ z:T) {
        self.x = v.x
        self.y = v.y
        self.z = z
    }

    public init (_ x:T, _ v:Vector2<T>) {
        self.x = x
        self.y = v.x
        self.z = v.y
    }

    public init (x:T, y:T, z:T) {
        self.x = x
        self.y = y
        self.z = z
    }

    public init (r:T, g:T, b:T) {
        self.x = r
        self.y = g
        self.z = b
    }

    public init (s:T, t:T, p:T) {
        self.x = s
        self.y = t
        self.z = p
    }

    public init (_ v:Vector3<T>) {
        self.x = v.x
        self.y = v.y
        self.z = v.z
    }

    public init (_ v:Vector4<T>) {
        self.x = v.x
        self.y = v.y
        self.z = v.z
    }

    public init (_ v:Vector3<Double>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<Float>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<Int>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<UInt>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<Int8>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<UInt8>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<Int16>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<UInt16>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<Int32>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<UInt32>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<Int64>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ v:Vector3<UInt64>) {
        self.x = T(v.x)
        self.y = T(v.y)
        self.z = T(v.z)
    }

    public init (_ s:T, _ v:Vector3<T>, @noescape _ op:(_:T, _:T) -> T) {
        self.x = op(s, v.x)
        self.y = op(s, v.y)
        self.z = op(s, v.z)
    }

    public init (_ v:Vector3<T>, _ s:T, @noescape _ op:(_:T, _:T) -> T) {
        self.x = op(v.x, s)
        self.y = op(v.y, s)
        self.z = op(v.z, s)
    }

    public init<T:VectorType where T.BooleanVector == BooleanVector>
        (_ v: T, @noescape _ op:(_:T.Element) -> Element) {
            self.x = op(v[0])
            self.y = op(v[1])
            self.z = op(v[2])
    }

    public init<T1:VectorType, T2:VectorType where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector>
        (_ v1:T1, _ v2:T2, @noescape _ op:(_:T1.Element, _:T2.Element) -> Element) {
            self.x = op(v1[0], v2[0])
            self.y = op(v1[1], v2[1])
            self.z = op(v1[2], v2[2])
    }

    public init<T1:VectorType, T2:VectorType where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector>
        (_ v1:T1, inout _ v2:T2, @noescape _ op:(_:T1.Element, inout _:T2.Element) -> Element) {
            self.x = op(v1[0], &v2[0])
            self.y = op(v1[1], &v2[1])
            self.z = op(v1[2], &v2[2])
    }

    public init<T1:VectorType, T2:VectorType, T3:VectorType where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector, T3.BooleanVector == BooleanVector>
        (_ v1:T1, _ v2:T2, _ v3:T3, @noescape _ op:(_:T1.Element, _:T2.Element, _:T3.Element) -> Element) {
            self.x = op(v1[0], v2[0], v3[0])
            self.y = op(v1[1], v2[1], v3[1])
            self.z = op(v1[2], v2[2], v3[2])
    }

    public init<T1:VectorType, T2:VectorType, T3:BooleanVectorType where
        T1.BooleanVector == BooleanVector, T2.BooleanVector == BooleanVector, T3.BooleanVector == BooleanVector>
        (_ v1:T1, _ v2:T2, _ v3:T3, @noescape _ op:(_:T1.Element, _:T2.Element, _:Bool) -> Element) {
            self.x = op(v1[0], v2[0], v3[0])
            self.y = op(v1[1], v2[1], v3[1])
            self.z = op(v1[2], v2[2], v3[2])
    }

}


public func ==<T:ArithmeticType>(v1: Vector3<T>, v2: Vector3<T>) -> Bool {
    return v1.x == v2.x && v1.y == v2.y && v1.z == v2.z
}
