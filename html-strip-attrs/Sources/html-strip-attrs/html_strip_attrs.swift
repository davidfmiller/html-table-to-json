
import Foundation
import SwiftSoup

// element attributes that _should_ be kept in the output
let excluded : [String] = [
  "href",
  "content",
  "name",
  "itemprop",
  "src",
  "title"
]

func removeAllAttributes(from html: String) throws -> String {
  let doc = try SwiftSoup.parse(html)
  let elements = try doc.getAllElements()

  for element in elements {
    let attributes = element.getAttributes()
    attributes?.forEach { attr in
      let key = attr.getKey()
      if !excluded.contains(key) {
        _ = try? element.removeAttr(key)
      }
    }
  }

  return try doc.body()?.html() ?? ""
}

@main
struct html_strip_attrs {
  static func main() {

    let args = CommandLine.arguments.dropFirst()
    if args.count > 0 {
      for arg in args {
        do {
          let contents = try String(contentsOfFile: arg, encoding: .utf8)
          let stripped = try removeAllAttributes(from: contents)
          print(stripped)
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
      let stripped = try removeAllAttributes(from: result)
      print(stripped)
    } catch {
      FileHandle.standardError.write("❗️ \(error)".data(using: .utf8)!)
      exit(1)
    }
  }
}
