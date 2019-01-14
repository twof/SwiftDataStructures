// Linked Lists

let linkedList = LinkedList<Int>()

linkedList.append(10)
linkedList.append(20)
linkedList.append(5)

print(linkedList.toArray())


// BST

let binarySearchTree = BinarySearchTree<Int>()

binarySearchTree.insert(10)
binarySearchTree.insert(20)
binarySearchTree.insert(5)
binarySearchTree.insert(7)
binarySearchTree.insert(13)
binarySearchTree.insert(100)
binarySearchTree.insert(50)

print(binarySearchTree.toArray())
