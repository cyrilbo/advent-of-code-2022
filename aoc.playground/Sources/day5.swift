import Foundation

struct Crate : CustomStringConvertible {
    var description: String {
        "\(id)"
    }
    
    let id: Character
}

struct Move: CustomStringConvertible {
    let numberOfCrates: Int
    let originStack: Int
    let destinationStack: Int
    var description: String {
        "\(numberOfCrates) from \(originStack) to \(destinationStack)"
    }
    init(string: String) {
        let regex = try! NSRegularExpression(pattern: "[1-9][0-9]*")
        let results = regex.matches(in: string,
                                    range: NSRange(location: 0, length: string.count))
        let move =  results.map {
            Int(string[Range($0.range, in: string)!])!
        }
        self.numberOfCrates = move[0]
        self.originStack = move[1] - 1
        self.destinationStack = move[2] - 1
    }
}

struct Stacks: CustomStringConvertible {
    var description: String {
        self.stacks.enumerated().map { i, stack in
            "\(i) -> " + stack.map { $0.description }.joined(separator: "-")
        }.joined(separator: "\n")
    }
    
    var cratesOnTop: String {
        self.stacks.map {
            $0.last!.description
        }.joined()
    }
    
    var stacks: [[Crate]]
    init(string: String) {
        stacks = []
        var lines = string.split(separator: "\n")
        let stacksCount = lines.popLast()!.split(separator: " ").count
        stacks = Array(repeating: [], count: stacksCount)
        
        lines.forEach { line in
            line.enumerated().forEach { i, c in
                if c.isLetter {
                    stacks[(i-1)/4].insert(Crate(id: c), at: 0)
                }
            }
        }
        print(stacks)
    }
    
    mutating func run(move: Move, takeMany: Bool = false) {
        var cratesToMove = Array(stacks[move.originStack].suffix(move.numberOfCrates))
        if(!takeMany) {
            cratesToMove = Array(cratesToMove.reversed())
        }
            
        stacks[move.destinationStack] = stacks[move.destinationStack] + cratesToMove
        stacks[move.originStack] = stacks[move.originStack].dropLast(move.numberOfCrates)

    }
}

public func day5_1() throws -> String {
    let lines = try readAndSplitFile("day5-data", withSeparator: "\n\n")
    var stacks = Stacks(string: lines[0])
    let moves = lines[1].split(separator: "\n").map { Move(string: String($0))}
    moves.forEach {
        stacks.run(move: $0)
    }
    return stacks.cratesOnTop
}

public func day5_2() throws -> String {
    let lines = try readAndSplitFile("day5-data", withSeparator: "\n\n")
    var stacks = Stacks(string: lines[0])
    let moves = lines[1].split(separator: "\n").map { Move(string: String($0))}
    moves.forEach {
        stacks.run(move: $0, takeMany: true)
    }
    return stacks.cratesOnTop
}
