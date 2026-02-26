
import Foundation



@main
struct date_ymd {
    static func main() {

      let currentDate = Date()
      let dateFormatter = DateFormatter()

      let sep = CommandLine.arguments.count == 2 ? CommandLine.arguments[1] : "-"
      dateFormatter.locale = Locale(identifier: "en_US_POSIX")
      dateFormatter.dateFormat = "yyyy\(sep)MM\(sep)dd"

      let dateString = dateFormatter.string(from: currentDate)
      print(dateString)
    }
}
