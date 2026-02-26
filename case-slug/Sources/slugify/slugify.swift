import Foundation

extension String {
  /**

  */
  var slug: String {

    // lowercase
    var slug = self.lowercased()

    // remove diacritics (é -> e, ü -> u, etc.)
    slug = slug.folding(options: .diacriticInsensitive, locale: .current)

    // keep only letters, numbers, and spaces
    slug = slug.unicodeScalars
        .map { CharacterSet.alphanumerics.contains($0) || $0 == " " ? Character($0) : " " }
        .reduce(into: "") { $0.append($1) }

    // replace one or more spaces with a single hyphen
    slug = slug
        .replacingOccurrences(of: "\\s+", with: "-", options: .regularExpression)

    // trim hyphens from start/end
    slug = slug.trimmingCharacters(in: CharacterSet(charactersIn: "-"))

    return slug
  }
}


@main
struct slugify {
  static func main() {

    if CommandLine.arguments.count > 1 {
      let arguments = Array(CommandLine.arguments[1 ..< CommandLine.arguments.count])
      for arg in arguments
      {
        print(arg.slug)
      }
      exit(0)
    }

    let inputData = FileHandle.standardInput.readDataToEndOfFile()
    let str = String(data: inputData, encoding: .utf8)!
    print(str.slug)
  }
}
