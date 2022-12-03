import Foundation

enum RoundOutcome {
    case Win
    case Loose
    case Draw
    func getScore() -> Int {
        switch self {
        case .Win:
            return 6
        case .Loose:
            return 0
        case .Draw:
            return 3
        }
    }
}

enum HandShape {
    case Rock
    case Paper
    case Scissors
    func getScore() -> Int {
        switch self {
        case .Rock:
            return 1
        case .Paper:
            return 2
        case .Scissors:
            return 3
        }
    }
}

func findBestMove(with move: HandShape, for outcome: RoundOutcome) -> HandShape {
    switch (move, outcome) {
    case (.Rock, .Win), (.Paper, .Draw), (.Scissors, .Loose):
        return HandShape.Paper
    case (.Paper, .Win), (.Scissors, .Draw), (.Rock, .Loose):
        return HandShape.Scissors
    case (.Scissors, .Win), (.Rock, .Draw), (.Paper, .Loose):
        return HandShape.Rock
    }
}

func getRoundOutcome(with myMove: HandShape, and opponentMove: HandShape) -> RoundOutcome {
    switch (myMove, opponentMove) {
    case (.Rock, .Rock), (.Paper, .Paper), (.Scissors, .Scissors):
        return .Draw
    case (.Rock, .Paper), (.Paper, .Scissors), (.Scissors, .Rock):
        return .Loose
    case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
        return .Win
    }
}

func parseMove(_ move: String) -> HandShape {
    switch (move) {
    case "A", "X":
        return HandShape.Rock
    case "B", "Y":
        return HandShape.Paper
    case "C", "Z":
        return HandShape.Scissors
    default:
        preconditionFailure("move \(move) should be either X, Y, Z, A, B, C")
    }
}

// Part 1

func parseLine_1(_ line: String) -> (HandShape, HandShape) {
    let round = line.components(separatedBy: " ")
    let opponentMove = parseMove(round[0])
    let myMove = parseMove(round[1])
    return (opponentMove, myMove)
}



func computeRoundScore_1(withLine line :String) -> Int {
    let (opponentMove, myMove) = parseLine_1(line)
    let shapeScore = myMove.getScore()
    let roundOutcomeScore = getRoundOutcome(with: myMove, and: opponentMove).getScore()
    return shapeScore + roundOutcomeScore
}


public func day2_1() throws -> Int {
    let lines = try readAndSplitFile("day2-data", withSeparator: "\n")
    var totalScore = 0
    for line in lines {
        totalScore = totalScore + computeRoundScore_1(withLine: line)
    }
    return totalScore
}


// Part 2

func parseOutcome(_ outcome: String) -> RoundOutcome {
    switch (outcome) {
    case "X":
        return RoundOutcome.Loose
    case "Y":
        return RoundOutcome.Draw
    case "Z":
        return RoundOutcome.Win
    default:
        preconditionFailure("outcome \(outcome) should be either X, Y, Z")
    }
}

func parseLine_2(_ line: String) -> (HandShape, RoundOutcome) {
    let round = line.components(separatedBy: " ")
    let opponentMove = parseMove(round[0])
    let outcome = parseOutcome(round[1])
    return (opponentMove, outcome)
}

func computeRoundScore_2(withLine line: String) -> Int {
    let (opponentMove, outcome) = parseLine_2(line)
    let myMove = findBestMove(with: opponentMove, for: outcome)
    return myMove.getScore() + outcome.getScore()
}

public func day2_2() throws -> Int {
    let lines = try readAndSplitFile("day2-data", withSeparator: "\n")
    var totalScore = 0
    for line in lines {
        totalScore = totalScore + computeRoundScore_2(withLine: line)
    }
    return totalScore
}
