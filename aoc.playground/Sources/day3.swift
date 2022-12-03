import Foundation

struct Item: Hashable {
    var value: Character;
    var priority: Int {
        return Int(self.value.asciiValue! - (self.value.isUppercase ? 38 : 96))
    }
}

struct Rucksack {
    var firstCompartment: Set<Item> = Set()
    var secondCompartment: Set<Item> = Set()
    
    init(with string: String) {
        let half = string.count / 2
        self.firstCompartment = Set(string.prefix(half).map({ Item(value: $0 as Character) }))
        self.secondCompartment = Set(string.suffix(half).map({ Item(value: $0 as Character) }))
    }
    
    var itemsInBothCompartments: Set<Item> {
        return self.firstCompartment.intersection(self.secondCompartment)
    }
    
    var items : Set<Item> {
        return self.firstCompartment.union(self.secondCompartment)
    }
}

func computePriority( for item: Character) -> Int {
    return Int(item.asciiValue! - (item.isUppercase ? 38 : 96))
}

public func day3_1() throws -> Int {
    let lines = try readAndSplitFile("day3-data", withSeparator: "\n")
    let rucksacks = lines.map { Rucksack(with: $0) }

    var totalErrorsPriority = 0;
    for rucksack in rucksacks {
        for item in rucksack.itemsInBothCompartments {
            totalErrorsPriority = totalErrorsPriority + item.priority
        }
    }
    return totalErrorsPriority
}

public func day3_2() throws -> Int {
    let lines = try readAndSplitFile("day3-data", withSeparator: "\n")
    let rucksacks = lines.map { Rucksack(with: $0) }
    var totalItemTypesPriority = 0
    for group in rucksacks.chunked(into: 3) {
        let elf1Items = group[0].items
        let elf2Items = group[1].items
        let elf3Items = group[2].items
        let sameItems = elf1Items.intersection(elf2Items).intersection(elf3Items)
        for item in sameItems {
            totalItemTypesPriority = totalItemTypesPriority + item.priority
        }
    }
    return totalItemTypesPriority;
}

