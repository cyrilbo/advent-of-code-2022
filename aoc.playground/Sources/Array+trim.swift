import Foundation

extension Array {
    public func trimed(predicate: (Element) throws -> Bool) rethrows -> [Element] {
        return Array(try self.drop(while: { try predicate($0) }).reversed().drop(while: {try predicate($0) }).reversed())
    }
    
    public mutating func trim(predicate: (Element) throws -> Bool) rethrows -> Void {
        self = Array(try self.drop(while: { try predicate($0) }).reversed().drop(while: {try predicate($0) }).reversed())
    }
}
