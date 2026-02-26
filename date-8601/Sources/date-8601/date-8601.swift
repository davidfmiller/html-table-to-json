import Foundation


@main
struct iso8601 {
  static func main() {

    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [
        .withInternetDateTime,
        .withTimeZone
    ]
    formatter.timeZone = .current

    print(formatter.string(from: Date()))
  }
}
