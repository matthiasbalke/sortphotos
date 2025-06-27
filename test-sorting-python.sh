#!/bin/bash

echo ">> resetting test bed..."
rm -rf test/target/* || true
echo "done."
echo ""

echo ">> sorting images..."
python3 src/sortphotos.py $@ --recursive --copy test/source test/target
echo "done."
echo ""


echo ">> listing target..."
ls -alR --color test/target
echo "done."
