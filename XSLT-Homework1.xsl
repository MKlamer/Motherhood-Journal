<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="xml" encoding="utf-8"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="emph"></xsl:template> 
        <hi> <xsl:apply-templates>
        </hi>
        </xsl:apply-templates>
    </xsl:stylesheet>