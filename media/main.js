// @ts-nocheck
// This script will be run within the webview itself
// It cannot access the main VS Code APIs directly.
(function () {
    const vscode = acquireVsCodeApi();
    const regexp = /scale\(([0-9\.]+)\)/;

    // Handle messages sent from the extension to the webview
    window.addEventListener('message', (event) => {
        const message = event.data // The json data that the extension sent
        switch (message.command) {
            case 'refactor':
                currentCount = Math.ceil(currentCount * 0.5)
                counter.textContent = `${currentCount}`
                break
        }
    })

    // Set VS Code state
    let state = JSON.parse(document.getElementById('skin-panel-container').getAttribute('data-state'))
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
            var cont = document.getElementById('skin-panel-container')
            cont.style.transform = 'scale(' + (state.zoom === 'fit' ? calcFitScale() || 1 : state.zoom) + ')'
        },
        false
    )
    function selectPanel() {
        var ddl = document.getElementById('skin-panel-ddl')
        state.selectedPanelID = ddl.value
        vscode.setState(state)
        vscode.postMessage({
            command: 'setState',
            body: state,
        })
    }
    function zoomIn() {
        var cont = document.getElementById('skin-panel-container')
        var zoomFloat = currentZoomValue(cont)
        zoomFloat += zoomFloat * 0.1
        setZoom(cont, zoomFloat)
    }
    function zoomOut() {
        var cont = document.getElementById('skin-panel-container')
        var zoomFloat = currentZoomValue(cont)
        zoomFloat -= zoomFloat * 0.1
        if (zoomFloat < 0.1) return
        setZoom(cont, zoomFloat)
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
        var cont = document.getElementById('skin-panel-container')
        setZoom(cont, 1.0)
    }
    function calcFitScale() {
        var cont = document.getElementById('skin-panel-container')
        var scale = Math.min((document.documentElement.clientWidth - 15) / cont.offsetWidth, (document.documentElement.clientHeight - 15) / cont.offsetHeight)
        return scale
    }
    function zoomFit() {
        var scale = calcFitScale()
        setZoom(document.getElementById('skin-panel-container'), scale, true)
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
