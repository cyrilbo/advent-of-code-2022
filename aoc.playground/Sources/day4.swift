import Foundation

struct Assignment {
    var min: Int;
    var max: Int;
    init(with string: String) {
        let assignment = string.split(separator: "-");
        self.min = Int(assignment[0])!
        self.max = Int(assignment[1])!
    }
    func isSubset(of assignment: Assignment) -> Bool {
        return self.min >= assignment.min && self.max <= assignment.max
    }
    func isOverlapping(with assignment: Assignment) -> Bool {
        return (self.min <= assignment.max) && (assignment.min <= self.max)
    }
}

func parseAssignments(with line: String) -> (Assignment, Assignment) {
    let assignments = line.split(separator: ",")
    return (Assignment(with: String(assignments[0])), Assignment(with: String(assignments[1])))
}

public func day4_1() throws -> Int {
    let lines = try readAndSplitFile("day4-data", withSeparator: "\n")
    return lines.map { parseAssignments(with: $0)}.reduce(0, { total, assigments in
        (assigments.0.isSubset(of: assigments.1) || assigments.1.isSubset(of: assigments.0)) ? total + 1 : total
    })
}

public func day4_2() throws -> Int {
    let lines = try readAndSplitFile("day4-data", withSeparator: "\n")
    return lines.map { parseAssignments(with: $0)}.reduce(0, { total, assigments in
        (assigments.0.isOverlapping(with: assigments.1)) ? total + 1 : total
    })
}


