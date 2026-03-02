
import Foundation
import Cocoa

func exifData(from url: URL) -> [String:Any]? {

  guard
    let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil),
    let tags = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil)
  else {
    return nil
  }

  let dict = tags as NSDictionary as! [String: Any]
  
  if dict.keys.count == 0 {
    return nil
  }
  
  return dict
}

func x(_ error: String) {
  FileHandle.standardError.write(Data("❗️ \(error)".utf8))
}

@main
struct exif {
  static func main() {
    
    let args = CommandLine.arguments.dropFirst()
    if args.count == 0 {
      exit(1)
    }

    for arg in args {
      let url = URL(fileURLWithPath: arg)
      if !FileManager.default.fileExists(atPath: url.path) {
        x("\(arg) doesn’t exist")
        exit(1)
      }

      do {
        guard let data = exifData(from: url) else {
          x("No EXIF data for \(arg)")
          exit(1)
        }
        let json = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
        print(String(data:json, encoding: .utf8)!)
      } catch {
        x("❗️ \(error)")
        exit(1)
      }
    }
  }
}
