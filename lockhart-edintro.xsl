<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jul 24, 2012</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
   <xsl:variable name="bodyRule">
      body {
      font-family: 'Fanwood Text',georgia, serif;
      font-size: 1em;
      width: 1000px;
      margin-left: 50px;
      margin-right: 50px;
      }
   </xsl:variable>
   <xsl:variable name="navBarRule">
      #navBar {
      position:fixed;
      top:160px;
      float : left;
      width : 280px;
      text-align : left;
      left : 50px;
      margin-top:0px;
      height:600px;
      background-color: rgba(255, 255, 255, 1);
      z-index:2;
      }
   </xsl:variable>
   <xsl:variable name="maintextRule">
      #maintext {
      position:relative;
      top:30px;
      width:610px;
      margin-left:360px;
      padding:15px;
      background-color: rgba(209,209,209, 0.5);
      -webkit-border-radius: 10px;
      -moz-border-radius: 10 px;
      border-radius: 10px;	
      z-index:1;
      }
   </xsl:variable>
   
   <!-- 
   
   HTML WRAPPER: Note that this section (between the xsl:template tags) 
   places the entire contents enclosed within the TEI Header of your document into 
   the body element of the Web page. 
   
   -->
   <xsl:template match="/">
      <html>
         <head>
            <!-- Populate meta element with keywords -->
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
            <title>
               <xsl:value-of
                  select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            <!--
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"/>
            <script src="http://code.jquery.com/jquery-1.8.3.js"/>
            <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"/>
            -->
            <!-- Call to local files for jquery-ui -->
            <link rel="stylesheet" href="jquery-ui.css"/>
            <link href="./lockhart.css" rel="stylesheet" type="text/css" />
            <script src="jquery-1.8.3.js"/>
            <script src="jquery-ui.js"/>
            <script>
               function goBack()
               {
               window.history.back()
               }
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
         <body>
            <div class="masthead_background">
            <div class="masthead">
               <div class="display_left">
                  <img src="lockhart-usase.jpg" height="60"
                     title="Ernest Earl Lockhart, ca. 1939-41. Credit: Ernest Earl Lockhart Collection, Byrd Polar Research Center Archival Program, 
                     The Ohio State University, image #https://byrdpolarmedia.osu.edu/CFrx3P9NJ. Location: BPRCAP.2012.14; Box 1 folder 66"/>
               </div>
               <div class="display_addl"> <img src="usase-ice-shelf1.jpg" height="60" title="Antarctic Ice Shelf"/> </div>
               <div class="display_addl"> <img src="usase-bear-of-oakland-steam.jpg" height="60" title="U.S.S. Bear of Oakland"/> </div>
               <div class="display_addl"> <img src="usase-dogs2.jpg" height="60" title="USASE Dog Team"/> </div>
               <div class="display_addl"><img src="usase-ski-plane1.jpg" height="60" title="USASE Ski Plane"/> </div>
            </div>
            <div id="titleBar">
               <p align="center"><span class="projectTitle"><xsl:value-of
                  select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></span></p>              
               <hr/>
            </div>
            </div>
            <div id="navBar">
               <ul id="menu">
                  <li><a href="./lockhart-edintro.html#introduction">Editorial Introduction</a>
                     <ul>
                        <li><a href="./lockhart-edintro.html#introduction">Introduction</a>
                           <ul>
                              <li><a href="./lockhart-edintro.html#science">Scientific Research</a></li>
                              <li><a href="./lockhart-edintro.html#dogs">Dog Teams</a></li>
                              <li><a href="./lockhart-edintro.html#geopolitics">Geopolitics</a></li>
                              <li><a href="./lockhart-edintro.html#entertainment">Recreation</a></li>
                              <li><a href="./lockhart-edintro.html#equipment">Testing Equipment</a></li>
                              <li><a href="./lockhart-edintro.html#communications">Communications</a></li>
                           </ul>
                        </li>
                        <li><a href="./lockhart-edintro.html#project-description">About the Edition</a></li>
                        <li><a href="./lockhart-edintro.html#source">The Source Document</a></li>
                        <li><a href="./lockhart-edintro.html#edition">The Electronic Edition</a></li>	
                        <li><a href="./lockhart-edintro.html#ack">Acknowledgements</a></li>
                        <li><a href="./lockhart-edintro.html#editors">About the Editors</a></li>
                        <li><a href="./lockhart-edintro.html#worksCited">Works Cited</a></li>
                        <li><a href="./lockhart-edintro.html#view">About the Introduction</a></li>
                     </ul>
                  </li>
                  
                  <li><a><strong>Views of the Journal</strong></a>
                     <ul>
                        <li><a href="./lockhart-entries.html">By Journal Entry</a></li>
                        <li><a href="./lockhart-mspages.html">By MS Page</a></li>
                        <li><a href="./lockhart-combined.html">Facsimile/Text</a></li>
                     </ul>
                  </li>
                  
                  <li><a href="./lockhart-edintro.html#Appendices">Appendices</a><ul>
                     <li><a href="./lockhart-edintro.html#peopleMentioned">People Mentioned</a></li>
                     <li><a href="./lockhart-edintro.html#placesMentioned">Places Mentioned</a></li>
                     <li><a href="./lockhart-edintro.html#organizationsMentioned">Organizations Mentioned</a></li>
                     <li><a href="./lockhart-markup.html">Markup Guidelines</a></li>
                     <li><a href="./lockhart-hands.html">Guide to Lockhart's Hand</a></li>
                     <li><a>Source Files</a>
                        <ul>
                           <li><a href="./lockhart-journals-tei.xml">TEI P5 XML</a></li>
                           <li><a href="./lockhart-common.xsl">Common stylesheet</a></li>
                           <li><a href="./lockhart-entries.xsl">By-entry stylesheet</a></li>
                           <li><a href="./lockhart-mspages.xsl">By-ms page stylesheet</a></li>
                           <li><a href="./lockhart-combined.xsl">Facsimile/text stylesheet</a></li>
                           <li><a href="./lockhart-edintro.xsl">Editorial intro stylesheet</a></li>
                           <li><a href="./lockhart.css">CSS stylesheet</a></li>   
                           <li><a href="./lockhart-journals-teicustomization.odd">TEI ODD customization</a></li>
                           <li><a href="./lockhart-journals-teicustomization.rnc">RELAX NG schema</a></li>
                        </ul>
                     </li>
                     <li><a href="./lockhart-zoomIndex.html">Images of the MS Pages</a></li>
                     <li><a href="./lockhart-maps.html">Maps</a></li>
                  </ul>
                  </li>
               </ul>
            </div>
            <script>
               $( "#menu" )
               .menu({ icons:    {submenu: "ui-icon-arrowthick-1-se"     } }   )
               .menu({ position: { my: "left top", at: "right-70 top+32" } }   );
            </script>
            
   <xsl:element name="div">
   <xsl:attribute name="id">maintext</xsl:attribute>
   <!-- Order and apply templates for the sections of the header you wish to include. -->
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']"/>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:refsDecl"/>
            <hr/>
            <h2 id="worksCited">List of Works Cited</h2>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl"/>
            <hr/>
            <h2 id="Appendices">Appendices</h2>            
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson[@type='mentioned']"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:list[@type='dogs']"/>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/>
      <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:list[@type='vehicles']"/>
      <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listEvent"></xsl:apply-templates>
      <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson[@type='editors']"></xsl:apply-templates>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:revisionDesc"/>
            <hr/>
            <h2>About this Editorial Introduction</h2>
            <p><a name="view"/>Text on this page is derived from the
               edition's XML source document, lockhart-journals-tei.xml.</p>
            <hr/>
      <p>&#x2192; <a href="./lockhart-entries.html">Link to the text of the journal</a>.
            </p>
