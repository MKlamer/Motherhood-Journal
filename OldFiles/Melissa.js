window.addEventListener('DOMContentLoaded',init,false);
            
function init() {
    alert('The page loaded!');
}
var buttons = document.getElementsByTagName("button");
var button = buttons[0];
button.addEventListener('click',show_hide,false);

function show_hide() {

var p = document.p[id="paragraphToToggle"];

if (p.style.display = "on") {p.style.display = "none";}
else {p.style.display = "on";}
}