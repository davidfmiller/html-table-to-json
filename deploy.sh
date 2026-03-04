#!/bin/sh

# copy all swifties build artifacts to ~/bin

mkdir -p ~/bin # ensure ~/bin exists

for dir in */; do
  [ -d "$dir" ] || continue
  (
    NAME=`basename $dir`
    cd "$dir" || exit
    echo "👧🏼 $NAME"
    cp .build/release/$NAME ~/bin
  )
done
