# Puzzle Game Design

<embed id="svg-outer-wilds" type="image/svg+xml" style="width: 500px; height: 500px; border:1px solid black; " src="outer-wilds.svg" />

<script>
    (function() {
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
    })();
</script>

Test text!
