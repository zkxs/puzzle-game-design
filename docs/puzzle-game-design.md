# Puzzle Game Design

<object id="svg-outer-wilds" type="image/svg+xml" data="outer-wilds.svg" style="width: 500px; height: 500px; border:1px solid black; ">Your browser does not support SVG</object>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var panZoom = svgPanZoom('#svg-outer-wilds', {
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
    }, false);
</script>

Test text!
