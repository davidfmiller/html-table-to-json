import Foundation
import Yams



func yamlData(yamlString: String) -> Data? {
  do {
    guard
      let yaml = try Yams.load(yaml: yamlString)
    else {
      return nil
    }
    let jsonData = try JSONSerialization.data(
      withJSONObject: yaml,
      options: [.prettyPrinted]
    )
    return jsonData
  } catch {
    return nil
  }
}

func x(_ message: String) {
  FileHandle.standardError.write(Data("❗️ \(message)".utf8))
}

@main
struct yaml_to_json {
  static func main() {

    let args = CommandLine.arguments.dropFirst()
    if args.count > 0 {
      do {
        for arg in args {
          let url = URL(fileURLWithPath: arg)
          guard
            let data = yamlData(yamlString: try String(contentsOf: url))
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
      exit(0)
    }
    let inputData = FileHandle.standardInput.readDataToEndOfFile()
    guard
      let str = String(data: inputData, encoding: .utf8),
      let data = yamlData(yamlString: str)
    else {
      x("Invalid TOML")
      exit(1)
    }
    FileHandle.standardOutput.write(data)
  }
}
