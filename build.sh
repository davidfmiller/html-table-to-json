#!/bin/sh

for dir in */; do
  [ -d "$dir" ] || continue
  (
    NAME=`basename $dir`
    cd "$dir" || exit
    echo "👧🏼 $NAME"
    swift build -c release
    cp .build/release/$NAME ~/bin
  )
done
