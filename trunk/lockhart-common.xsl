<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jul 24, 2012</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p/>
      </xd:desc>
   </xd:doc>

   <!-- This style sheet is divided into the following sections:
      
      HTML WRAPPER
      MAJOR DOCUMENT STRUCTURES
      PAGE, COLUMN, AND LINE BREAKS
      
      
      MAJOR TEXTUAL STRUCTURES
      SORTING AND FORMATTING LISTS
      ANNOTATIONS
      MANUSCRIPT FEATURES
      MISCELLANEOUS TEXTUAL FEATURES
      IMAGES      
   -->
   <xsl:template match="/">
   <!-- HTML WRAPPER: Note that this template 
      places the entire contents enclosed within the text tags of your document into 
      the HTML of the Web page. 
   -->
      <html>
         <head>
            <!-- Creat the head of the HTML document -->
            <!-- First, populate meta element with keywords -->
            <xsl:element name="meta">
               <xsl:attribute name="name">keywords</xsl:attribute>
               <xsl:attribute name="content">
                  <xsl:for-each select="//tei:keywords[@scheme='#LCSH']/tei:term">
                     <xsl:choose>
                        <xsl:when test="current()=//tei:keywords[@scheme='#LCSH']/tei:term[1]">
                           <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </xsl:attribute>
            </xsl:element>
            <!-- Grab title from the fileDesc element of the TEI header. -->
            <title>
               <xsl:value-of
                  select="//TEI/teiHeader/fileDesc/titleStmt/title"/>
            </title>
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"/>
            <link href="lockhart.css" rel="stylesheet" type="text/css" />
            <script src="http://code.jquery.com/jquery-1.8.3.js"/>
            <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"/>
            <script>
               $(document).ready(function(){
               $("button").click(function(){
               $(".sic").toggleClass("sictoggle");
               $(".corr").toggleClass("corrtoggle");
               });
               });
            </script>
            <style type="text/css">
               <xsl:value-of select="$maintextRule"/>
               <xsl:value-of select="$navBarRule"/>
               <xsl:value-of select="$bodyRule"/>
               .ui-menu {
               width: 200px;
               }
            </style>
            <!--FONTS-->
            <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
            <link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet' type='text/css'/>
                   
         </head>
         
         <!-- Build the body of the HTML document, beginning with the masthead used in the
         project Web site. -->
         
         <body>
            <!-- Build the masthead and navigation links at the top of the page -->
            <div class="masthead">
               <div id="display1"> <img src="usase-lockhart-watermarked.png" height="120" title="Ernest Earl Lockhart"/> </div>
               <div id="display2"> <img src="usase-ice-shelf1.jpg" height="120" title="Antarctic Ice Shelf"/> </div>
               <div id="display3"> <img src="usase-bear-of-oakland-steam.jpg" height="120" title="U.S.S. Bear of Oakland"/> </div>
               <div id="display4"> <img src="usase-dogs2.jpg" height="120" title="USASE Dog Team"/> </div>
               <div id="display5"><img src="usase-ski-plane1.jpg" height="120" title="USASE Ski Plane"/> </div>
            </div>
            <div id="titleBar">
               <p align="center"><span class="projectTitle"><xsl:value-of
                  select="//TEI/teiHeader/fileDesc/titleStmt/title"/></span></p>
               <p align="center"><cite><strong>This edition is currently in progress. Please do
                  not cite this preview until this notice is removed.</strong></cite><br/><br/>
                     <button>Click to toggle between Smith's spelling and standardized spelling.</button></p>
               <hr/>
            </div>
            
            <div id="navBar">
               <ul id="menu">
                  <li><a href="./lockhart-edintro.html#introduction">Editorial Introduction</a>
                     <ul>
                        <li><a href="./lockhart-edintro.html#introduction">Introduction</a>
                           <ul>
                              <li><a href="./lockhart-edintro.html#family">Family Dynamics</a></li>
                              <li><a href="./lockhart-edintro.html#milling">Mill Operations</a></li>
                              <li><a href="./lockhart-edintro.html#sorghum">Sorghum Farming</a></li>
                              <li><a href="./lockhart-edintro.html#civilWar">Civil War and Civic Life</a></li>
                              <li><a href="./lockhart-edintro.html#borders">Borderlands/Hinterlands</a></li>
                           </ul>
                        </li>
                        <li><a href="./lockhart-edintro.html#source">The Source Document</a></li>
                        <li><a href="./lockhart-edintro.html#edition">The Electronic Edition</a></li>	
                        <li><a href="./lockhart-edintro.html#peopleMentioned">People Mentioned</a></li>
                        <li><a href="./lockhart-edintro.html#placesMentioned">Places Mentioned</a></li>
                        <li><a href="./lockhart-edintro.html#organizationsMentioned">Organizations Mentioned</a></li>
                        <li><a href="./lockhart-edintro.html#worksCited">Works Cited</a></li>
                        <li><a href="./lockhart-edintro.html#view">About the Introduction</a></li>
                     </ul>
                  </li>
                  
                  <li><a>Views of the Diary</a>
                     <ul>
                        <li><a href="./lockhart-entries.html">By Journal Entry</a></li>
                        <li><a href="./lockhart-mspages.html">By MS Page</a></li>
                        <li><a href="./lockhart-combined.html">Facsimile/Text</a></li>
                     </ul>
                  </li>
                  
                  <li><a href="default.cfm">About the Edition</a><ul>
                     <li><a href="./default.cfm">About the Edition</a></li>
                     <li><a href="./lockhart-markup.cfm">Markup Guidelines</a></li>
                     <li><a href="./lockhart-hands.cfm">Guide to Smith's Hand</a></li>
                     <li><a href="./lockhart-acknowledgements.cfm">Acknowledgements</a></li>
                     <li><a href="./lockhart-about-editors.cfm">About the Editors</a></li>
                     <li><a href="./lockhart-odd-rnc-xml-xsl.zip">Download Source Files</a></li>
                     <li><a href="./lockhart-zoomindex.cfm">Images of the MS Pages</a></li>
                     <li><a href="./lockhart-maps.cfm">Map</a></li>
                  </ul>
                  </li>
               </ul>
            </div>
            <script>
               $( "#menu" ).menu({ position: { my: "left top", at: "right-70 top+32" } });
            </script>
            
            <!-- Apply templates to the tei:body. -->
            <xsl:element name="div">
               <xsl:attribute name="id">maintext</xsl:attribute>
               <xsl:apply-templates select="/TEI/text/group/text[@xml:id='eel-journal2']"/>
               <br/>
               <hr/>
               <h2>Radiograms Inserted Inside Back Cover</h2>
               <hr/>
               <br/>
               <xsl:apply-templates select="/TEI/text/group/text[@xml:id='eel-journal2-radiograms']"/>
               <!-- Insert, count, encode by cardinal position, and link the explanatory annotations. -->
            <hr/>
            <h2>Explanatory Annotations</h2>
               <xsl:for-each select="/TEI/text/group//tei:note[@resp='ed']">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:body//tei:note[@resp='ed']" level="any"/>.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>
            
            <hr/>
            <a name="WorksCited"/>
            <h2>List of Works Cited</h2>
            <xsl:apply-templates
               select="/TEI/teiHeader/fileDesc/sourceDesc/listBibl"/>
            <hr/>
            <!-- Describe this view of the journal. -->
            <h2>About this View of the Journal</h2>
            <p><a name="view"/><xsl:value-of select="$aboutView"/></p>
            <hr/>
            <!-- Insert link to home page, creation date, and licensing statement.-->
            <p align="left">
               <a href="http://people.cohums.ohio-state.edu/ulman1/LCSmithDiaries/default.cfm"
                  target="_self">Home</a>
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates
                  select="/TEI/teiHeader/fileDesc/publicationStmt/date"/></emph>
            </p>
            <p align="center">
               <xsl:value-of
                  select="/TEI/teiHeader/fileDesc/publicationStmt/availability/p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
           </xsl:element>
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR DOCUMENT STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="tei:div[@type='Entry']">
         <div class="Entry">
            <xsl:element name="a"><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:element>
            <xsl:apply-templates/>
         </div>
   </xsl:template>
   
   <xsl:template match="tei:div[@type='Entry']/tei:dateline">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   
   <!-- The template for radiograms appears in stylesheets that call this stylesheet. -->   

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will be encoded, or whether they will be included, in your Web page. -->

   <xsl:template match="tei:ab/tei:persName">
      <br/><xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:addrLine">
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:div[@type='letter']/tei:head">
      <p><xsl:apply-templates/></p>
   </xsl:template>
      
   <!-- Template rule for editorial divs in back matter -->

   <xsl:template match="tei:div[@type='editorial']">
      <hr/>
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:div[@type='editorial']/tei:head">
      <h1>
         <xsl:apply-templates/>
      </h1>
   </xsl:template>

   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->

   <xsl:template match="//tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <a>
               <xsl:attribute name="name">
                  <xsl:value-of select="@xml:id"/>
               </xsl:attribute>
            </a>
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:note[@resp='ed']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:ref"><xsl:apply-templates/></xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   
   <xsl:template match="tei:title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   
   <xsl:template match="tei:listPlace">
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"
               /></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"
                  /></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
               <xsl:value-of select="tei:country"/>
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: <xsl:value-of
                  select="tei:location/tei:geo"/>)</xsl:if>. <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- ANNOTATIONS -->

   <xsl:template match="tei:TEI//tei:ptr[@type='noteAnchor']">
      <a>
         <xsl:attribute name="name">p<xsl:value-of select="@target"></xsl:value-of>
         </xsl:attribute>
         <xsl:attribute name="class">notePointer</xsl:attribute>
      </a>
      <a>
         <xsl:attribute name="href">#n<xsl:value-of select="@target"/></xsl:attribute>
         <xsl:attribute name="class">annotation</xsl:attribute>
         <xsl:attribute name="title"><xsl:value-of select="normalize-space(following::tei:note[1])"></xsl:value-of></xsl:attribute>
         <sup class="noteAnchor">
            <xsl:number level="any" count="tei:TEI//tei:ptr[@type='noteAnchor']"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   
   <xsl:template match="tei:note[@xml:id]"/>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <!-- Handshifts -->
