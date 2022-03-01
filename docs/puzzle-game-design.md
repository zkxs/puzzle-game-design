# Puzzle Game Design

<script>
function registerSvg(id) {
    var element = document.getElementById(id);
    var panZoom = svgPanZoom(element, {
        zoomEnabled: true,
        controlIconsEnabled: true,
        fit: 1,
        center: 1
    });
    window.addEventListener('resize', function() {
        panZoom.resize();
        panZoom.fit();
        panZoom.center();
    });
    console.log("Ran SVG setup for " + id);
}
</script>

<object id="svg-outer-wilds" type="image/svg+xml" data="outer-wilds.svg" style="width: 500px; height: 500px; border:1px solid black;" onload="registerSvg('svg-outer-wilds')">Your browser does not support SVG</object>

Test text!
