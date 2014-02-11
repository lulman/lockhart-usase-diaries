<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd" version="1.0" >
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 8, 2011</xd:p>
            <xd:p><xd:b>Author:</xd:b> H. Lewis Ulman</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head/>
            <body>
                <xsl:element name="a"><xsl:attribute
                    name="href">#Place</xsl:attribute>Places</xsl:element>&#xA0;-&#xA0;
                <xsl:element name="a"><xsl:attribute name="href">#People</xsl:attribute>People</xsl:element>&#xA0;-&#xA0;
                <xsl:element name="a"><xsl:attribute name="href">#Ships</xsl:attribute>Ships</xsl:element>
                <hr/>
                <xsl:element name="a"><xsl:attribute name="name">Places</xsl:attribute></xsl:element>
                <h1>Places</h1>
                <xsl:for-each select="//tei:body//tei:div[@type='entry' or @type='radiogram']">
                        <xsl:element name="h2">
                            <xsl:value-of select="tei:dateline/tei:date/@when"/>
                        </xsl:element>
                    <ul>
                        <xsl:for-each select="descendant-or-self::tei:placeName |
                            descendant-or-self::tei:geogName">
                            <li>
                                    <xsl:apply-templates select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
                <hr/>
                <xsl:element name="a"><xsl:attribute name="name">People</xsl:attribute></xsl:element>
                <h1>People</h1>
                <xsl:for-each select="//tei:body//tei:div[@type='entry' or @type='radiogram']">
                        <xsl:element name="h2">
                            <xsl:value-of select="tei:dateline/tei:date/@when"/>
                        </xsl:element>
                    <ul>
                        <xsl:for-each select="descendant-or-self::tei:persName">
                            <li>
                                     <xsl:apply-templates select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
                <hr/>
                <xsl:element name="a"><xsl:attribute name="name">Ships</xsl:attribute></xsl:element>
                <h1>Ships</h1>
                <xsl:for-each select="//tei:body//tei:div[@type='entry' or @type='radiogram']">
                         <xsl:element name="h2">
                            <xsl:value-of select="tei:dateline/tei:date/@when"/>
                        </xsl:element>
                    <ul>
                        <xsl:for-each select="descendant-or-self::tei:name[@type='ship']">
                            <li>
                                    <xsl:apply-templates select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:sic"/>
    
    <xsl:template match="tei:corr">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:seg"/>
    
</xsl:stylesheet>
