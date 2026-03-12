<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hcmc="http://hcmc.uvic.ca/ns"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="#all"
                expand-text="yes"
                default-mode="text"
                version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> March 3, 2026</xd:p>
      <xd:p><xd:b>Author:</xd:b> inokhrin</xd:p>
      <xd:p>This converts the TEI files for old spelling text editions from BNF to TEI for LEMDO.</xd:p>
    </xd:desc>
    <xd:param name="basedir">The project base directory.</xd:param>
  </xd:doc>
  
  <xd:desc>
    <xd:doc>Loading data from LEMDO Ography files</xd:doc>
  </xd:desc>
  <xsl:variable name="pros" select="doc(concat($basedir, '/src/ographies/PROS1.xml'))"/>
  <xsl:variable name="pers" select="doc(concat($basedir, '/src/ographies/PERS1.xml'))"/>
  
  <xd:doc>
    <xd:desc>Importing our module for TEI functions</xd:desc>
  </xd:doc>
  <xsl:include href="module_tei_functions.xsl"/>
  
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="source-filename" as="xs:string"/>
  <xsl:param name="basedir" select="'..'" as="xs:string"/>
  <xsl:param name="source-dir" select="'src'" as="xs:string"/>
  <xsl:param name="source-files" select="collection(concat('file:///', $basedir, '/', $source-dir, '/?select=*.xml'))" as="document-node()*"/>
  <xsl:variable name="docId" select="hcmc:transform_BNF_filename($source-filename)"/>

  
  <xd:doc>
    <xd:desc>Map for transforming BNF filename into LEMDO xml:id </xd:desc>
  </xd:doc>
  <xsl:variable name="mapBNFtoLEMDO" as="map(xs:string, xs:string)">
    <xsl:map>
      <xsl:map-entry key="'TSC'" select="'SpCu'"/>
      <xsl:map-entry key="'TSV'" select="'SV'"/>
      <xsl:map-entry key="'awfam'" select="'WFAM'"/>
    </xsl:map>
  </xsl:variable>
  
  <xd:doc>
    <xd:desc>Function to transform the BNF source-filename into a LEMDO document xml:id. </xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:transform_BNF_filename" as="item()*">
    <xsl:param name="filename" as="xs:string"/>
    <xsl:variable name="baseName" select="substring-before($filename, '-')"/>
    <xsl:variable name="mappedBaseName" select="map:get($mapBNFtoLEMDO, $baseName)"/>
    <xsl:variable name="edType" select="if (contains($filename, 'Edited')) then 'M' else if (contains($filename, 'Base')) then 'F' else ''"/>
    <xsl:sequence select="concat('emd', $mappedBaseName, '_', $edType)"/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Default identity template for header and text mode: copies all elements and attributes not explicitly handled</xd:desc>
  </xd:doc>
  <xsl:template match="@* | node()" mode="header text" priority="-0.5">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <xd:desc>
    <xd:doc>There are some things to move around in the teiHeader. We need to move the respStmts from the seriesStmt to the titleStmt and give each resp a ref. 
      and we need to assign the title type="main" to all titles. We also need to move the castList from tei:front into the particDesc and convert it to LEMDO encoding</xd:doc>
  </xd:desc>
  <xsl:template match="tei:teiHeader" mode="header">
    <teiHeader>
      <fileDesc>
        <xsl:apply-templates select="tei:fileDesc" mode="header"/>
      </fileDesc>
      <profileDesc>
        <textClass>
          <xsl:if test="contains($source-filename, 'Edited')">
            <catRef scheme="tax:emdEditorialTreatments" target="cat:letModernized"/>
          </xsl:if>
          <xsl:if test="contains($source-filename, 'Base')">
            <catRef scheme="tax:emdBookFormats" target="cat:letSemiDiplomatic"/>
          </xsl:if>
          <catRef scheme="tax:emdBookFormats" target="cat:lbfFolio"/>
          <catRef scheme="tax:emdDocumentHist" target="cat:edhSourceBNF"/>
          <catRef scheme="tax:emdDocumentTypes" target="cat:ldtPrimaryFacsimile"/>
        </textClass>
      </profileDesc>
      <encodingDesc>
        <p/>
      </encodingDesc>
      <xenoData>
        <sourceDesc>
          <xsl:copy-of select="tei:fileDesc/tei:sourceDesc/tei:biblStruct"/>
        </sourceDesc>
      </xenoData>
      <revisionDesc status="prgGenerated">
        <change who="pers:NOKH1" when="{format-date(current-date(), '[Y0001]-[M01]-[D01]')}">Converted from BNF TEI to LEMDO TEI</change>
      </revisionDesc>
    </teiHeader>
  </xsl:template>
  
  
  <xsl:template match="tei:fileDesc" mode="header">
    <titleStmt>
      <xsl:apply-templates select="tei:titleStmt/tei:title" mode="header"/>
      <xsl:apply-templates select="tei:titleStmt/tei:author" mode="header"/>
      <!-- Just going to hardcode these names in for now. Can change to a lookup later if needed -->
      <respStmt>
        <resp ref="resp:edt_gen">Editor in Chief</resp>
        <persName ref="pers:BOUR10">Claire M. L. Bourne</persName>
      </respStmt>
      <respStmt>
        <resp ref="resp:rtm">Project Manager</resp>
        <persName ref="pers:FROE2">Heather Froehlich</persName>
      </respStmt>
      <respStmt>
        <resp ref="resp:edt_mrk">Encoding Consultant</resp>
        <persName ref="pers:RUSS5">John Russell</persName>
      </respStmt>
      <respStmt>
        <resp ref="resp:edt_mrk">Encoding Consultant</resp>
        <persName ref="pers:RUSS5">John Russell</persName>
      </respStmt>
      <respStmt ref="resp:edt_coord">
        <resp>Open Publishing Program Coordinator</resp>
        <persName>Ally Laird</persName>
      </respStmt>
      <respStmt>
        <resp ref="resp:prg">Open Access Systems Developer</resp>
        <persName ref="pers:GEAR1">Andrew Gearhart</persName>
      </respStmt>
      <respStmt>
        <resp ref="resp:ann">Annotator</resp>
        <persName xml:id="formerOwner">Former Owner - Author of Manuscript Annotations</persName>
      </respStmt>
      <!-- Special handling for graduate assistnats: we pull these from the seriesStmt in the original TEI file and move them here, and we also add a ref attribute to each one. -->
      <xsl:apply-templates select="tei:seriesStmt/tei:respStmt[tei:resp='Graduate Assistants:']" mode="header"/>
      
      <funder>
        <ref target="https://www.sshrc-crsh.gc.ca/">Social Sciences and Humanities Research Council of Canada</ref>
      </funder>  
    </titleStmt>
    <editionStmt>
      <p>Released with Digital Beaumont and Fletcher 2.0</p>
    </editionStmt>
    <publicationStmt>
      <publisher>University of Victoria on the Linked Early Modern Drama Online
        Platform</publisher>
      <availability>
        <p>Attribution 4.0 International (CC BY 4.0)</p>
      </availability>
    </publicationStmt>
    <xsl:apply-templates select="tei:sourceDesc" mode="header"/>
  </xsl:template>
  
  <xsl:template match="tei:titleStmt" mode="header">
    <xsl:apply-templates select="tei:title" mode="header"/>
    <xsl:apply-templates select="tei:respStmt" mode="header"/>
  </xsl:template>
  
  <xsl:template name="emit-author-respstmt">
    <xsl:param name="authorName" as="xs:string"/>
    <respStmt>
      <resp ref="resp:aut">Author</resp>        
      <persName>
        <xsl:variable name="matchedPerson" as="element(tei:person)?"
          select="($pros//tei:person[normalize-space(tei:persName/tei:reg) = normalize-space($authorName)])[1]"/>
        <xsl:if test="exists($matchedPerson)">
          <xsl:attribute name="ref">
            <xsl:value-of select="concat('pers:', $matchedPerson/@xml:id)"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$authorName"/>
      </persName>
    </respStmt>
  </xsl:template>
  
  <!-- Look up the author in the PROS file and if they are there, add a ref attribute with their xml:id -->
  <xsl:template match="tei:author" mode="header">
    <xsl:for-each select="tokenize(normalize-space(.), '\s+and\s+')">
      <xsl:call-template name="emit-author-respstmt">
        <xsl:with-param name="authorName" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>We supply our own publicationStmt</xd:desc>
  </xd:doc>
  <xsl:template match="tei:publicationStmt" mode="header">
    <publicationStmt>
      <publisher>University of Victoria on the Linked Early Modern Drama Online Platform</publisher>
      <availability>
        <p>Attribution 4.0 International (CC BY 4.0)</p>
      </availability>
    </publicationStmt>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for notesStmt: we copy as is</xd:desc>
  </xd:doc>
  <xsl:template match="tei:notesStmt" mode="header">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" mode="header"/>
    </xsl:copy>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for sourceDesc. We add a line about the conversion and copy the rest.</xd:desc>
  </xd:doc>
  <xsl:template match="tei:sourceDesc" mode="header">
    <xsl:copy>
      <p>This file was converted from Digital Beaumont and Fletcher’s TEI-XML</p>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="tei:title" mode="header">
    <title type="main">
      <xsl:apply-templates select="node()" mode="header"/>
    </title>
  </xsl:template>
  
  <xsl:template match="tei:seriesStmt/tei:respStmt[tei:resp='Graduate Assistants:']" mode="header">
    <xsl:for-each select="tei:name">
      <xsl:variable name="assistantName" as="xs:string" select="normalize-space(.)"/>
      <respStmt>
        <resp ref="resp:rtm_ra">Graduate Assistant</resp>
        <persName>
          <!-- If the person is in the PERS1 file, add a ref attribute with their xml:id -->
          <xsl:variable name="matchedPerson" as="element(tei:person)?"
            select="($pers//tei:person[normalize-space(tei:persName/tei:reg) = $assistantName])[1]"/>
          <xsl:if test="exists($matchedPerson)">
            <xsl:attribute name="ref">
              <xsl:value-of select="concat('pers:', $matchedPerson/@xml:id)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="$assistantName"/>
        </persName>
      </respStmt>
    </xsl:for-each>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Main template that matches the TEI root element</xd:desc>
  </xd:doc>
  <xsl:template match="/">
    <xsl:result-document href="tei/{$docId}.xml" method="xml" indent="yes">
      <TEI xml:id="{$docId}">
        <xsl:apply-templates select="tei:TEI/tei:teiHeader" mode="header"/>
        <xsl:apply-templates select="tei:TEI/tei:text" mode="text"/>
      </TEI>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template match="tei:text" mode="text">
    <text>
      <xsl:apply-templates mode="text"/>
    </text>
  </xsl:template>
  
  <!--We only have manuscript/marginal notes in base text files-->
  <xsl:template match="tei:note" mode="text">
    <note type="marginal">
        <xsl:apply-templates mode="text"/>
    </note>
  </xsl:template>
  
  <xsl:template match="tei:pb" mode="text">
    <!--Going to comment these out for now. We will have to figure out what to do with these/compute a new facs values later. Ignore the n attribute-->
    <xsl:comment>&lt;pb facs="<xsl:value-of select="@facs"/>"/&gt;</xsl:comment>
  </xsl:template>
  
  <xsl:template match="tei:front/tei:head" mode="header text">
    <head>
      <xsl:apply-templates mode="#current"/>
    </head>
  </xsl:template>
  
  <xsl:template match="tei:castGroup" mode="text">
    <castGroup>
      <xsl:apply-templates mode="text"/>
    </castGroup>
  </xsl:template>
  
  <xsl:template match="tei:castList" mode="text">
    <castList>
      <xsl:apply-templates mode="text"/>
    </castList>  
  </xsl:template>
  
  <xsl:template match="tei:castItem" mode="text">
    <castItem xml:id="{concat($docId, '_castItem_', tei:role/@xml:id)}">
      <xsl:apply-templates mode="text"/>
    </castItem>
  </xsl:template>
  
  <xsl:template match="tei:role" mode="text">
    <role>
      <xsl:apply-templates mode="text"/>
    </role>
  </xsl:template>
  
  <xsl:template match="tei:roleDesc" mode="text">
    <roleDesc>
      <xsl:apply-templates mode="text"/>
    </roleDesc>
  </xsl:template>
  
  <xsl:template match="tei:body" mode="text">
    <body>
      <xsl:apply-templates mode="text"/>
    </body>
  </xsl:template>
  
  <xsl:template match="tei:stage" mode="text">
    <stage>
      <xsl:choose>
        <xsl:when test="@type='enter'">
          <xsl:attribute name="type">entrance</xsl:attribute>
        </xsl:when>
        <xsl:when test="@type='bu&#383;ine&#383;s'">
          <xsl:attribute name="type">business</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="type" select="@type"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@place">
        <xsl:choose>
          <!--Special handling to change to Canadian/British spelling for centre-->
          <xsl:when test="@place='center'">
            <xsl:attribute name="place">plc-centre</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="place" select="concat('plc-', @place)"/>  
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <xsl:apply-templates mode="text"/>
    </stage>
  </xsl:template>
  
  <!--Transform xml:id for acts to LEMDO standard-->
  <xsl:template match="tei:div[@type='act']" mode="text">
    <div type="act" n="{@n}" xml:id="{concat($docId, '_a', @n)}">
      <xsl:apply-templates mode="text"/>
    </div>
  </xsl:template>
  
  <!--Transform xml:id for scenes to LEMDO standard-->
  <xsl:template match="tei:div[@type='scene']" mode="text">
    <div type="scene" n="{@n}">
      <xsl:variable name="sceneId" select="@xml:id"/>
      <xsl:variable name="actNum" as="xs:integer?"
        select="
          if (matches($sceneId, '^act\d+s\d+$')) 
            then xs:integer(replace($sceneId, '^act(\d+)s\d+$', '$1'))
          else if (matches($sceneId, '^[A-Za-z]+-act\d+s\d+$'))
            then xs:integer(replace($sceneId, '^[A-Za-z]+-act(\d+)s\d+$', '$1'))
          else ()
        "/>
      <xsl:attribute name="xml:id" select="concat($docId, '_a', $actNum, '_s', @n)"/>
      <xsl:apply-templates mode="text"/>
    </div>
  </xsl:template>  
  
  <xsl:template match="tei:sp" mode="text">
    <xsl:variable name="act" select="normalize-space(string(ancestor::tei:div[@type='act']/@n))"/>
    <xsl:variable name="scene" select="normalize-space(string(ancestor::tei:div[@type='scene']/@n))"/>
    <xsl:variable name="speech-number" select="
      if ($scene)
        then count(preceding::tei:sp[normalize-space(string(ancestor::tei:div[@type='scene']/@n)) = $scene and normalize-space(string(ancestor::tei:div[@type='act']/@n)) = $act]) + 1
      else if ($act)
        then count(preceding::tei:sp[normalize-space(string(ancestor::tei:div[@type='act']/@n)) = $act]) + 1  
      else count(preceding::tei:sp) + 1"/>
    <sp>
      <xsl:attribute name="xml:id">
        <xsl:choose>
          <xsl:when test="$act and $scene">
            <xsl:value-of select="concat($docId, '_a', $act, '_s', $scene, '_sp', $speech-number)"/>
          </xsl:when>
          <xsl:when test="$act and not($scene)">
            <xsl:value-of select="concat($docId, '_a', $act, '_sp', $speech-number)"/>
          </xsl:when>
          <xsl:when test="not($act) and $scene">
            <xsl:value-of select="concat($docId, '_s', $scene, '_sp', $speech-number)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($docId, '_sp', $speech-number)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates mode="text"/>
    </sp>
  </xsl:template>
  
  <xsl:template match="tei:hi" mode="#all">
    <xsl:choose>
      <xsl:when test="@rend='italics' or @rend='italic'">
        <hi>
          <xsl:attribute name="rendition">rnd:italic</xsl:attribute>
          <xsl:apply-templates mode="#current"/>
        </hi>
      </xsl:when>
      <xsl:when test="@rend='roman'">
        <hi>
          <xsl:attribute name="rendition">rnd:roman</xsl:attribute>
          <xsl:apply-templates mode="#current"/>
        </hi>
      </xsl:when>
      <xsl:when test="@rend='strikethrough'">
        <hi>
          <xsl:attribute name="rendition">rnd:strikethrough</xsl:attribute>
          <xsl:apply-templates mode="#current"/>
        </hi>
      </xsl:when>
      <xsl:when test="@rend='ornInit'">
        <hi>
          <xsl:attribute name="rendition">rnd:dropcap</xsl:attribute>
          <xsl:apply-templates mode="#current"/>
        </hi>
      </xsl:when>
      <!--Going to keep any other rend values as is so we can review them later -->
      <xsl:otherwise>
        <hi rend="{@rend}">
          <xsl:apply-templates mode="#current"/>
        </hi>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for speakers. We take the text note without trailing punctuation. We discard any attributes.</xd:desc>
  </xd:doc>
  <xd:doc>
    <xd:desc>Template for speakers. We take the text note without trailing punctuation. We discard any attributes.</xd:desc>
  </xd:doc>
  <xsl:template match="tei:speaker" mode="text">
    <speaker>
      <xsl:variable name="speakerText" as="xs:string"
        select="replace(normalize-space(string(.)), '\s*[:.]+\s*$', '')"/>
      <xsl:analyze-string select="$speakerText" regex="&#383;">
        <xsl:matching-substring>
          <g ref="g:longS">s</g>
        </xsl:matching-substring>
        <xsl:non-matching-substring>
          <xsl:value-of select="replace(., '''', '’')"/>
        </xsl:non-matching-substring>
      </xsl:analyze-string>
    </speaker>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template to transform lg elements to div with ab wrapper</xd:desc>
  </xd:doc>
  <xsl:template match="tei:lg" mode="text">
    <ab>
      <xsl:apply-templates mode="text"/>  
    </ab>
  </xsl:template>
  
  <xsl:template match="tei:l" mode="text">
    <xsl:if test="preceding-sibling::tei:l">
      <lb type="wln"/>
    </xsl:if>
    <xsl:apply-templates mode="text"/>
  </xsl:template>
  
  <xsl:template match="tei:head" mode="castGroup">
    <xsl:apply-templates mode="text"/>
  </xsl:template>
  
  <xsl:template match="tei:head[not(parent::tei:castGroup)]" mode="text">
    <lb type="wln"/>
    <label>
      <xsl:apply-templates mode="text"/>
    </label>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for replacing straight quotes with curly quotes in all text nodes. Just using a straight replace here rather than a wrap-quotes function because it seems that the quotes are all apostrophes</xd:desc>
  </xd:doc>
  <xsl:template match="text()" mode="header text" priority="2">
    <xsl:value-of select="replace(., '''', '’')"/>
  </xsl:template>

  <xd:doc>
    <xd:desc>Template for encoding &#383; with g tags as actual TEI elements</xd:desc>
  </xd:doc>
  <xsl:template match="text()[contains(., '&#383;')]" mode="header text" priority="3">
    <xsl:analyze-string select="." regex="&#383;">
      <xsl:matching-substring>
        <g ref="g:longS">s</g>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="replace(., '''', '’')"/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for roleName. We take the text node without the elements. Can change this in future depending on discussion with JJ.</xd:desc>
  </xd:doc>
  
  <xsl:template match="tei:roleName" mode="text">
    <xsl:apply-templates select="text()" mode="text"/>
  </xsl:template>  
  
  <!-- Template for supplied elements. Keep all attributes except for source -->
  <xsl:template match="tei:supplied" mode="text">
    <supplied>
      <xsl:copy-of select="@*[name() != 'source']"/>
      <xsl:apply-templates mode="text"/>
    </supplied>
  </xsl:template>
  
  
</xsl:stylesheet>