# Puzzle Game Design

<object id="svg-outer-wilds" type="image/svg+xml" data="outer-wilds.svg" style="width: 500px; height: 500px; border:1px solid black; ">Your browser does not support SVG</object>

<script>
    function setupSvg(id) {
        var element = $(id);
        element.load(function () {
            var panZoom = svgPanZoom(element, {
                zoomEnabled: true,
                controlIconsEnabled: true,
                fit: 1,
                center: 1
            });

            $(window).resize(function(){
                panZoom.resize();
                panZoom.fit();
                panZoom.center();
            });
            console.log("Ran setup for " + id);
        });
        console.log("Registered setup callback for " + id);
    }

    var ids = ['#svg-outer-wilds'];
    ids.forEach(id => setupSvg(id));
    console.log("Script done");
</script>

Test text!
