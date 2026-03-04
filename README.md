# swifties

Simple CLI utilities written in [Swift](https://www.swift.org).

```
./clean.sh #
./build.sh # build and copy artifacts to ~/bin
```

### case-capitalize

Capitalize first letter of each word in `stdin`.

### case-lower

Lower-case `stdin` or command-line arguments.

### case-sentence

Capitalize the first letter of each sentence read from `stdin`.

### case-slug

`abc-def-ghi`.

### csv-to-json

Read CSV from `stdin`, print JSON to `stdout`.

Built on top of [SwiftCSV](https://github.com/swiftcsv/SwiftCSV).

### date-8601

Print current date in [ISO8601](https://www.iso.org/iso-8601-date-and-time-format.html) format

### date-mod

Modify a date (default: `now`) by a number of seconds, minutes, hours, days, or weeks.

### date-ymd

Date in `YYYY-MM-DD`, optional first argument as separator

### exif

Print JSON-formatted EXIF data for files passed via arguments.

### html-strip-attrs

Read `HTML` markup from `stdin`, remove all attributes from elements and print to `stdout`.

Built on top of [SwiftSoup](https://github.com/scinfu/SwiftSoup).

### html-table-to-json

Read `HTML` markup containing one `<table>` from `stdin`, write data in `JSON` format to `stdout`. Object keys are read from `<th>` elements.

Built on top of [SwiftSoup](https://github.com/scinfu/SwiftSoup).

### html-tidy

Reflow `HTML` markup to be nicely formatted.

Built on top of [SwiftSoup](https://github.com/scinfu/SwiftSoup).

### json-min

Minify `JSON` read from `stdin`.

### json-pretty

Pretty-print `JSON` read from `stdin`.

### json-reverse

Reverse a `JSON` array read from `stdin`.

### markdown

Read `markdown` from `stdin`, convert to HTML & write to `stdout`.

### single-line

### whitespace-collapse

---

## TODO

* date-ymd: option to read date from `stdin`
* string-trim
