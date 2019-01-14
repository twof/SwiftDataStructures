fileprivate class Node<T: Comparable> {
    let data: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(data: T, left: Node<T>? = nil, right: Node<T>? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}

public class BinarySearchTree<T: Comparable> {
    fileprivate var root: Node<T>?
    
    public init() {}
    
    public func insert(_ value: T) {
        guard let root = self.root else {
            self.root = Node(data: value)
            return
        }
        
        insertTraversal(value: value, node: root)
    }
    
    public func toArray() -> [T] {
        var accumulator: [T] = []
        
        self.inOrderTraversal { accumulator.append($0) }
       
        return accumulator
    }
    
    public func inOrderTraversal(_ action: (T) -> ()) {
        traverse(self.root, action: action)
    }
    
    fileprivate func traverse(_ node: Node<T>?, action: (T) -> ()) {
        if let left = node?.left {
            traverse(left, action: action)
        }
        
        action(node!.data)
        
        if let right = node?.right {
            traverse(right, action: action)
        }
    }
    
    fileprivate func insertTraversal(value: T, node: Node<T>) {
        if value <= node.data {
            guard let left = node.left else {
                node.left = Node(data: value)
                return
            }
            insertTraversal(value: value, node: left)
        }
        if value > node.data {
            guard let right = node.right else {
                node.right = Node(data: value)
                return
            }
            insertTraversal(value: value, node: right)
        }
    }
}
