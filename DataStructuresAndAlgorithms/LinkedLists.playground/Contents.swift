
// Linked Lists
/* some theoretical advantages
 - Constant time insertion and removal from the front of the list.
 - Reliable performance characteristics.
 */

// "creating and linking nodes"
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

// push
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print(list)

// append
var appendList = LinkedList<Int>()
appendList.append(1)
appendList.append(2)
appendList.append(3)

print(appendList)

// inserting at a particular index
var insertList = LinkedList<Int>()
insertList.push(3)
insertList.push(2)
insertList.push(1)

print("Before inserting: \(insertList)")
var middleNode = insertList.node(at: 1)!
for _ in 1...4 {
    middleNode = insertList.insert(-1, after: middleNode)
}
print("After inserting: \(insertList)")

// pop
var popTestList = LinkedList<Int>()
popTestList.push(3)
popTestList.push(2)
popTestList.push(1)

print("Before popping list: \(popTestList)")
let poppedValue = popTestList.pop()
print("After popping list: \(popTestList)")
print("Popped value: " + String(describing: poppedValue))

// removing the last node
var lastRemoveList = LinkedList<Int>()
lastRemoveList.push(3)
lastRemoveList.push(2)
lastRemoveList.push(1)

print("Before removing last node: \(lastRemoveList)")
let removedValue = lastRemoveList.removeLast()

print("After removing last node: \(lastRemoveList)")
print("Removed value: " + String(describing: removedValue))

// removing a node after a particular node
var particularRemoveList = LinkedList<Int>()
particularRemoveList.push(3)
particularRemoveList.push(2)
particularRemoveList.push(1)

print("Before removing at particular index: \(particularRemoveList)")
let index = 1
let node = particularRemoveList.node(at: index - 1)!
let ParicularRemovedValue = particularRemoveList.remove(after: node)

print("After removing at index \(index): \(particularRemoveList)")
print("Removed value: " + String(describing: ParicularRemovedValue))
