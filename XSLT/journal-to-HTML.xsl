<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
   <xsl:template match="/">
        <html>
            <head><title></title>
                <link rel="stylesheet" type="text/css" href="style-digitaleditionpage.css"/>
                <!--ebb: YOU'LL NEED TO DEVELOP A CSS STYLESHEET 
                    and the filepath in @href should point to where it is in relation to 
                    the output HTML where you're saving it. -->
            </head>
            <body>
                <hgroup>
                    <h1>Gaskell’s Journals</h1>
                    <h2>Table of Contents</h2>
                </hgroup>
                <ul>
                    <xsl:apply-templates select="descendant::body" mode="toc"/>
                </ul>
                <hr/>
            <div id="main">
                <xsl:apply-templates select="descendant::body/div[@type='journal' and descendant::div[@type='headnote']/head]"/>
            </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="div[@type='journal']">
        <section class="journal_full" id="j{count(preceding::div[@type='journal']) + 1}">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="div[@type='journal']/div[@type='headnote'][head]">
       <header class="headnote"> <h2><xsl:apply-templates select="head[1]"/></h2> 
      <h3><xsl:apply-templates select="dateline"/></h3>
        <!--We need to process the other following-sibling head elements here, and
        it will help to have attribute values on those in case you want to process them differently.-->
            <xsl:apply-templates select="head[position() gt 1]"/>
        <xsl:apply-templates select="p"/></header>
    </xsl:template>
    <xsl:template match="div[@type='journal']/div[@type='entry']">
        <section class="journal_sep">
            <article class="entry_txt">
                <xsl:apply-templates/>
            </article>
            <article class="entry_img"></article>
        </section>
    </xsl:template>
    <xsl:template match="head[position() gt 1]">
        <h4><xsl:apply-templates/></h4>
    </xsl:template>
   <xsl:template match="p">
       <p><xsl:apply-templates/></p>
   </xsl:template>
    <xsl:template match="pb">
        <br id="page{count(preceding::pb)}">
            <br/>Page <xsl:value-of select="count(preceding::pb)"></xsl:value-of><xsl:apply-templates/>
        </br>
    </xsl:template>
    <xsl:template match="space"><!-- Uses html non-breaking space characters to replicate Gaskell's long mid-paragraph breaks. -->
        <span class="longspace">&#160;&#160;&#160;&#160;
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="gap">
        <hr style="border-top: dotted 1px;"/><xsl:text>Portion of page cut away. See headnote.</xsl:text><hr style="border-top: dotted 1px;"/><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="note">
        <br/><i>Note: (Resp:<xsl:value-of select="@resp"/>)
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    <xsl:template match="del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    <xsl:template match="add"><!-- This needs to be changed - possibly using CSS? -  to align above the regular text line. I realized later that it isn't actually a superscript... Need to check in manuscript. -->
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    <xsl:template match="supplied">
        <i>&#160;*Supplied by&#160;<xsl:value-of select="./@resp"></xsl:value-of>&#160;:&#160;
        [<xsl:apply-templates/>]</i>
    </xsl:template>
    <xsl:template match="lg | l"> <!-- This and other elements (add, delete, etc. need to appear differently in a clear reading view and in an analytical view. The italics should only show up in the simple reading view. The scholarly view will include the note regarding where Gaskell was quoting from. -->
        <br/>
            <xsl:apply-templates/>
        <br/>
    </xsl:template>
    <!-- Have to checkc consistency of metamark encoding.
        <xsl:template match="metamark">
        </xsl:template> -->
    <xsl:template match="choice">
        <span class="choice">
            <span class="sic"><xsl:apply-templates select="sic"></xsl:apply-templates></span>
            <span class="reg"><xsl:apply-templates select="reg"></xsl:apply-templates></span> 
        </span>
    </xsl:template>
    <xsl:template match="quote | q">
        <q><xsl:apply-templates/></q>
    </xsl:template>
    <xsl:template match="hi[@type='underline']">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    <xsl:template match="hi[@type='supercript']">
        <span class="above">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="persName | placeName"><!-- This outputs the names (I think) in link colors only so far... It will need to also draw on the prosopography file to reproduce the biographical notes.  -->
        <a class="personography">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
   <xsl:template match="lb">
        <br id="n{count(preceding::lb) + 1}"/><span class="line-number"><xsl:value-of select="count(preceding::lb) + 1"/><xsl:text>. </xsl:text></span>
    </xsl:template>
    
    <xsl:template match="body//div[@type='journal']" mode="toc">
        <li><a href="#j{count(preceding::div[@type='journal']) + 1}"><xsl:apply-templates select="descendant::div[@type='headnote']/head[1]"/><xsl:text>: </xsl:text> 
            <xsl:apply-templates select="descendant::dateline"/></a>
        </li>
    </xsl:template>

 
</xsl:stylesheet>