#!/usr/bin/env bash

set -euo pipefail

echo "West Update"
echo "- - -"
west update

echo
echo "Zephyr Export"
echo "- - -"
west zephyr-export

echo
echo "Build Left"
echo "- - -"
west build -s zmk/app -d build/left -b adv360_left -- -DZMK_CONFIG="$(pwd)/config"

echo
echo "Build Right"
echo "- - -"
west build -s zmk/app -d build/right -b adv360_right -- -DZMK_CONFIG="$(pwd)/config"

echo
echo "Rename Build Output"
echo "- - -"
cp build/left/zephyr/zmk.uf2 left.uf2 && cp build/right/zephyr/zmk.uf2 right.uf2

echo
echo "- - -"
echo "(done)"
echo
