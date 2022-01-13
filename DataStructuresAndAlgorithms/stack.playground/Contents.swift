import UIKit


public struct Stack<T> {
    private var storage: [T] = []
    
    public var isEmpty: Bool {
        return storage.isEmpty
    }
    
    public var count: Int {
        return storage.count
    }
    
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    
    public mutating func pop() -> T? {
        return storage.popLast()
    }
    
    public var top: T? {
        storage.last
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}


var stack = Stack<Double>()
stack.push(5.0)
stack.push(10.0)
stack.push(6.0)
stack.isEmpty
stack.count
stack.top
stack.pop()
print(stack)

