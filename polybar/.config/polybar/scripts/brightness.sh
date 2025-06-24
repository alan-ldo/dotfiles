#!/bin/sh
brightness=$(brightnessctl -m | awk -F, "{print substr(\$4, 0, length(\$4)-1)}")
echo "$brightness%"
