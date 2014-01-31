<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!--
    This stylesheet produces a text-only version of a TEI XML file, preserving 
    linebreaks and indentations (as padded spaces).
    -->
    
    <!-- Set the output type to "text/plain." -->
    <xsl:output media-type="text/plain"></xsl:output>

    <!-- 
    Match the entire document, but apply templates only to the body.
    The header will not be included in the output.
    -->
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:text"/>
    </xsl:template>
    
    <!--
    In the case of <choice> elements, this template chooses the <reg> or <corr>
    content. Substituting <orig> or <sic> would select those elements.
    -->
    <xsl:template match="tei:choice">
        <xsl:value-of select="tei:reg | tei:corr"/>
    </xsl:template>
    
    <!-- Omit canceled text. -->
    <xsl:template match="tei:del"/>
    
</xsl:stylesheet>