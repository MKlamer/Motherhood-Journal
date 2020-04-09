<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
   
    <xsl:template match="/">
        <html>
            <head>
                <title>People</title>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" type="text/css" href="css/style-gaskelljournal.css"/>
               
            </head>
            <body>
                <div class="navigation"><!-- Navigational Header Begin --> 
                    <img class="header" width="1920" height="256" src="images/GDE-JournalHeaderRevised.jpg" alt="The Elizabeth Gaskell Journal Header Image"/>     
                    <table class="navigation">
                        <tr>
                            <td><a href="index.html">Home</a></td>
                            <td><a href="gde-aboutpage.html">About</a> </td>
                            <td><a href="gde-editionpage.html">The Digital Edition</a> </td>
                            <td> <a href="gde-gaskellpage.html">People</a></td>
                            <td><a href="gde-digitaldissertationpage.html">The Digital Dissertation</a></td></tr></table></div>
                <!-- Navigational Header End -->
                <h2>Key People in Gaskell’s Journal</h2>
                
               <h3>Individuals Referenced in the Journal:</h3>
                
                
                    <xsl:apply-templates select="descendant::body/div[@type='ReferencedPersons']"/>
                
               <h3>Other Important Individuals:</h3>
                
                  <xsl:apply-templates select="descendant::body/div[@type='NonReferencedHistoricalPersons']"/>
                
              </body>
        </html>
    </xsl:template>
    <xsl:template match="ListPerson">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="person">
        <div class="persRef" id="{@xml:id}"> <xsl:apply-templates select="persName"/>
        <xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="persName">
         
        <h4>
               <span class="forename"><xsl:apply-templates select="forename"/></span>
                <span class="givenName"><xsl:apply-templates select="surname[@type='given']"/></span>
                <xsl:if test="surname[@type='married']"/>
                <span class="marriedName"><xsl:apply-templates select="surname[@type='married']"/></span>
            </h4>
    </xsl:template>
    <xsl:template match="birth">
            <h4>Born <xsl:apply-templates select="date"/></h4>
    </xsl:template>
    <xsl:template match="death">
            <h4>Died <xsl:apply-templates select="date"/></h4>
    </xsl:template>
    <xsl:template match="note/p">
            <h4>Bio: </h4>
            <p>
                <xsl:apply-templates/>
            </p>
    </xsl:template>
     
</xsl:stylesheet>
