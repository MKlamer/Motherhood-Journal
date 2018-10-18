<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <TEI>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Gaskell Journal Project Personography Index</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Written in TEI by Melissa Klamer. First Edition in TEI 30 Jan, 2018.</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
                <text>
                <body>
                    <div type="HistPersons">
                        <listPerson sortKey="histPersons">
                            <xsl:for-each select="distinct-values(//text/body/div/p/persName/@ref)">
                                <person xml:id="{}"> <persName>
                                    <surname></surname>
                                    <surname></surname>
                                    <forename></forename>
                                </persName>
                                   <birth>
                                        <placeName></placeName>
                                    </birth>
                                    <death>
                                        <placeName></placeName>
                                    </death>
                                    <note type="bio" resp="#mjk">
                                        <p></p>
                                    </note>
                                </person>
    </xsl:for-each>
                            
                        </listPerson>
                    </div>
                </body></text></TEI>
    </xsl:template>
    <xsl:variable name="ident" select="distinct-values(//text/body/div/p/persName/@ref)"/>
    
             
        
            
   </xsl:stylesheet>