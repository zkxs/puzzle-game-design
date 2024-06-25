#!/bin/bash
PNG_OPTIONS="-d 150"

function generate {
    local FILENAME="$1"
    echo "  Generating SVG $1..."
    dot -T svg -o "docs/svg/$FILENAME.svg" "graphs/$FILENAME.dot"
    echo "---
layout: svg
title: $FILENAME.svg
svg: $FILENAME
sitemap: false
---" > "docs/svg/$FILENAME.html"
    echo "  Generating PNG $1..."
    inkscape $PNG_OPTIONS -o "docs/img/$FILENAME.png" "docs/svg/$FILENAME.svg"
}

generate "outer-wilds"
generate "outer-wilds-no-dlc"
generate "myst-puzzle-graph"
generate "riven-puzzle-graph"
generate "myst-221-puzzle"
generate "system-stella"
