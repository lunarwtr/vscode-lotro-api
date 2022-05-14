// @ts-nocheck
// This script will be run within the webview itself
// It cannot access the main VS Code APIs directly.
(function () {
    const vscode = acquireVsCodeApi();
    const regexp = /scale\(([0-9\.]+)\)/;

    // Set VS Code state
    let state = JSON.parse(document.getElementById('skin-panel').getAttribute('data-state'))
    vscode.setState(state)

    window.addEventListener(
        'load',
        function () {
            document.onwheel = function (event) {
                if (event.ctrlKey) {
                    if (event.wheelDeltaY < 0) zoomOut()
                    else zoomIn()
                }
            }
            document.getElementById('zoom_in').addEventListener('click', zoomIn)
            document.getElementById('zoom_out').addEventListener('click', zoomOut)
            document.getElementById('zoom_reset').addEventListener('click', zoomReset)
            document.getElementById('zoom_fit').addEventListener('click', zoomFit)
            document.getElementById('skin-panel-ddl').addEventListener('change', selectPanel)
            document.getElementById('show_skin_border').addEventListener('click', toggleBorders)
            var cont = document.getElementById('skin-panel')
            cont.style.transform = 'scale(' + (state.zoom === 'fit' ? calcFitScale() || 1 : state.zoom) + ')'
        },
        false
    )
    function selectPanel() {
        var ddl = document.getElementById('skin-panel-ddl');
        state.selectedPanelID = ddl.value;
        vscode.setState(state);
        vscode.postMessage({
            command: 'setState',
            body: state,
        });
    }
    function toggleBorders() {
        var cbx = document.getElementById('show_skin_border');
        var cont = document.getElementById('skin-panel');
        if (cbx.checked) {
            cont.classList.add('display-borders');
        } else {
            cont.classList.remove('display-borders');
        }
        state.showBorders = cbx.checked;
        vscode.setState(state);
        vscode.postMessage({
            command: 'setState',
            body: state,
        });
    }
    function zoomIn() {
        var cont = document.getElementById('skin-panel');
        var zoomFloat = currentZoomValue(cont);
        zoomFloat += zoomFloat * 0.1;
        setZoom(cont, zoomFloat);
    }
    function zoomOut() {
        var cont = document.getElementById('skin-panel');
        var zoomFloat = currentZoomValue(cont);
        zoomFloat -= zoomFloat * 0.1;
        if (zoomFloat < 0.1) return
        setZoom(cont, zoomFloat);
    }
    function setZoom(cont, zoomFloat, isFit) {
        cont.style.transform = 'scale(' + zoomFloat + ')'
        state.zoom = isFit ? 'fit' : zoomFloat
        vscode.setState(state)
        vscode.postMessage({
            command: 'setState',
            body: state,
        })
    }
    function zoomReset() {
        var cont = document.getElementById('skin-panel')
        setZoom(cont, 1.0)
    }
    function calcFitScale() {
        var cont = document.getElementById('skin-panel')
        var scale = Math.min((document.documentElement.clientWidth - 25) / cont.offsetWidth, (document.documentElement.clientHeight - 60) / cont.offsetHeight)
        return scale
    }
    function zoomFit() {
        var scale = calcFitScale()
        setZoom(document.getElementById('skin-panel'), scale, true)
    }
    function currentZoomValue(cont) {
        if (cont.style.transform) {
            var match;
            if ((match = regexp.exec(cont.style.transform)) !== null) {
                return parseFloat(match[1])
            }
        }
        return 1.0;
    }
})()
