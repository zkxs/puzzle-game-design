# Puzzle Game Design

<script>
function registerSvg(id) {
    var element = document.getElementById(id);
    var panZoom = svgPanZoom(element, {
        controlIconsEnabled: false,
        fit: true,
        center: false
    });
    window.addEventListener('resize', function() {
        panZoom.resize();
    });
    console.log("Ran SVG setup for " + id);
}
</script>

<object id="svg-outer-wilds" type="image/svg+xml" data="outer-wilds.svg" style="border:1px solid black;" onload="registerSvg('svg-outer-wilds')">Your browser does not support SVG</object>

Test text!
