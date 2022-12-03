import Foundation

public func readFile(_ fileName: String) throws -> String {
    let home = FileManager.default.homeDirectoryForCurrentUser
    
    let fileUrl = home.appendingPathComponent( "Developer/aoc22/aoc.playground/Resources/\(fileName)")
        .appendingPathExtension("txt")
    
    guard FileManager.default.fileExists(atPath: fileUrl.path) else {
        preconditionFailure("file expected at \(fileUrl.absoluteString) is missing")
    }
    
    return try String(contentsOfFile: fileUrl.path)
}

public func readAndSplitFile(_ fileName: String, withSeparator separator: String) throws -> [String]  {
    let fileContent = try readFile(fileName)
    let lines = fileContent.components(separatedBy: separator).trimed(predicate:  { $0.trimmingCharacters(in: .whitespacesAndNewlines).count == 0} )
    return lines;
}