</xsl:element>
         </body>
      </html>
   </xsl:template>
   
   <!-- Format the introductory notes. -->
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']">
      <h2 id="introduction">Introduction</h2>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- Format information about your source document. -->
   <xsl:template
      match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']">
      <hr/>
      <h2 id="source">About the Source Documents</h2>
      <p><strong>Author</strong>: <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:author"/>
         <br/><strong>Title</strong>: "<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>" 
         <br/><strong>Extent</strong>: <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:extent"/>
         <br/><strong>Collection</strong>: <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:authority"/>
         <br/><strong>ID and Location</strong>: <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno"/>
      </p>
         <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:refsDecl">
      <h3>Encoding Conventions</h3>
      <xsl:apply-templates/>
      <p align="center">
         <xsl:value-of
            select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"
            disable-output-escaping="yes"/>
      </p>      
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability">
      <xsl:apply-templates/>
      <p>
         <em>
            <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>, <xsl:value-of
               select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>.
         </em>
      </p>
   </xsl:template>

   <!-- Format information about your electronic document. -->
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc">
      <h3 id="project-description">Project Description</h3>
         <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt">
      <hr/>
      <h2 id="edition">About the Electronic Edition</h2>
      <p><strong>Title</strong>: <xsl:value-of select="tei:title"/></p>
         <p><strong>Editors</strong>: <xsl:for-each select="tei:editor">
            <xsl:choose>
               <xsl:when test="current()=//tei:editor[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.</p>
      <xsl:for-each select="tei:respStmt">
         <p>
      <strong><xsl:value-of select="tei:resp"/></strong>
      <xsl:for-each select="tei:persName | tei:orgName">
            <xsl:choose>
               <xsl:when test="current()=//tei:respStmt/tei:persName[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:when test="current()=//tei:respStmt/tei:orgName[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl">
      <h3>Editorial Method</h3>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->
   
   <xsl:template match="tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25"><a>
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
            <xsl:apply-templates/></p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:note/tei:bibl">
      (<xsl:apply-templates/>)
   </xsl:template>
   
   <xsl:template match="tei:listPerson[@type='mentioned']">
      <h3 id="peopleMentioned">List of People Mentioned in Ernest Lockhart's Journal</h3>
      <xsl:for-each select="tei:person">
         <xsl:sort select="tei:persName[1]"/>
         <p>
            <xsl:element name="a"><xsl:attribute name="class">nameListing</xsl:attribute><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
            </xsl:element><strong><xsl:apply-templates select="tei:persName"/></strong>
         <xsl:if test="tei:birth">
            <xsl:text> (b. </xsl:text><xsl:value-of
               select="tei:birth/@when | tei:birth/@when-custom"/><xsl:if test="tei:death"> - d. <xsl:value-of
               select="tei:death/@when | tei:death/@when-custom"></xsl:value-of></xsl:if>)</xsl:if>.
            <xsl:apply-templates select="tei:note[@type='biographical']"/> <button onclick="goBack()">Go Back</button>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:listPerson[@type='editors']">
      <h3 id="editors">About the Editors</h3>
      <xsl:for-each select="tei:person">
         <xsl:sort select="tei:persName[1]"/>
         <p>
            <xsl:element name="a"><xsl:attribute name="class">nameListing</xsl:attribute><xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
            </xsl:element><strong><xsl:apply-templates select="tei:persName"/></strong>
            <xsl:if test="tei:birth">
               <xsl:text> (b. </xsl:text><xsl:value-of
                  select="tei:birth/@when | tei:birth/@when-custom"/><xsl:if test="tei:death"> - d. <xsl:value-of
                     select="tei:death/@when | tei:death/@when-custom"></xsl:value-of></xsl:if>)</xsl:if>.
            <xsl:apply-templates select="tei:note[@type='biographical']"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:addName[@type='nickname']">
      ("<xsl:apply-templates/>")
   </xsl:template>
   
   <xsl:template match="tei:listOrg">
      <h3 id="organizationsMentioned">List of Organizations Mentioned in Ernest Lockhart's Journal</h3>
      <xsl:for-each select="tei:org">
         <xsl:sort select="tei:orgName[1]"/>
         <p>
            <strong><xsl:value-of select="tei:orgName"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
      
   <xsl:template match="tei:listPlace">
      <h3 id="placesMentioned">List of Places Mentioned in Ernest Lockhart's Journal</h3>
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName[1]"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"/></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"/></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
            <xsl:value-of select="tei:country"/> 
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: 
               <xsl:value-of select="tei:location/tei:geo"/>)</xsl:if>. 
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <xsl:template match="tei:listEvent">
      <h3 id="OrganizationsMentioned">List of Notable Events Mentioned in Ernest Lockhart's Journal</h3>
      <xsl:for-each select="tei:event">
         <xsl:sort select="tei:event[1]/@when"/>
         <p>
            <strong><xsl:value-of select="tei:label"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:list[@type='vehicles']">
      <h3 id="VehiclesMentioned">List of Expedition Vehicles Mentioned in Ernest Lockhart's Journal</h3>
      <xsl:for-each select="tei:item">
         <xsl:sort select="tei:name[1]"/>
         <p>
            <strong><xsl:value-of select="tei:name[1]"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   
   <xsl:template match="tei:list[@type='dogs']">
      <h3 id="sled-dogs">List of Sled Dogs Mentioned in Ernest Lockhart's Journal</h3>
      <xsl:for-each select="tei:item">
         <xsl:sort select="tei:name[1]"/>
         <p>
            <strong><xsl:value-of select="tei:name"/></strong> 
            (<xsl:value-of select="tei:state[@type='age']"/>-year-old* <xsl:value-of select="tei:trait[@type='sex']"/>&#xA0;
            <xsl:value-of select="tei:trait[@type='breed']"/>): <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
      <p>* Age at date of purchase (26 Sept. 1939).</p>
   </xsl:template>   

   <!-- Format information about the revision history of your document. -->
   <xsl:template match="tei:TEI/tei:teiHeader/tei:revisionDesc">
         <hr/>
         <h2 id="revision">Revision History</h2>
      <table width="90%" cellpadding="5px">
         <tr>
            <td>
               <h3>Date</h3>
            </td>
            <td>
               <h3>Name</h3>
            </td>
            <td>
               <h3>Change</h3>
            </td>
         </tr>
         <xsl:for-each select="tei:change">
            <xsl:variable name="ID"><xsl:value-of select="@who"/></xsl:variable>
            <tr class="revTable" valign="top">
               <td nowrap="nowrap">
                  <xsl:value-of select="@when"/>
               </td>
               <td nowrap="nowrap">
                  <xsl:value-of select="//tei:listPerson[@type='editors']/tei:person[@xml:id=$ID]/tei:persName"></xsl:value-of>
               </td>
               <td>
                  <xsl:value-of select="text()"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <!-- Format miscellaneous elements -->
   <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>   
   <xsl:template match="tei:lb"><br/></xsl:template>
   <xsl:template match="tei:p[@rend='h3']">
      <xsl:element name="h3">
         <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="//tei:p[not(@xml:id='CreativeCommons') and not(@rend='h3')]">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:q[@rend='block']">
      <br/>
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:quote[@rend='blockquote']">
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:quote[@rend='epigraph']">
      <div class="epigraph">
         <xsl:apply-templates/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:name">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <i><xsl:apply-templates/></i>
   </xsl:template>
   <xsl:template match="tei:foreign">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='italics']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="tei:q">
      "<xsl:apply-templates/>"
   </xsl:template>
   <xsl:template match="//tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="//tei:desc/tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']"><cite><xsl:apply-templates/></cite></xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>   
   <xsl:template match="tei:date"/>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->
   <xsl:template match="tei:figure[@rend='link']"> 
      <a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a>
   </xsl:template>
   
   <xsl:template match="tei:figure[@rend='embed']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
               <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
            <xsl:attribute name="width">150</xsl:attribute>
         </img>
         <br/>
         <xsl:apply-templates select="tei:head"/>
         <xsl:if test="tei:media">
            <xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="tei:media/@url"/></xsl:attribute>
               <xsl:attribute name="target">_blank</xsl:attribute><xsl:element name="br"/>
               <xsl:value-of select="tei:media/tei:desc"/></xsl:element>
         </xsl:if>
      </div>
   </xsl:template> 
   
   <xsl:template match="//tei:media">
      <xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
         <xsl:attribute name="target">_blank</xsl:attribute>
         <xsl:value-of select="tei:desc"/></xsl:element>
   </xsl:template>
  
   <!-- Suppress some unused elements in the XML file. -->
   <xsl:template match="tei:text"/>
   <xsl:template match="tei:editor"/>
   <xsl:template match="tei:principal"/>
   <xsl:template match="tei:editionStmt"/>
   <xsl:template match="tei:extent"/>
   <xsl:template match="tei:encodingDesc"/>
   <xsl:template match="tei:profileDesc"/>
   <xsl:template match="tei:idno"/>
   <xsl:template match="tei:publisher"/>
   <xsl:template match="tei:pubPlace"/>
   <xsl:template match="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"/>
</xsl:stylesheet>
