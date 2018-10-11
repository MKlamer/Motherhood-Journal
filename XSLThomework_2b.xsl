<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>XSLT Homework #2</title></head>
            <body><ol><xsl:apply-templates select="//text/body/div/listOrg"/></ol></body>
        </html>
    </xsl:template>
    <xsl:template match="listOrg">
        <li><xsl:apply-templates select="./head"/><ul><xsl:apply-templates select="./org"/></ul>
        </li>
    </xsl:template>
    <xsl:template match="org"><li><xsl:apply-templates select="./orgName"/></li></xsl:template>
   
</xsl:stylesheet>