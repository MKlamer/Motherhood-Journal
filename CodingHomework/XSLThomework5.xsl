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
    
    <xsl:variable name="dickinsonColl" select="collection('Dickinson/>?select=*.xml')"/>
    <!-- Unsure at what points to include xsl:template rules to create the output and at which points to use them to walk down the tree. -->
    <xsl:template match="/">
        <html>
        <head>
        <title>Poems in Dickinson Fascicle 16</title>
    </head> 
        <body>
            <xsl:apply-templates select="$dickinsonColl//body"/>
        </body>
     </html>
    </xsl:template>
    <xsl:template match="$dickinsonColl//body/head">
          <h2>
            <ol>
                <xsl:apply-templates select="body/head/title"/> 
            </ol>
          </h2>
    </xsl:template>
    <xsl:template match="$dickinsonColl//body/lg">
              <p>  <xsl:apply-templates select="body/lg/l"/> </p>
          </xsl:template>   
    <xsl:template match="$dickinsonColl//body/lg/l/app">
     <span class="{./rdg/@wit}">
        <xsl:apply-templates/><br/>
     </span>
    </xsl:template>
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
            </body>
            <div id="main">
                <xsl:apply-templates select="$dickinsonColl//body"/>
            </div>
        </html>
    </xsl:template>
    <xsl:template match="$dickinsonColl//body/head/title" mode="toc">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="$dickinsonColl//body/lg/l[1]" mode="toc">
        <li>
            <xsl:apply-templates></xsl:apply-templates>
        </li>
    </xsl:template>
 
</xsl:stylesheet>