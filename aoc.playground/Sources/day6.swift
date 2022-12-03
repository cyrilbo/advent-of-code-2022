import Foundation

import Foundation

func findFirstMarker(in string: String, withSize size: Int) -> Int {
    for i in size..<string.count {
        let set = Set(String(string[(i-size)..<i]))
        if(set.count == size) {
            return i
        }
    }
    return -1
}

public func day6_1() throws -> Int {
    let stream = try readFile("day6-data")
    return findFirstMarker(in: stream, withSize: 4 )
}


public func day6_2() throws -> Int {
    let stream = try readFile("day6-data")
    return findFirstMarker(in: stream, withSize: 14 )
}
