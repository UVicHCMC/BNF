<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hcmc="http://hcmc.uvic.ca/ns"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="#all"
                expand-text="yes"
                default-mode="text"
                version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> March 3, 2026</xd:p>
      <xd:p><xd:b>Author:</xd:b> inokhrin</xd:p>
      <xd:p>Converts BNF paratext source files (HTML-like body content) into LEMDO TEI-XML.</xd:p>
    </xd:desc>
    <xd:param name="basedir">The project base directory.</xd:param>
  </xd:doc>

  <xsl:output method="xml" indent="yes"/>

  <xsl:param name="source-filename" as="xs:string"/>
  <xsl:param name="basedir" select="'..'" as="xs:string"/>

  <!-- Document identifier derived from the source filename. -->
  <xsl:variable name="docId" select="hcmc:paratext-doc-id($source-filename)" as="xs:string"/>

  <!-- Work code is everything before the first underscore in $docId. -->
  <xsl:variable name="workCode" select="substring-before($docId, '_')" as="xs:string"/>

  <xd:doc>
    <xd:desc>Build a LEMDO-style xml:id from a paratext source filename.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:paratext-doc-id" as="xs:string">
    <xsl:param name="filename" as="xs:string"/>
    <xsl:variable name="without-extension" select="replace($filename, '\.[^.]+$', '')"/>
    <xsl:sequence select="replace($without-extension, '-', '_')"/>
  </xsl:function>

  <xd:doc>
    <xd:desc>Default identity template for text mode.</xd:desc>
  </xd:doc>
  <xsl:template match="@* | node()" mode="text" priority="-0.5">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>

  <xd:doc>
    <xd:desc>Root template: wrap the source body in a TEI document and write it out.</xd:desc>
  </xd:doc>
  <xsl:template match="/">
    <xsl:result-document href="tei/{$workCode}/main/{$docId}.xml" method="xml" indent="yes">
      <TEI xml:id="{$docId}">
        <teiHeader>
          <fileDesc>
            <titleStmt>
              <title type="main"><xsl:value-of select="replace($docId, '_', ' ')"/></title>
            </titleStmt>
            <editionStmt>
              <p>Released with Digital Beaumont and Fletcher 2.0</p>
            </editionStmt>
            <publicationStmt>
              <publisher>University of Victoria on the Linked Early Modern Drama Online Platform</publisher>
              <availability>
                <p>Attribution 4.0 International (CC BY 4.0)</p>
              </availability>
            </publicationStmt>
            <seriesStmt>
              <p>Digital Beaumont and Fletcher</p>
            </seriesStmt>
            <sourceDesc>
              <p>Converted from BNF paratext source file <xsl:value-of select="$source-filename"/>.</p>
            </sourceDesc>
          </fileDesc>
          <profileDesc>
            <textClass>
              <catRef scheme="tax:emdDocumentHist" target="cat:edhSourceBNF"/>
              <catRef scheme="tax:emdDocumentTypes" target="cat:ldtPrimaryFacsimile"/>
            </textClass>
          </profileDesc>
          <encodingDesc>
            <p>Encoded in TEI P5 according to the LEMDO Customization and Encoding Guidelines.</p>
          </encodingDesc>
          <revisionDesc status="prgGenerated">
            <change who="pers:NOKH1" when="{format-date(current-date(), '[Y0001]-[M01]-[D01]')}">Converted from BNF paratext source</change>
          </revisionDesc>
        </teiHeader>
        <text>
          <xsl:apply-templates select="body" mode="text"/>
        </text>
      </TEI>
    </xsl:result-document>
  </xsl:template>

  <xd:doc>
    <xd:desc>Convert the source body. Each &lt;h2&gt; starts a new &lt;div type="section"&gt; with a &lt;head&gt;.</xd:desc>
  </xd:doc>
  <xsl:template match="body" mode="text">
    <body>
      <xsl:for-each-group select="*" group-starting-with="h2">
        <xsl:choose>
          <xsl:when test="self::h2">
            <xsl:variable name="section-num" select="count(preceding-sibling::h2) + 1" as="xs:integer"/>
            <div type="section" xml:id="{concat($docId, '_sec', $section-num)}">
              <head>
                <xsl:apply-templates select="node()" mode="text"/>
              </head>
              <xsl:apply-templates select="current-group() except ." mode="text"/>
            </div>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="current-group()" mode="text"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each-group>
    </body>
  </xsl:template>

  <xd:doc>
    <xd:desc>Source paragraphs become TEI paragraphs.</xd:desc>
  </xd:doc>
  <xsl:template match="p" mode="text">
    <p>
      <xsl:apply-templates mode="text"/>
    </p>
  </xsl:template>

  <xd:doc>
    <xd:desc>A paragraph that introduces a list is converted to a list with a head; the list items become the items of the outer list.</xd:desc>
  </xd:doc>
  <xsl:template match="p[ul]" mode="text" priority="0.6">
    <list type="bulleted">
      <head>
        <xsl:value-of select="normalize-space(string-join(node()[not(self::ul)], ''))"/>
      </head>
      <xsl:apply-templates select="ul/li" mode="text"/>
    </list>
  </xsl:template>

  <xd:doc>
    <xd:desc>HTML inline emphasis to LEMDO-style rendition.</xd:desc>
  </xd:doc>
  <xsl:template match="i" mode="text">
    <hi rendition="rnd:italic">
      <xsl:apply-templates mode="text"/>
    </hi>
  </xsl:template>

  <xsl:template match="b" mode="text">
    <hi rendition="rnd:bold">
      <xsl:apply-templates mode="text"/>
    </hi>
  </xsl:template>

  <xd:doc>
    <xd:desc>HTML links to TEI refs.</xd:desc>
  </xd:doc>
  <xsl:template match="a[@href]" mode="text">
    <ref target="{@href}">
      <xsl:apply-templates mode="text"/>
    </ref>
  </xsl:template>

  <xd:doc>
    <xd:desc>HTML lists to TEI lists.</xd:desc>
  </xd:doc>
  <xsl:template match="ul" mode="text">
    <list type="bulleted">
      <xsl:apply-templates mode="text"/>
    </list>
  </xsl:template>

  <xsl:template match="li" mode="text">
    <item>
      <xsl:apply-templates mode="text"/>
    </item>
  </xsl:template>

  <xd:doc>
    <xd:desc>HTML line breaks to TEI lb.</xd:desc>
  </xd:doc>
  <xsl:template match="br" mode="text">
    <lb/>
  </xsl:template>

  <xd:doc>
    <xd:desc>HTML images to TEI graphics.</xd:desc>
  </xd:doc>
  <xsl:template match="img[@src]" mode="text">
    <graphic url="{@src}"/>
  </xsl:template>

  <xd:doc>
    <xd:desc>Drop generic HTML spans; process their children.</xd:desc>
  </xd:doc>
  <xsl:template match="span" mode="text">
    <xsl:apply-templates mode="text"/>
  </xsl:template>

</xsl:stylesheet>

    


