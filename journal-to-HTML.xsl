<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:variable name="pIndex" as="document-node()" select="document('Gaskell_prosopography.xml')"/>
    <!--xsl:variable that points to the personography/placeography file to reference later.   -->
    <xsl:template match="/">
        <html>
            <head>
                <title>The Elizabeth Gaskell Journal: Digital Edition</title>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" type="text/css" href="css/style-gaskelljournal.css"/>
                <script type="text/javascript" src="scripts/gde-script.js"/>
            </head>
            <body>
                <!-- Navigational Header Begin -->
                <div class="navigation">
                    <nav>
                        <div class="navbar" id="navbar">
                            <div class="block"/>
                            <ul class="navigation">
                                <li><a class="Homelink" href="index.html">Home</a></li>
                                <li><div class="dropdown">
                                    <button class="dropbtn">The Dissertation</button>
                                    <div class="dropdown-content">
                                        <a href="gde-dissertationrationalepage.html">Dissertation Rationale</a>
                                        <a href="gde-digitaldissertationpage.html">Read the Dissertation
                                            Chapter</a>
                                        <a href="gde-abouteditorpage.html">About the Editor</a>
                                    </div>
                                    
                                </div></li>
                                <li><div class="dropdown">
                                    <button class="dropbtn">About</button>
                                    <div class="dropdown-content">
                                        <a href="gde-aboutpage.html">Previous Editions</a>
                                        <a href="https://github.com/MKlamer/Motherhood-Journal" target="_blank">View the TEI File</a>
                                        <a href="gde-acknowledgements.html">Acknowledgements</a>
                                        <a href="gde-methodspage.html">Methodology</a>
                                        <a href="gde-editorialpolicypage.html">Editing Policy</a>
                                    </div>
                                </div></li>
                                <li><div class="Edition">
                                    <a href="gde-editionpage.html">Elizabeth Gaskell Journal:<br />The Digital
                                        Edition</a>
                                </div></li>
                                <li><div class="dropdown">
                                    <button class="dropbtn">Gaskell's World</button>
                                    <div class="dropdown-content">
                                        <a href="gde-gaskellpage.html">Gaskell's Journal</a>
                                        <a href="gde-personpage.html">Key People</a>
                                        <a href="gde-diaryessay.html">Victorian Diaries</a>
                                        <a href="gde-motherhoodessay.html">Victorian Motherhood</a>
                                        <!-- <a href="gde-familytreepage.html">Gaskell's Family</a> -->
                                        
                                        <!-- ? Gaskell As Novelist -->
                                    </div>
                                </div></li>
                                <li><div class="dropdown">
                                    <button class="dropbtn">Resources</button>
                                    <div class="dropdown-content">
                                        <a href="gde-resourcespage.html">Other Gaskell Resources</a>
                                        <a href="gde-otherprojects.html">More 19th Century Digital Editions</a>
                                        <a href="gde-projecttoolspage.html">Digital Tools Used in the
                                            Project</a>
                                        <a href="gde-alphabetpage.html">Gaskell's Handwriting</a>
                                    </div>
                                </div></li>
                            </ul><div class="block"/>
                        </div>
                    </nav>
                    <img class="header" id="headerimage" width="1920" height="256"
                        src="images/GDE-JournalHeaderRevised.jpg"
                        alt="The Elizabeth Gaskell Journal Header Image"/>
                    
                    
                </div>
                <!-- Navigational Header End -->
                <h2>Read Gaskell’s Journal</h2>

                <div id="fieldset">
                    <fieldset><legend>Choose Your View:</legend><span class="dipNorm">The default view (Edition View) of the
                                journal represents Gaskell's original text as it appears in the
                                manuscript. <br/>The edition view contains editorial notes and
                                Gaskell's own spellings and symbols.<br/>
                                The normalized view shows conventional spellings; hides notes, insertion marks, and
                                deletions). Click to select the normalized view.</span><span class="choose"><input type="checkbox" id="REGtoggle"
                                    style="cursor:pointer"/><label class="checkbox" for="REGtoggle">Select normalized view.</label></span></fieldset>
                </div>
                <h2>Explore the Journal by Entry:</h2>

                <ul class="entryLink">
                   <xsl:apply-templates select="descendant::body" mode="toc"/>
                </ul>
                <hr/>
                <div id="main">
                    <xsl:apply-templates select="descendant::body/div[@type = 'journal']"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="div[@type = 'journal']">
        <section class="journal_full" id="j{count(preceding::div[@type='journal']) + 1}">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="div[@type = 'journal']/div[@type = 'headnote'][head]">
        <header class="headnote">
            <h2>
                <xsl:apply-templates select="head[1]"/>
            </h2>
            <xsl:if test="child::dateline">
                <h3>
                    <xsl:apply-templates select="dateline"/>
                </h3>
            </xsl:if>
            <!--We need to process the other following-sibling head elements here, and
        it will help to have attribute values on those in case you want to process them differently.-->
            <xsl:apply-templates select="head[position() gt 1]"/>
        </header>
        <div class="headnote-text">
            <xsl:apply-templates select="p"/>
        </div><span class="returnLink">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<a href="gde-editionpage.html"><i>Back to Top</i></a></span>
    </xsl:template>
    <xsl:template match="div[@type = 'journal']/div[@type = 'entry']">
        <section class="journal_sep">
            <article class="entry_txt">
                <xsl:apply-templates/>
            </article>
            <!-- <article class="entry_img"></article>-->
        </section>
    </xsl:template>
    <xsl:template match="head[position() gt 1]">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <span class="prose">
                <xsl:apply-templates/>
            </span>
        </p>
    </xsl:template>
    <xsl:template match="pb">
        <span class="figure">
            <img class="page" id="{@xml:id}" src="{@facs}"
                alt="{@ed} (photo facsimile page {count(preceding::pb) + 1})"/>
            <span class="caption">Page <xsl:value-of select="count(preceding::pb) + 1"/></span>
        </span>

    </xsl:template>
    <xsl:template match="space">
        <!-- Uses html non-breaking space characters to replicate Gaskell's long mid-paragraph breaks. -->
        <span class="longspace">&#160;&#160;&#160;&#160; <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="gap">
        <span class="gap">
           
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="note">
        <span class="ref" id="ref-{count(preceding::note) + 1}">
            <xsl:value-of select="count(preceding::note) + 1"/>
        </span>
        <span class="ed-note" id="note-{count(preceding::note) + 1}">
            <i>Note: (Resp:<xsl:value-of select="@resp"/>) <xsl:apply-templates/></i>
        </span>
    </xsl:template>
    <xsl:template match="del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    <xsl:template match="add">
        <!-- This needs to be changed - possibly using CSS? -  to align above the regular text line. I realized later that it isn't actually a superscript... Need to check in manuscript. -->
        <span class="insertion">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
   <!-- Removed to adjust; supplied text will appear inline and be combined with an editorial note; Change made: 29 May 2020, #mjk.
    <xsl:template match="supplied">
        <i>&#160;*Supplied by&#160;<xsl:value-of select="./@resp"/>&#160;:&#160;
            [<xsl:apply-templates/>]</i>
    </xsl:template> -->
    <xsl:template match="lg | l">
        <!-- This and other elements (add, delete, etc. need to appear differently in a clear reading view and in an analytical view. The italics should only show up in the simple reading view. The scholarly view will include the note regarding where Gaskell was quoting from. -->
        <br/>
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    <!-- Have to checkc consistency of metamark encoding.
        <xsl:template match="metamark">
        </xsl:template> -->
    <xsl:template match="choice">
        <span class="choice">
            <span class="sic">
                <xsl:apply-templates select="sic"/>
            </span>
            <span class="reg">
                <xsl:apply-templates select="reg"/>
            </span>
        </span>
    </xsl:template>
    <xsl:template match="quote | q">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>
    <xsl:template match="hi[@rend = 'underline']">
        <u><span class="underline">
            <xsl:apply-templates/>
        </span></u>
    </xsl:template>
    <xsl:template match="hi[@rend = 'superscript']">
        <span class="above">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="hi[@rend = 'strikethrough']">
        <span class="strikethrough">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="persName | placeName">
        <span class="pIndex">
            <xsl:apply-templates/>
        </span>
        <span class="pi-note">
            <xsl:value-of
                select="$pIndex//*[@xml:id = tokenize(current()/@ref, '#')]/note/p/string()"/>
        </span>
    </xsl:template>
    <xsl:template match="lb">
        <br id="n{count(preceding::lb) + 1}"/>
        <span class="line-number">
            <xsl:value-of select="count(preceding::lb) + 1"/>
            <xsl:text>. </xsl:text>
        </span>
    </xsl:template>

    <xsl:template match="body//div[@type = 'journal']" mode="toc">
        <li class="entryLink">
            <a href="#j{count(preceding::div[@type='journal']) + 1}">
                <xsl:apply-templates select="descendant::div[@type = 'headnote']/head[1]"/>
                <xsl:text>: </xsl:text>
                <xsl:apply-templates select="descendant::dateline"/>
            </a>
        </li>
    </xsl:template>


</xsl:stylesheet>
