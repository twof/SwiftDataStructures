import Foundation
fileprivate typealias Node = RadixTreeNode

fileprivate class RadixTreeNode {
    fileprivate var value: String?
    private(set) fileprivate var children: [String: Node]
    fileprivate var largestChild = 0
    
    init(value: String) {
        self.value = value
        self.children = [:]
    }
    
    fileprivate init() {
        self.value = nil
        self.children = [:]
    }
    
    func insert(child: Node) {
        guard let value = child.value else { fatalError() }
        self.children[value] = child
        if value.count > largestChild {
            self.largestChild = value.count
        }
    }
}

class RadixTree {
    private var root: Node = Node()
    private var allNodes: [Node] = []
    
    init() {
        allNodes.append(self.root)
    }
    
    public func insert(path: String) {
        let tokenizedPath = path.split(separator: "/")
        self.insert(path: tokenizedPath, node: root)
    }
    
    private func insert<T: MutableCollection & RandomAccessCollection & RangeReplaceableCollection>(
        path: T,
        node: Node
    ) where T.Element: StringProtocol, T.Index == Int {
        for size in (0...node.largestChild).reversed() {
            let endIndex = min(size, path.count)
            let testPath = path[0..<endIndex].joined(separator: "/")
            if let foundNode = root.children[testPath] {
                self.insert(path: path[endIndex...], node: foundNode)
            }
        }
        
        let newNode = Node(value: String(path.joined(separator: "/")))
        node.insert(child: newNode)
        self.allNodes.append(newNode)
    }
    
    public func toString() -> String {
        var string = [String]()
        
        for node in allNodes {
            string.append("{ value: \(node.value ?? "nil"), children: \(node.children) }")
        }
        
        return string.joined(separator: ",")
    }
}


