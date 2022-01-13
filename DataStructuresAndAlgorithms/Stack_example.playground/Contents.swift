

// Stack

struct Stack<T> {
    
    var storage: [T] = []
    
    public init() {
        
    }
    
    mutating func push(_ element: T){
        storage.append(element)
    }
    
    mutating func pop() -> T? {
        storage.popLast()
    }
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
}


// Reverse an Array

let A = [1, 3, 6, 2, 9, 5]

func printInReverse<T>(_ exam: [T]) -> [T] {
    var stack = Stack<T>()
    var B: [T] = []
    
    for value in exam {
        stack.push(value)
    }
    
    while let value = stack.pop() {
        print(value)
        B.append(value)
    }
    
    return B
}

print(printInReverse(A))



// Balance the parentheses

let exampleStringOne: String = "h((e))llo(world)()"
let exampleStringTwo: String = "(hello world"

func checkParentheses(_ element: String) -> Bool {
    
//    let match = ["(": ")", "{": "}", "[": "]"]
    
    var stack = Stack<Character>()
    
    for character in element {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}

checkParentheses(exampleStringTwo)
