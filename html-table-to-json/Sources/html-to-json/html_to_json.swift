
import Foundation
import SwiftSoup

struct HTMLError: Error, CustomStringConvertible {
  let message: String

  var description: String {
    return self.message
  }
}

func htmlTableToJSON(html: String) throws -> String {

  let doc: Document = try SwiftSoup.parse(html)
  let nodes = try doc.getElementsByTag("table")
  if nodes.size() == 0 {
    throw HTMLError(message: "No <table> found")
  }

  let table = try doc.getElementsByTag("table")[0]
  let headers: [String] = try table.select("th").map { try $0.text() }
  let rows = try table.select("tbody tr")

  var jsonArray: [[String: String]] = []
  for row in rows {
    let cells = try row.select("td")
    var rowObject: [String: String] = [:]
    for (index, cell) in cells.enumerated() {
      if index < headers.count {
        rowObject[headers[index]] = try cell.text()
      }
    }
    jsonArray.append(rowObject)
  }
  let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
  return String(data: jsonData, encoding: .utf8)!
}


@main
struct html_to_json {

  static func main() {
    let data = FileHandle.standardInput.readDataToEndOfFile()
    let result = String(decoding: data, as: UTF8.self)
    do {
      let jsonOutput = try htmlTableToJSON(html: result)
      print(jsonOutput)
    } catch {
      FileHandle.standardError.write("❗️ \(error)".data(using: .utf8)!)
    }
  }
}
