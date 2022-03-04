#!/bin/bash
PNG_OPTIONS="-d 150"
# Z_BEST_COMPRESSION
# CAIRO_ANTIALIAS_BEST

function generate {
    echo "  Generating SVG..."
    dot -T svg -o "docs/svg/$FILENAME.svg" "graphs/$FILENAME.dot"
    echo "---
layout: svg
svg: $FILENAME
---
" > "docs/svg/$FILENAME.html"
    #echo "  Generating PNG..."
    #inkscape $PNG_OPTIONS -o "docs/img/$FILENAME.png" "docs/svg/$FILENAME.svg" &> /dev/null
}

echo "Outer Wilds:"
FILENAME="outer-wilds"
generate


echo "Myst:"
FILENAME="myst-puzzle-graph"
generate

echo "Riven:"
FILENAME="riven-puzzle-graph"
generate
