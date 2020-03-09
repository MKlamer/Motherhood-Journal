/* Javascript file created for The Elizabeth Gaskell Journal: Digital Edition
 * Available at: www.elizabethgaskelljournal.com
 * First digital edition in TEI-XML, 2020
 * Maintained and Edited by Melissa J. Klamer (klamerme@msu.edu) */
 /* Code adapted from the Digital Mitford project: https://digitalmitford.org */

window.onload = init;

function init() {
    var anchors = document.getElementsByClassName("ref");
    for (var i = 0; i < anchors.length; i++)
    {
        anchors[i].addEventListener('mouseover', show_footnote, false);
        anchors[i].addEventListener('click', show_footnote, false);
        anchors[i].addEventListener('mouseout', hide_footnote, false);
        anchors[i].addEventListener('dblclick', hide_footnote, false);
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


