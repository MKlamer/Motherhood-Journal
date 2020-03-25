<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:variable name="IIIF-TSV" as="document-node()" select="doc('Gaskell-Diary-IIIF-Manifest-trimmed.xml')"/>
    
    <xsl:template match="pb">
        <pb xmlns="http://www.tei-c.org/ns/1.0" n='{@n}' xml:id="page-{@n}" facs="{$IIIF-TSV//img[substring-after(@alt, '-') = current()/@n]/@src}" source="Brotherton: {$IIIF-TSV//img[substring-after(@alt, '-') = current()/@n]}"/>
        
    </xsl:template>
    
</xsl:stylesheet>