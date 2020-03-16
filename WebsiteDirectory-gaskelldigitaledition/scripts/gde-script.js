/* Javascript file created for The Elizabeth Gaskell Journal: Digital Edition
 * Available at: www.elizabethgaskelljournal.com
 * First digital edition in TEI-XML, 2020
 * Maintained and Edited by Melissa J. Klamer (klamerme@msu.edu) */
 /* Code adapted from the Digital Mitford project: https://digitalmitford.org */

window.onload = init;

function init() /* ebb: Here's where Being is but an Ear! Add your event listeners here and set up what functions you want to fire next. */
{
    var anchors = document.getElementsByClassName("ref");
    var prosopRefs = document.getElementsByClassName('pIndex');
    var sicReg = document.getElementById('REGtoggle');
    
    sicReg.addEventListener('click', toggle, false);
    
    for (var i = 0; i < anchors.length; i++)
    {
        anchors[i].addEventListener('mouseover', show_footnote, false);
        anchors[i].addEventListener('click', show_footnote, false);
        anchors[i].addEventListener('mouseout', hide_footnote, false);
        anchors[i].addEventListener('dblclick', hide_footnote, false);
        }
    for (var i = 0; i < prosopRefs.length; i++)
    {
        prosopRefs[i].addEventListener('mouseover', show_footnote, false);
        prosopRefs[i].addEventListener('click', show_footnote, false);
        prosopRefs[i].addEventListener('mouseout', hide_footnote, false);
        prosopRefs[i].addEventListener('dblclick', hide_footnote, false);
        
        }
        }
        
function show_footnote() {
    var footnote = this.nextSibling;
    console.log('footnote = ' + footnote);
    footnote.style.display = "inline";
}

function hide_footnote() {
    var footnote = this.nextSibling;
    footnote.style.display = "none";
}

var fieldset = document.getElementsByTagName('input');
    for (var j = 0; j < fieldset.length; j++) {
        fieldset[j].addEventListener('click', toggle, false);

}
function toggle() {
   var sics = document.getElementsByClassName("sic");
            for (var i = 0; i < sics.length; i++) {
                sics[i].classList.toggle("on")
            }
    var regs = document.getElementsByClassName("reg");
            for (var i = 0; i < regs.length; i++) {
                regs[i].classList.toggle("on")
            }     
  
}

 




