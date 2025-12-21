#!/bin/sh
set -eu

total=0
for i in 1 2 3 4 5 6 7 8 9 10 11 12; do
  echo "== $i.cigg =="
  tf=$(mktemp)
  /usr/bin/time -p -o "$tf" cigg "$i.cigg"
  t=$(awk '/^real /{print $2}' "$tf")
  rm -f "$tf"
  echo "Time: ${t}s"
  total=$(awk -v a="$total" -v b="$t" 'BEGIN{printf "%.2f", a+b}')
done
echo ""
echo "total $total"
