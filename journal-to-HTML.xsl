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
                <div class="navigation"><!-- Navigational Header Begin --> 
                    <img class="header" width="1920" height="256" src="images/GDE-headerimage-nocircle.jpg" alt="The Elizabeth Gaskell Journal Header Image"/>     
                    <table class="navigation">
                        <tr>
                            <td><a href="index.html">Home</a></td>
                            <td><a href="gde-aboutpage.html">About</a> </td>
                            <td><a href="gde-editionpage.html">The Digital Edition</a> </td>
                            <td> <a href="gde-gaskellpage.html">People</a></td>
                            <td><a href="gde-digitaldissertationpage.html">The Digital Dissertation</a></td></tr></table></div>
                <!-- Navigational Header End -->
                <h2>Explore Gaskell’s Journal</h2>

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

                <ul>
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
        </div>
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
            <img class="page" id="page-{count(preceding::pb) + 1}" src="?????.jpg"
                alt="photo facsimile page {count(preceding::pb) + 1}"/>
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
            <xsl:text>Portion of page cut away. See headnote.</xsl:text>
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
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    <xsl:template match="supplied">
        <i>&#160;*Supplied by&#160;<xsl:value-of select="./@resp"/>&#160;:&#160;
            [<xsl:apply-templates/>]</i>
    </xsl:template>
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
    <xsl:template match="hi[@type = 'underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    <xsl:template match="hi[@type = 'supercript']">
        <span class="above">
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
        <li>
            <a href="#j{count(preceding::div[@type='journal']) + 1}">
                <xsl:apply-templates select="descendant::div[@type = 'headnote']/head[1]"/>
                <xsl:text>: </xsl:text>
                <xsl:apply-templates select="descendant::dateline"/>
            </a>
        </li>
    </xsl:template>


</xsl:stylesheet>