<!--   <xsl:template match="tei:handShift"> [<xsl:value-of select="@new"/>] </xsl:template>-->
   <xsl:template match="tei:handShift"/>

   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
   <xsl:template match="tei:gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ] </xsl:template>
   <xsl:template match="tei:damage"> [<em>Damage: <xsl:value-of select="@agent"/> (<xsl:value-of
            select="@extent"/>
         <xsl:value-of select="@unit"/>)</em>] </xsl:template>

   <!-- Editorial emendations -->
   <xsl:template match="tei:supplied">[<xsl:apply-templates/>] </xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="tei:add">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Unclear passages. -->
   <xsl:template match="tei:unclear"> [<xsl:apply-templates/>?] </xsl:template>

   <!-- Nonstandard or erroneous text for which you have encoded a correct or regularized alternative. -->
   <xsl:template match="tei:choice/tei:orig">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:reg"/>
   <xsl:template match="tei:distinct[@type='babyTalk']">
      <xsl:apply-templates/> [sic] 
   </xsl:template>

   <!--MISCELLANEOUS TEXTUAL FEATURES. -->

   <!-- Quotes -->
   <xsl:template match="tei:q">
      <q>
      <xsl:apply-templates/>
      </q>
   </xsl:template>
   
   <xsl:template match="//tei:quote[@type='blockquote']">
      <p class="blockquote">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <!-- Choice Elements -->
   <xsl:template match="tei:choice/tei:abbr">
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:choice/tei:expan"/>
   
   <xsl:template match="tei:choice/tei:sic">
      <span class="sic"><xsl:apply-templates/>[sic]</span>
   </xsl:template>
   
   <xsl:template match="tei:choice/tei:corr">
      <span class="corr corrtoggle"><xsl:apply-templates/></span>
   </xsl:template>
   

   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="tei:foreign">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Names -->
   <xsl:template match="tei:rs">
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:note/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   
   <xsl:template match="tei:person/tei:name[@type='ship | aircraft']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Text highlighted in the source document -->

   <xsl:template match="tei:hi[@rend='underlined']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   
   <xsl:template match="tei:hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->

   <xsl:template match="tei:figure[@rend='link']"> [<a>
         <xsl:attribute name="href">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">_blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a>].
   </xsl:template>

</xsl:stylesheet>
