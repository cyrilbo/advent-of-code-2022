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
let totalPriority1 = try day3_1();
print("Part 1 - Total score -> \(totalPriority1)");
let totalPriority2 = try day3_2();
print("Part 2 - Total score -> \(totalPriority2)");

print("\nDay 4");
let totalAssignmentsInclusion = try day4_1();
print("Part 1 - Total assignments inclusion -> \(totalAssignmentsInclusion)");
let totalAssignmentsOverlapping = try day4_2();
print("Part 2 - Total assignments overlapping -> \(totalAssignmentsOverlapping)");


print("\nDay 5");
var cratesOnTop = try day5_1();
print("Part 1 - Crates on top -> \(cratesOnTop)");
cratesOnTop = try day5_2();
print("Part 1 - Crates on top -> \(cratesOnTop)");
