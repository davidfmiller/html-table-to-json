
import Foundation

@main
struct capitalize {
    static func main() {

      let inputData = FileHandle.standardInput.readDataToEndOfFile()
      guard let str = String(data: inputData, encoding: .utf8) else {
        FileHandle.standardError.write("❗️ Invalid string".data(using: .utf8)!)
        exit(1)
      }
      print(str.capitalized.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}
