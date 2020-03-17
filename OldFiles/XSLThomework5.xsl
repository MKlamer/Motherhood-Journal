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
    
    <xsl:variable name="dickinsonColl" select="collection('Dickinson/?select=*.xml')"/>
    <!-- Unsure at what points to include xsl:template rules to create the output and at which points to use them to walk down the tree. -->
    <xsl:template match="/">
        <html>
            <head><title>Emily Dickinson's Fascicle 16</title></head>
            <body>
                <h1>Emily Dickinson's Fascicle 16</h1>
                <h2>Table of Contents</h2>
                <ul>
                    <xsl:apply-templates select="$dickinsonColl//body" mode="toc"/>
                </ul>
                <hr/>
            <div id="main">
                <xsl:apply-templates select="$dickinsonColl//body"/>
            </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="body">
        <h2><xsl:apply-templates select="child::head/title"/></h2> 
          <xsl:apply-templates select="child::lg"/>
            
    </xsl:template>
    <xsl:template match="lg">
              <p>  <xsl:apply-templates select="l"/> </p>
          </xsl:template>  
    <xsl:template match="l">
        <span class="number"><xsl:value-of select="count(preceding::l) + 1"/></span>
        <xsl:text> </xsl:text>
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="$dickinsonColl//body/lg/l/app">
     <span class="{./rdg/@wit}">
        <xsl:apply-templates/><br/>
     </span>
    </xsl:template>
   
    <xsl:template match="body" mode="toc">
        <li>
            <xsl:apply-templates select="descendant::title"/>: 
            <xsl:apply-templates select="lg[1]/l[1]"/>
            
        </li>
    </xsl:template>
 
</xsl:stylesheet>