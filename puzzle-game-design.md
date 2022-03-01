# Puzzle Game Design

<head>
    <script src="http://ariutta.github.io/svg-pan-zoom/dist/svg-pan-zoom.min.js"></script>
</head>


<object id="svg-outer-wilds" type="image/svg+xml" data="outer-wilds.svg" style="width: 500px; height: 500px; border:1px solid black; ">Your browser does not support SVG</object>

<script>
    // Don't use window.onLoad like this in production, because it can only listen to one function.
    window.onload = function() {
    var panZoom = window.panZoom = svgPanZoom('#svg-outer-wilds', {
        zoomEnabled: true,
        controlIconsEnabled: true,
        fit: 1,
        center: 1
    });

    $(window).resize(function(){
        panZoom.resize();
        panZoom.fit();
        panZoom.center();
    })
    };
</script>

Test text!
