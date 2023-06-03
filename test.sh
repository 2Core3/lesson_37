#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Отсутвуетарумент"
  exit 1
fi
output=$(./$1)
if [ "$output" = "dos13" ]; then
  echo "Success!"
  exit 0
else
  echo "Failed"
  exit 1
fi
