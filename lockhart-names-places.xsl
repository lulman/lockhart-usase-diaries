<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:kml="http://www.opengis.net/kml/2.2">
  <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Mar 6, 2010</xd:p>
      <xd:p><xd:b>Author:</xd:b> syd</xd:p>
      <xd:p/>
    </xd:desc>
  </xd:doc>
  
  <!-- This XSL file transforms the <place> children of a <listPlace> in a TEI P5 file into KML.    -->
  <!-- Revised 10 April 2010 by H. Lewis Ulman, with guidance from Syd Bauman and Patrick Rashleigh.-->
  <!-- TODO: Add folders for each voyage (may require change to XML source).                        -->
  
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" >
      <head>
        <title>Names, Places, Events, and Organizations Mentioned in Lucius C. Smith Diary</title>
        <style type="text/css">
          th {text-align:left;}
        </style>
      </head>
      <body>
        <h1>Personal Names</h1>
        <table>
        <tr><th>Person</th><th>Entry</th></tr>
        <xsl:for-each select="tei:TEI/tei:text/tei:body//tei:persName |
          tei:TEI/tei:text/tei:body//tei:rs">
          <xsl:sort select="lower-case(.)"></xsl:sort>
          <tr><td> <xsl:apply-templates/></td> <td><xsl:value-of select="ancestor::tei:div/@xml:id"/></td></tr>
        </xsl:for-each>
        </table>
        
        <h1>Place Names</h1>
        <table>
          <tr><th>Place</th><th>Entry</th></tr>
          <xsl:for-each select="tei:TEI/tei:text/tei:body//tei:placeName">
          <xsl:sort select="lower-case(.)"></xsl:sort>
          <tr><td><xsl:apply-templates/></td><td><xsl:value-of select="ancestor::tei:div/@xml:id"/></td></tr>
        </xsl:for-each>
        </table>
        
      <h1>Events</h1>
        <table>
          <tr><th>Event</th><th>Entry</th></tr>
          <xsl:for-each select="tei:TEI/tei:text/tei:body//tei:name[@type='event']">
        <xsl:sort select="lower-case(.)"></xsl:sort>
        <tr><td><xsl:apply-templates/></td><td><xsl:value-of select="ancestor::tei:div/@xml:id"/></td></tr>
      </xsl:for-each>
        </table>
        
        <h1>Organizations</h1>
        <table>
          <tr><th>Organization</th><th>Entry</th></tr>
          <xsl:for-each select="tei:TEI/tei:text/tei:body//tei:name[@type='organization']">
          <xsl:sort select="lower-case(.)"></xsl:sort>
          <tr><td><xsl:apply-templates/></td><td><xsl:value-of select="ancestor::tei:div/@xml:id"/></td></tr>
        </xsl:for-each>
        </table>
        
      </body>
    </html>
  </xsl:template>  
</xsl:stylesheet>
