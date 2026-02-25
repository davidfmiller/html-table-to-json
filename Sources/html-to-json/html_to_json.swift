
import Foundation
import SwiftSoup

func htmlTableToJSON(html: String) -> String? {
    do {
        let doc: Document = try SwiftSoup.parse(html)
        let nodes = try doc.getElementsByTag("table")
        if nodes.size() == 0 {
            FileHandle.standardError.write("no table".data(using: .utf8)!)
            return nil
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
                    // Use header as the key and cell text as the value
                    rowObject[headers[index]] = try cell.text()
                }
            }
            jsonArray.append(rowObject)
        }
        let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
        return String(data: jsonData, encoding: .utf8)

    } catch Exception.Error(_, let message) {
        FileHandle.standardError.write(message.data(using: .utf8)!)
    } catch {
        FileHandle.standardError.write("An unexpected error occurred: \(error)".data(using: .utf8)!)
    }

    return nil
}


@main
struct html_to_json {

    static func main() {
      let data = FileHandle.standardInput.readDataToEndOfFile()
      let result = String(decoding: data, as: UTF8.self)

      if let jsonOutput = htmlTableToJSON(html: result) {
          print(jsonOutput)
      }
    }
}
