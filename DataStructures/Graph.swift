fileprivate class Node<T> {
    let data: T
    var edges: [Node<T>]
    
    init(_ data: T) {
        self.data = data
        self.edges = []
    }
    
    func createEdge(to node: Node<T>) {
        self.edges.append(node)
    }
}

public class Graph<T: Equatable & Hashable> {
    fileprivate var nodes: [T: Node<T>]
    
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
    
    public func printAdjacencyList() {
        for item in nodes {
            print("\(item.key): \(item.value.edges.map { $0.data })")
        }
    }
}
