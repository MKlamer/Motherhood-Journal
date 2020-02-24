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
                <link rel="stylesheet" type="text/css" href="??????.css"/>
                <!--ebb: YOU'LL NEED TO DEVELOP A CSS STYLESHEET 
                    and the filepath in @href should point to where it is in relation to 
                    the output HTML where you're saving it. -->
            </head>
            <body>
                <h1>Gaskell’s Journals</h1>
                <h2>Table of Contents</h2>
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
        <div id="j{count(preceding::div[@type='journal']) + 1}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="div[@type='journal']/div[@type='headnote'][head]">
       <div class="headnote"> <h2><xsl:apply-templates select="head[1]"/></h2> 
      <h3><xsl:apply-templates select="dateline"/></h3>
        <!--We need to process the other following-sibling head elements here, and
        it will help to have attribute values on those in case you want to process them differently.-->
            <xsl:apply-templates select="head[position() gt 1]"/>
        <xsl:apply-templates select="p"/></div>
    </xsl:template>
    <xsl:template match="div[@type='journal']/div[@type='entry']">
        <div class="entry"> 
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="head[position() gt 1]">
        <h4><xsl:apply-templates/></h4>
    </xsl:template>
   <xsl:template match="p">
       <p><xsl:apply-templates/></p>
   </xsl:template>
    <xsl:template match="choice">
        <span class="choice">
            <span class="sic"><xsl:apply-templates select="sic"></xsl:apply-templates></span>
            <span class="reg"><xsl:apply-templates select="reg"></xsl:apply-templates></span> 
        </span>
    </xsl:template>
    <xsl:template match="quote | q">
        <q><xsl:apply-templates/></q>
    </xsl:template>
    <xsl:template match="hi">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    <xsl:template match="lb">
        <br id="n{count(preceding::lb) + 1}"/><span class="line-number"><xsl:value-of select="count(preceding::lb) + 1"/><xsl:text>. </xsl:text></span>
    </xsl:template>
    
    <xsl:template match="body" mode="toc">
        <li>
           
            
        </li>
    </xsl:template>
 
</xsl:stylesheet>