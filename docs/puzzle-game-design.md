# Puzzle Game Design

<script>
function foo(id) {
    var object = document.getElementById(id);
    console.log("foo() called! " + (object.contentDocument !== null) + " " + (object.contentDocument != null));
}
</script>

<object id="svg-outer-wilds" type="image/svg+xml" data="outer-wilds.svg" style="width: 500px; height: 500px; border:1px solid black;" onload="foo('svg-outer-wilds')">Your browser does not support SVG</object>
<object id="svg-outer-wilds-test" type="image/svg+xml" data="outer-wilds.svg" style="width: 500px; height: 500px; border:1px solid black;" onload="bar('svg-outer-wilds-test')">Your browser does not support SVG</object>

<script>
function setupSvg(id) {
    var element = document.getElementById(id);
    var guaranteedCallbackRan = false;
    var guaranteedCallback = function () {
        if (guaranteedCallbackRan) {
            return;
        }
        guaranteedCallbackRan = true;

        var panZoom = svgPanZoom(element, {
            zoomEnabled: true,
            controlIconsEnabled: true,
            fit: 1,
            center: 1
        });

        $(window).resize(function() {
            panZoom.resize();
            panZoom.fit();
            panZoom.center();
        });
        console.log("Ran setup for " + id);
    }
    var timeout = setTimeout(function(){guaranteedCallback("timeout")}, 100);
    $("#" + id).load(function () {
        cleartimeout(timeout);
        guaranteedCallback("load");
    });
    console.log("Registered setup callback for " + id);
}

var ids = ['svg-outer-wilds'];
document.addEventListener('DOMContentLoaded', function() {
    ids.forEach(id => setupSvg(id));
}, false);
console.log("Script done");
</script>

Test text!
