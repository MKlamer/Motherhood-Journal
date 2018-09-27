<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>XSLT Homework #2</head>
            <body><ol><head></head>
                <xsl:apply-templates select="//body/div/listOrg"></xsl:apply-templates>
           </ol></body>
        </html>
    </xsl:template>
    <xsl:template match="listOrg">
        <li><head>
            <xsl:apply-templates select="/listOrg/head"></xsl:apply-templates>
        </head></li>
        <ul>
            <xsl:apply-templates select="head/org"></xsl:apply-templates>
        </ul>
    </xsl:template>
    <xsl:template match="org">
        <xsl:apply-templates select="org/orgName"></xsl:apply-templates>
        
    </xsl:template>
</xsl:stylesheet>