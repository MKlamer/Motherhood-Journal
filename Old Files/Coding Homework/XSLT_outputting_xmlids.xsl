<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <head>
            <title>XSLT to Output Xml:ids for Gaskell Project</title></head>
        <body>
            <ol> <xsl:for-each select="distinct-values(//text/body/div/p/persName/@ref)">
                <li>
                    <xsl:value-of select="."/>
                </li>               
            </xsl:for-each></ol>
        </body>
    </xsl:template>
    </xsl:stylesheet>