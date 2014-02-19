<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b>Jul 24, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Declare variables that will "localize" references to them in Stephens-Common.xsl -->
    
    <xsl:variable name="View">Diplomatic Transcription</xsl:variable>
    
    <xsl:variable name="aboutView">This diplomatic transcription of the Ernest E. Lockhart journal is
        organized by manuscript pages. Line breaks and page breaks reflect those in the letters;
        paragraph breaks are not reported. Spelling, punctuation, capitalization, and abbreviations
        are reported as they appear in the original letters. Text highlighted by correspondents with
        an underscore is underscored in this view. Recoverable cancellations are reported in red,
        strikethrough text. Interlinear additions are reported between arrows (↑ ↓) indicating the
        position of the addition; text added in the margins is reported between pipes (|). All
        material added by the editors is surrounded by square brackets: uncertain readings are
        followed by a question mark, apparent errors in the manuscript are indicated by "sic," and
        text supplied by the editors for clarity is set in italics. Gaps in the manuscript (e.g.,
        tears, unrecoverable cancellations) are noted by ellipses within square brackets. Links to
        explanatory notes are indicated by superscript colored numbers.</xsl:variable>

    <xsl:variable name="bodyRule">
        body {
        font-family: 'Fanwood Text',georgia, serif;
        font-size: 1em;
        width: 1000px;
        margin-left: 50px;
        margin-right: 50px;
        }
    </xsl:variable>
    <xsl:variable name="maintextRule">
        #maintext {
        position:relative;
        top:320px;
        width:610px;
        margin-left:350px;
        padding:5px;
        background-color: rgba(209,209,209, 0.5);
        -webkit-border-radius: 10px;
        -moz-border-radius: 10 px;
        border-radius: 10px;	
        }
    </xsl:variable>
    
    <xsl:variable name="navBarRule">
        #navBar {
        position:fixed;
        top:360px;
        float : left;
        width : 280px;
        text-align : left;
        left : 50px;
        margin-top:0px;
        height:600px;
        background-color: rgba(255, 255, 255, 1);
        z-index:1;
        }
    </xsl:variable>    
    
    <!-- Include common style sheet for Lockhart journal. -->
    
    <xsl:include href="lockhart-Common.xsl"/>
    
    <!-- Define templates required for the diplomatic view. -->
    
    <xsl:template match="tei:pb">
        <br/><br/><hr/>
        <span class="pagebreak">[Page&#xA0;-&#xA0;<xsl:number count="tei:pb" format="1" level="any"/>
            &#xA0;(<a><xsl:attribute
                name="href">http://people.cohums.ohio-state.edu/ulman1/lockhart-journals/lockhart-zoom.cfm?file=<xsl:value-of
                select="@n"/>.jpg</xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>click to open page image in a new window</a>)]</span>
        <br/>
    </xsl:template> 
    
    <xsl:template match="tei:div[@type='radiogram']">
        <br/>
        <span class="pagebreak"> [Radiogram&#xA0;-&#xA0;&#xA0; (<a><xsl:attribute
            name="href">http://people.cohums.ohio-state.edu/ulman1/lockhart-journals/lockhart-zoom.cfm?file=<xsl:value-of
                select="@n"/>.jpg</xsl:attribute><xsl:attribute name="target">top</xsl:attribute>click to open page image in a new window</a>)]<br/>
        </span>
        <xsl:apply-templates/>
        <br/>
        <hr/>
    </xsl:template>    
    
    
    <xsl:template match="tei:lb"><br/><a><xsl:attribute name="name"><xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/></xsl:attribute>
        </a><xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
    </xsl:template>
    
    <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:fw">
        <div class="pageNum">&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:add[@place='above']"> &#x2191; <xsl:apply-templates/> &#x2193; </xsl:template>
    <xsl:template match="tei:add[@place='below']"> &#x2193; <xsl:apply-templates/> &#x2191; </xsl:template>
    
    <!-- Highlight recoverable cancelations -->
    <xsl:template match="tei:del"><span class="cancel"><xsl:apply-templates/></span></xsl:template>
    
    <xsl:template match="tei:seg[@type='softhyphen']">
        <xsl:apply-templates/>
    </xsl:template>   
    
    <xsl:template match="tei:p"><xsl:apply-templates/></xsl:template>
    <xsl:template match="tei:figure[@rend='embed']"/>
    
    
</xsl:stylesheet>