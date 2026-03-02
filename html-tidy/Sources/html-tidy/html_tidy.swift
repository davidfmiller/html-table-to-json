
import Foundation
import SwiftSoup


func tidy(html: String) throws -> String {

  let doc = try SwiftSoup.parse(html)

  let settings = OutputSettings()
    .prettyPrint(pretty: true)     // enable pretty printing
    .indentAmount(indentAmount: 2)       // spaces per indent (default is 1)
    .outline(outlineMode: true)        // optional: outline mode

  doc.outputSettings(settings)

  let pretty = try doc.outerHtml()
  return pretty
}


@main
struct html_tidy {
  static func main() {
      
    let args = CommandLine.arguments.dropFirst()
    if args.count > 0 {
      for arg in args {
        do {
          let contents = try String(contentsOfFile: arg, encoding: .utf8)
          let pretty = try tidy(html: contents)
          print(pretty)
        } catch {
          FileHandle.standardError.write(Data("❗️ \(error)".utf8))
          exit(1)
        }
      }
      exit(0)
    }

    let data = FileHandle.standardInput.readDataToEndOfFile()
    let result = String(decoding: data, as: UTF8.self)
    do {
      let pretty = try tidy(html: result)
      print(pretty)
    } catch {
      FileHandle.standardError.write("❗️ \(error)".data(using: .utf8)!)
      exit(1)
    }

  }
}
