import Foundation

fileprivate protocol NodeProtocol {
    associatedtype Data
    var data: Data { get }
    var next: Self? { get set }
}

fileprivate protocol BidirectionalNodeProtocol: NodeProtocol {
    var last: Self? { get set }
}

fileprivate final class Node<T>: NodeProtocol {
    public let data: T
    public var next: Node<T>?
    var last: Node<T>?
    
    public init(data: T, next: Node<T>?, last: Node<T>?) {
        self.data = data
        self.next = next
        self.last = last
    }
}

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    fileprivate var tail: Node<T>?
    
    public init() {
        self.head = nil
        self.tail = nil
    }
    
    public func append(_ value: T) {
        guard self.head != nil, self.tail != nil else {
            self.head = Node(data: value, next: nil, last: nil)
            self.tail = self.head
            return
        }
        let temp = Node(data: value, next: nil, last: self.tail)
        self.tail?.next = temp
        self.tail = temp
    }
    
    public func toArray() -> [T] {
        var currentNode = self.head
        var accumulator: [T] = []
        
        while let node = currentNode {
            accumulator.append(node.data)
            currentNode = node.next
        }
        
        return accumulator
    }
}
