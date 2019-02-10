// Linked Lists
//
//let linkedList = LinkedList<Int>()
//
//linkedList.append(10)
//linkedList.append(20)
//linkedList.append(5)
//
//print(linkedList.toArray())
//
//
//// BST
//
//let binarySearchTree = BinarySearchTree<Int>()
//
//binarySearchTree.insert(10)
//binarySearchTree.insert(20)
//binarySearchTree.insert(5)
//binarySearchTree.insert(7)
//binarySearchTree.insert(13)
//binarySearchTree.insert(100)
//binarySearchTree.insert(50)
//
//print(binarySearchTree.toArray())
//
//
//// Graph
//
//let undirectedGraph = Graph<Int>()
//
//undirectedGraph.insert(new: 10, connectedTo: [])
//undirectedGraph.insert(new: 20, connectedTo: [10])
//undirectedGraph.insert(new: 5, connectedTo: [20])
//undirectedGraph.createEdge(from: 5, to: 10)
//
//
//undirectedGraph.printAdjacencyList()
//
//
//// Hashtable
//
//let hashtable = HashTable<String, Int>()
//
//hashtable.insert(key: "age", value: 22)
//hashtable.insert(key: "height", value: 510)
//hashtable.insert(key: "status", value: 200)
//hashtable.insert(key: "one", value: 1)
//hashtable.insert(key: "two", value: 2)
//hashtable.insert(key: "three", value: 3)
//hashtable.insert(key: "four", value: 4)
//hashtable.insert(key: "five", value: 5)
//
//print(hashtable.toString())


// Radix Tree

let radixTree = RadixTree()

radixTree.insert(path: "/hello/world")
radixTree.insert(path: "/hello")

print(radixTree.toString())


