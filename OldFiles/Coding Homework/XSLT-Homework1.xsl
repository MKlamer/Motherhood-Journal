<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="xml" encoding="utf-8"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="emph"> 
        <hi rend="italics"> 
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="head/l">
        <xsl:apply-templates/><lb/>
    </xsl:template>
    <xsl:template match="div[@type='book']">
        <div n="{count(preceding-sibling::div[@type='book']) + 1}" type="book">
            <xsl:apply-templates/>
        </div>            
    </xsl:template>
    <xsl:template match="div[@type='chapter']">
        <div n="{count(preceding-sibling::div) + 1}" type="chapter">
            <xsl:apply-templates/>
        </div>
        </xsl:template>    
</xsl:stylesheet>