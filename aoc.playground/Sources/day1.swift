import Foundation

public func day1() throws -> Int {
    let lines = try readAndSplitFile("day1-data", withSeparator: "\n")
    
    var top3Calories = Set<Int>()
    var currentElfCalories = 0
    
    for line in lines {
        if let calories = Int(line) {
            currentElfCalories =  currentElfCalories + calories
        } else {
            if top3Calories.count == 3 {
                if let min = top3Calories.min(), min < currentElfCalories {
                    top3Calories.remove(min)
                    top3Calories.insert(currentElfCalories)
                }
            } else {
                top3Calories.insert(currentElfCalories)
            }
            currentElfCalories = 0
        }
    }
    
    return top3Calories.reduce(0, +)
}

