
import Foundation


@main
struct json_reverse {

  static func main() {

    let args = CommandLine.arguments.dropFirst()
    if args.count > 0 {
      for arg in args {
        do {
          let contents = try String(contentsOfFile: arg, encoding: .utf8)
          let json = try JSONSerialization.jsonObject(with: Data(contents.utf8), options: [])

          guard let array = json as? [Any] else {
            FileHandle.standardError.write("❗️ Invalid JSON array".data(using: .utf8)!)
            exit(1)
          }

          let reversed = Array(array.reversed())
          let outputData = try! JSONSerialization.data(withJSONObject: reversed, options: [.prettyPrinted])
          FileHandle.standardOutput.write(outputData)
        } catch {
          FileHandle.standardError.write(Data("❗️ \(error)".utf8))
          exit(1)
        }
      }
      exit(0)
    }

    let inputData = FileHandle.standardInput.readDataToEndOfFile()
    let json = try! JSONSerialization.jsonObject(with: inputData, options: [])

    guard let array = json as? [Any] else {
      FileHandle.standardError.write("❗️ Invalid JSON array".data(using: .utf8)!)
      exit(1)
    }

    let reversed = Array(array.reversed())
    let outputData = try! JSONSerialization.data(withJSONObject: reversed, options: [.prettyPrinted])

    FileHandle.standardOutput.write(outputData)
  }
}
