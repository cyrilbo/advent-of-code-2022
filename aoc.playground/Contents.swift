import Cocoa

print("Day 1");
let calories = try day1();
print("Sum of top 3 calories -> \(calories)");

print("\nDay 2");
let totalScore1 = try day2_1();
print("Part 1 - Total score -> \(totalScore1)");
let totalScore2 = try day2_2();
print("Part 2 - Total score -> \(totalScore2)");

print("\nDay 3");
print("Part 1 - Score ")
let totalPriority1 = try day3_1();
print("Part 1 - Total score -> \(totalPriority1)");
let totalPriority2 = try day3_2();
print("Part 2 - Total score -> \(totalPriority2)");
