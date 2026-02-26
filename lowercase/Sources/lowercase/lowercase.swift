
import Foundation

extension String {

  /**
   */
  var sanitized : String {
    return self
      .lowercased()
  }
}

@main
struct uppercase {
    static func main() {
      if CommandLine.arguments.count > 1 {
        let arguments = Array(CommandLine.arguments[1 ..< CommandLine.arguments.count])
        for arg in arguments
        {
          print(arg.sanitized)
        }
        exit(0)
      }
      let inputData = FileHandle.standardInput.readDataToEndOfFile()
      guard let str = String(data: inputData, encoding: .utf8) else {
        FileHandle.standardError.write("❗️ Invalid string".data(using: .utf8)!)
        exit(1)
      }
      print(str.sanitized)
    }
}
