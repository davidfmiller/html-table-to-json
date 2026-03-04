import Foundation
import TOMLKit

func jsonData(toml: String) -> Data? {
  do {
    let table = try TOMLTable(string: toml)
    let jsonData = try JSONSerialization.data(withJSONObject: table, options: [.prettyPrinted])
    return jsonData
  } catch {
    return nil
  }
}

func x(_ message: String) {
  FileHandle.standardError.write(Data("❗️ \(message)".utf8))
}

@main
struct toml_to_json {
  static func main() {

    let args = CommandLine.arguments.dropFirst()
    if args.count > 0 {
      do {
        for arg in args {
          let url = URL(fileURLWithPath: arg)
          guard
            let data = jsonData(toml: try String(contentsOf: url))
          else
          {
            x("Invalid TOML in \(arg)")
            exit(1)
          }
          FileHandle.standardOutput.write(data)
        }
      } catch {
        x(error.localizedDescription)
        exit(1)
      }
      // read stdin
      exit(0)
    }
    let inputData = FileHandle.standardInput.readDataToEndOfFile()
    guard
      let str = String(data: inputData, encoding: .utf8),
      let data = jsonData(toml: str)
    else {
      x("Invalid TOML")
      exit(1)
    }
    FileHandle.standardOutput.write(data)
  }
}
