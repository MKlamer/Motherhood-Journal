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

var fieldset = document.getElementsByTagName('input');
    for (var j = 0; j < fieldset.length; j++) {
        fieldset[j].addEventListener('click', toggle, false);

var personography = Document.getElementById('pIndexNote');

function show_personography() {
    var personography = this.child/note;
    console.log('personography = ' + footnote);
    footnote.style.display = "inline";
}

function hide_personography() {
    var footnote = this.child/note;
    footnote.style.display = "none";
}
function toggle () {
   var id = REGtoggle
   switch (id) {
       case "sic": {
           var edView = document.getElementsByClassName('sic');
           for (var i = 0; i < sic.length; i++) {
               sic[i].classList.toggle("on")
           }
           }
           break;
      case "REG": {
          var regView = document.getElementsByClassName('reg');
          for (var i=0; i < reg.length; i++) {
              reg[i].classList.toggle("on")   
      }
      }
      break;
    }
   }
   
   var edView = document.getElementsByClassName('sic');
    console.log('sic =' +sic);
    sic.style.display = "inline";
       
    var regView = document.getElementsByClassName('reg');
    console.log('reg =' +reg);
    reg.style.display = "hidden";
     
  
}
 




