fileprivate class Node<T: Hashable> {
    let data: T
    var edges: Set<Node<T>>
    
    init(_ data: T) {
        self.data = data
        self.edges = []
    }
    
    func createEdge(to node: Node<T>) {
        self.edges.insert(node)
    }
}

extension Node: Equatable where T: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.data)
    }
}

public class Graph<T: Equatable & Hashable> {
    fileprivate var nodes: [T: Node<T>]
    public var numNodes: Int {
        return nodes.count
    }
    
    public init() {
        self.nodes = [:]
    }
    
    public func insert(new newData: T, connectedTo oldData: [T]) {
        let newNode = Node(newData)
        nodes[newData] = newNode
        
        for data in oldData {
            guard let oldNode = self.nodes[data] else { fatalError() }
            oldNode.createEdge(to: newNode)
            newNode.createEdge(to: oldNode)
        }
    }
    
    public func createEdge(from left: T, to right: T) {
        guard let leftNode = nodes[left], let rightNode = nodes[right] else { fatalError() }
        leftNode.createEdge(to: rightNode)
        rightNode.createEdge(to: leftNode)
    }
    
    public func printAdjacencyList() {
        for item in nodes {
            print("\(item.key): \(item.value.edges.map { $0.data })")
        }
    }
}
