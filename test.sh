#!/bin/sh -ux

outd="$(npm outdated --json)"
test $? = 0

test -z "$outd" \
  || node -e "o=${outd}; Object.keys(o).map((p) => { if (o[p].current !== o[p].wanted) throw new Error(o[p]) })"