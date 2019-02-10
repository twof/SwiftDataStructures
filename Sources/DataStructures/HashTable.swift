public class HashTable<Key: Hashable, Value> {
    // going to be resizing upon clash instead of using buckets to make things
    // simpler
    fileprivate var backingArray = [Value?](repeating: nil, count: 10)
    fileprivate var keys = [Key]()
    
    public func insert(key: Key, value: Value) {
        self.backingArray = self.insert(key: key, value: value, into: self.backingArray)
    }
    
    public func get(key: Key) -> Value? {
        let index = key.hashValue % backingArray.count
        return self.backingArray[index]
    }
    
    public func toString() -> String {
        let size = backingArray.count
        let kvPairs = keys
            .map { ($0, backingArray[index(key: $0)]) }
            .map { "\($0): \($1!)" }
            .joined(separator: ", ")
        
        return "size: \(size), [\(kvPairs)]"
    }
    
    fileprivate func insert(key: Key, value: Value, into backingArray: [Value?]) -> [Value?] {
        let index = abs(key.hashValue % backingArray.count)
        if backingArray[index] == nil {
            resize()
        } else {
            
        }
        var tempArray = backingArray
        
        tempArray[index] = value
        keys.append(key)
        
        return tempArray
    }
    
    fileprivate func resize() {
        let currentSize = Float(backingArray.count)
        let newSize: Int = Int(currentSize * 1.75)
        
        var newBackingArray = [Value?](repeating: nil, count: newSize)
        
        for key in self.keys {
            let index = key.hashValue % backingArray.count
            let value = backingArray[index]!
            newBackingArray = self.insert(key: key, value: value, into: newBackingArray)
        }
        
        self.backingArray = newBackingArray
    }
    
    fileprivate func index(key: Key) -> Int {
        return abs(key.hashValue % backingArray.count)
    }
}
