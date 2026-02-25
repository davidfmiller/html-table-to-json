
import Foundation
import SwiftSoup

func removeAllAttributes(from html: String) throws -> String {
    let doc = try SwiftSoup.parse(html)
    let elements = try doc.getAllElements()

    for element in elements {
        let attributes = element.getAttributes()
        attributes?.forEach { attr in
            _ = try? element.removeAttr(attr.getKey())
        }
    }

    return try doc.body()?.html() ?? ""
}

@main
struct html_strip_attrs {
    static func main() {
      let data = FileHandle.standardInput.readDataToEndOfFile()
      let result = String(decoding: data, as: UTF8.self)
      do {
      let stripped = try removeAllAttributes(from: result)
      print(stripped)
      } catch {
        FileHandle.standardError.write("❗️ \(error)".data(using: .utf8)!)
      }
    }
}
