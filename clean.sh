#!/bin/sh

# ensure ~/bin exists
mkdir -p ~/bin

# build all swifties & copy build artifact to ~/bin

for dir in */; do
  [ -d "$dir" ] || continue
  (
    NAME=`basename $dir`
    echo "👧🏼 $NAME"
    rm -rf "$dir/.build" || exit
  )
done
