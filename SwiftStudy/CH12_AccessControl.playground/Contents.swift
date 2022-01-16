
// Ch12 Access Control

// 접근수준
//open class OpenClass {
//    open var openProperty: Int = 0
//    public var publicProperty: Int = 0
//    internal var internalProperty: Int = 0
//    fileprivate var filePrivateProperty: Int = 0
//    private var privateProperty: Int = 0
//
//    open func openMethod() {}
//    public func publicMethod() {}
//    internal func internalMethod() {}
//    fileprivate func fileprivateMethod() {}
//    private func privateMethod() {}
//}
//
//public class PublicClass {}
//public struct PublicStruct {}
//public enum PublicEnum {}
//public var publicVariable = 0
//public let publicConstant = 0
//public func publicFunction() {}
//
//internal class InternalClass {} // internal 키워드는 생략해도 무관
//internal struct InternalStruct {}
//internal enum InternalEnum {}
//internal var internalVariable = 0
//internal let internalConstant = 0
//internal func internalFunction() {}
//
//fileprivate class FilePrivateClass {}
//fileprivate struct FilePrivateStruct {}
//fileprivate enum FilePrivateEnum {}
//fileprivate var filePrivateVariable = 0
//fileprivate let filePrivateConstant = 0
//fileprivate func filePrivateFunction() {}
//
//private class PrivateClass {}
//private struct PrivateStruct {}
//private enum PrivateEnum {}
//private var privateVariable = 0
//private let privateConstant = 0
//private func privateFunction() {}


// 잘못된 접근수준 부여
//private class AClass {
//    public func someMethod() {
//
//    }
//}
//
//public func someFunction(a: AClass) -> AClass {
//    return a
//}

internal class InternalClass {}
private struct PrivateStruct {}

//public var publicTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())

private var privateTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())


//private typealias PointValue = Int
//
//enum Point: PointValue {
//    case x, y
//}

//public struct SomeType {
//    private var privateVariable = 0
//    fileprivate var fileprivateVariable = 0
//}
//
//extension SomeType {
//    public func publicMethod() {
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//
//    private func privateMethod() {
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//
//    fileprivate func fileprivateMethod() {
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//}
//
//struct AnotherType {
//    var someInstance: SomeType = SomeType()
//
//    mutating func someMethod() {
//        self.someInstance.publicMethod()
//
//        self.someInstance.fileprivateVariable = 100
//        self.someInstance.fileprivateMethod()
//
////        self.someInstance.privateVariable = 100
////        self.someInstance.privateMethod()
//    }
//}
//
//var anotherInstance = AnotherType()
//anotherInstance.someMethod()


// 읽기 전용 구현
public struct SomeType {
    private var count: Int = 0
    
    public var publicStoredProperty: Int = 0
    
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    public subscript() -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
}

var someInstance: SomeType = SomeType()

print(someInstance.publicStoredProperty)
someInstance.publicStoredProperty = 100

print(someInstance.publicGetOnlyStoredProperty)
//someInstance.publicGetOnlyStoredProperty = 100

print(someInstance.internalComputedProperty)
someInstance.internalComputedProperty = 100
print(someInstance.internalComputedProperty)

print(someInstance.internalGetOnlyComputedProperty)
//someInstance.internalGetOnlyComputedProperty = 100

print(someInstance[])
someInstance[] = 100
print(someInstance[])

print(someInstance[0])
someInstance[0] = 100
