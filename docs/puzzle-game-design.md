# Puzzle Game Design

<script src="svg-pan-zoom.js"></script>
<script>
function registerSvg(id) {
    var element = document.getElementById(id);
    var panZoom = svgPanZoom(element, {
        controlIconsEnabled: true,
        fit: true,
        center: false
        zoomScaleSensitivity: 1,
        minZoom: 0.25,
        maxZoom: 15
    });
    window.addEventListener('resize', function() {
        panZoom.resize();
    });
    console.log("Ran SVG setup for " + id);
}
</script>

<object id="svg-outer-wilds" type="image/svg+xml" data="outer-wilds.svg" style="height:100%; width:100%; border:1px solid black;" onload="registerSvg('svg-outer-wilds')">Your browser does not support SVG</object>

Test text!
