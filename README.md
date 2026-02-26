# swifties

Simple CLI utilities written in [Swift](https://www.swift.org).

```
./build.sh
```

## case-lower

Lower-case `stdin` or command-line arguments.


## case-sentence

Capitalize the first letter of each word read from `stdin`.

## case-slug

`abc-def-ghi`.

## case-upper

Upper-case `stdin` or command-line arguments.

## date-8601

Print current date in [ISO8601](https://www.iso.org/iso-8601-date-and-time-format.html) format

## date-ymd

Date in `YYYY-MM-DD`, optional first argument as separator


## html-strip-attrs

Read `HTML` markup from `stdin`, remove all attributes from elements and print to `stdout`.

Built on top of [SwiftSoup](https://github.com/scinfu/SwiftSoup).

## html-table-to-json

Read `HTML` markup containing one `<table>` from `stdin`, write data in `JSON` format to `stdout`. Object keys are read from `<th>` elements.

Built on top of [SwiftSoup](https://github.com/scinfu/SwiftSoup).

## json-min

Minify `JSON` read from `stdin`.

## json-pretty

Pretty-print `JSON` read from `stdin`.

## json-reverse

Reverse a `JSON` array read from `stdin`.

## single-line

## whitespace-collapse

