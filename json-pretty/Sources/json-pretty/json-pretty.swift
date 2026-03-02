import Foundation

@main
struct json_pretty {

  static func main() {

    let args = CommandLine.arguments.dropFirst()
    if args.count > 0 {
      for arg in args {
        do {
          let contents = try String(contentsOfFile: arg, encoding: .utf8)
          let json = try JSONSerialization.jsonObject(with: Data(contents.utf8), options: [])
          let outputData = try! JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
          FileHandle.standardOutput.write(outputData)
        } catch {
          FileHandle.standardError.write(Data("❗️ \(error)".utf8))
          exit(1)
        }
      }
      exit(0)
    }

    let inputData = FileHandle.standardInput.readDataToEndOfFile()

    do {
      let json = try JSONSerialization.jsonObject(with: inputData, options: [])
      let outputData = try! JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
      FileHandle.standardOutput.write(outputData)
    } catch {
      FileHandle.standardError.write("❗️ \(error)".data(using: .utf8)!)
    }
  }
}
