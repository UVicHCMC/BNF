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
  
  <xd:doc>
    <xd:desc>Importing our module for TEI functions</xd:desc>
  </xd:doc>
  <xsl:include href="module_tei_functions.xsl"/>
  
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="source-filename" as="xs:string"/>
  <xsl:variable name="docId" select="hcmc:transform_BNF_filename($source-filename)"/>

  <xd:doc>
    <xd:desc>
      Workflow for converting tei:note elements to LEMDO-style anchors and annotations:
      1) Gather non-mansNote notes in text into $notesInText.
      2) Precompute one range record per note in $noteRanges (start/end anchor ids, resolved status, and insertion coordinates).
      3) During playtext emission, inject anchors from precomputed coordinates in text() nodes.
      4) If a note cannot be resolved (missing term, unmatched term, or missing insertion index), emit collapsed anchors at note position and warn via xsl:message and xsl:comment.
      5) Spin out a separate annotations file using the same anchor ids for target/targetEnd.
      6) Keep tei:note[@type='mansNote'] inline in play text as note[@type='marginal'].
    </xd:desc>
  </xd:doc>
  <xsl:variable name="notesInText" as="element(tei:note)*" select="/tei:TEI/tei:text//tei:note[not(@type='mansNote')]"/>

  <xd:doc>
    <xd:desc>
      Precomputed lookup table for note ranges.
      This prevents repeated expensive searching while processing each text node.
      Each tei:range record stores:
      - noteIndex and deterministic start/end anchor ids
      - resolved=true/false
      - reason code in @issue when unresolved
      - start/end text-node ids and insertion positions when resolved.
    </xd:desc>
  </xd:doc>
  <xsl:variable name="noteRanges" as="element(tei:range)*">
    <xsl:for-each select="$notesInText">
      <xsl:variable name="note" as="element(tei:note)" select="."/>
      <xsl:variable name="idx" as="xs:integer" select="hcmc:note-index($note)"/>
      <xsl:variable name="term" as="xs:string?" select="hcmc:note-term($note)"/>
      <!--
        Build the concatenated scope text once per note and derive all positions from it.
        This handles terms that span element boundaries (e.g. text split across a <seg>).
      -->
      <xsl:variable name="scopeTexts" as="text()*" select="hcmc:preceding-scope-text-nodes($note)"/>
      <xsl:variable name="concat" as="xs:string" select="string-join($scopeTexts ! string(.), '')"/>
      <xsl:variable name="startConcatPos" as="xs:integer?"
                    select="if ($term) then hcmc:concat-start-pos($note, $concat) else ()"/>
      <xsl:variable name="endConcatPos" as="xs:integer?"
                    select="if ($term) then hcmc:concat-end-pos($note, $concat) else ()"/>
      <xsl:variable name="startNode" as="text()?"
                    select="if (exists($startConcatPos)) then hcmc:text-node-at-concat-pos($scopeTexts, $startConcatPos) else ()"/>
      <xsl:variable name="endNode" as="text()?"
                    select="if (exists($endConcatPos)) then hcmc:text-node-at-concat-pos($scopeTexts, $endConcatPos) else ()"/>
      <xsl:variable name="startPos" as="xs:integer?"
                    select="if (exists($startConcatPos)) then hcmc:local-pos-in-concat($scopeTexts, $startConcatPos) else ()"/>
      <xsl:variable name="endPos" as="xs:integer?"
                    select="if (exists($endConcatPos)) then hcmc:local-pos-in-concat($scopeTexts, $endConcatPos) else ()"/>
      <xsl:variable name="resolved" as="xs:boolean" select="exists($term) and exists($startNode) and exists($endNode) and exists($startPos) and exists($endPos)"/>
      <xsl:variable name="issue" as="xs:string?"
                    select="
                      if (not($term)) then 'missing-term'
                      else if (not($startNode) or not($endNode)) then 'unmatched-term'
                      else if (not($startPos)) then 'missing-start-position'
                      else if (not($endPos)) then 'missing-end-position'
                      else ()
                    "/>

      <xsl:if test="not($term)">
        <xsl:message>[hcmc:note-anchor] WARNING noteIndex={$idx} type={$note/@type} has no term; using collapsed anchors at note location.</xsl:message>
      </xsl:if>
      <xsl:if test="exists($term) and (not($startNode) or not($endNode))">
        <xsl:message>[hcmc:note-anchor] WARNING noteIndex={$idx} type={$note/@type} term=&quot;{$term}&quot; could not be matched in preceding text; using collapsed anchors at note location.</xsl:message>
      </xsl:if>
      <xsl:if test="exists($term) and exists($startNode) and not($startPos)">
        <xsl:message>[hcmc:note-anchor] WARNING noteIndex={$idx} type={$note/@type} term=&quot;{$term}&quot; start anchor insertion point could not be computed; using collapsed anchors at note location.</xsl:message>
      </xsl:if>
      <xsl:if test="exists($term) and exists($endNode) and not($endPos)">
        <xsl:message>[hcmc:note-anchor] WARNING noteIndex={$idx} type={$note/@type} term=&quot;{$term}&quot; end anchor insertion point could not be computed; using collapsed anchors at note location.</xsl:message>
      </xsl:if>

      <range xmlns="http://www.tei-c.org/ns/1.0"
             noteIndex="{$idx}"
             startAnchor="{hcmc:start-anchor-id($note)}"
             endAnchor="{hcmc:end-anchor-id($note)}"
             resolved="{$resolved}"
              issue="{if ($issue) then $issue else ''}"
             startNodeId="{if ($startNode) then generate-id($startNode) else ''}"
             endNodeId="{if ($endNode) then generate-id($endNode) else ''}"
             startPos="{if ($resolved and $startPos) then $startPos else ''}"
             endPos="{if ($resolved and $endPos) then $endPos else ''}"/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:function name="hcmc:note-index" as="xs:integer">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:sequence select="count($note/preceding::tei:note[ancestor::tei:text]) + 1"/>
  </xsl:function>

  <xsl:function name="hcmc:start-anchor-id" as="xs:string">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:sequence select="concat($docId, '_anc_', (hcmc:note-index($note) * 2) - 1)"/>
  </xsl:function>

  <xsl:function name="hcmc:end-anchor-id" as="xs:string">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:sequence select="concat($docId, '_anc_', hcmc:note-index($note) * 2)"/>
  </xsl:function>

  <xsl:function name="hcmc:last-index-of" as="xs:integer?">
    <xsl:param name="haystack" as="xs:string"/>
    <xsl:param name="needle" as="xs:string"/>
    <xsl:param name="offset" as="xs:integer"/>
    <xsl:param name="last" as="xs:integer?"/>
    <xsl:choose>
      <xsl:when test="not($needle) or not(contains($haystack, $needle))">
        <xsl:sequence select="$last"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="idx" as="xs:integer" select="$offset + string-length(substring-before($haystack, $needle)) + 1"/>
        <xsl:sequence select="hcmc:last-index-of(substring($haystack, $idx + 1), $needle, $idx, $idx)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="hcmc:last-index-of" as="xs:integer?">
    <xsl:param name="haystack" as="xs:string"/>
    <xsl:param name="needle" as="xs:string"/>
    <xsl:sequence select="hcmc:last-index-of($haystack, $needle, 0, ())"/>
  </xsl:function>

  <xsl:function name="hcmc:escape-regex" as="xs:string">
    <xsl:param name="s" as="xs:string"/>
    <xsl:sequence select="replace($s, '([\\\[\](){}.^$|?*+\-])', '\\$1')"/>
  </xsl:function>

  <xsl:function name="hcmc:flex-pattern" as="xs:string?">
    <xsl:param name="s" as="xs:string?"/>
    <xsl:variable name="tokens" as="xs:string*" select="tokenize(lower-case(normalize-space($s)), '[\p{P}\s]+')[.]"/>
    <xsl:sequence select="if (exists($tokens)) then string-join($tokens!hcmc:escape-regex(.), '[\p{P}\s]+') else ()"/>
  </xsl:function>

  <xsl:function name="hcmc:last-flex-match" as="xs:string?">
    <xsl:param name="txt" as="xs:string"/>
    <xsl:param name="term" as="xs:string?"/>
    <xsl:variable name="pattern" as="xs:string?" select="hcmc:flex-pattern($term)"/>
    <xsl:sequence select="if ($pattern) then (analyze-string(lower-case($txt), $pattern)/fn:match/string())[last()] else ()"/>
  </xsl:function>

  <xsl:function name="hcmc:last-flex-start" as="xs:integer?">
    <xsl:param name="txt" as="xs:string"/>
    <xsl:param name="term" as="xs:string?"/>
    <xsl:variable name="match" as="xs:string?" select="hcmc:last-flex-match($txt, $term)"/>
    <xsl:sequence select="if ($match) then hcmc:last-index-of(lower-case($txt), $match) else ()"/>
  </xsl:function>

  <xsl:function name="hcmc:last-flex-end" as="xs:integer?">
    <xsl:param name="txt" as="xs:string"/>
    <xsl:param name="term" as="xs:string?"/>
    <xsl:variable name="match" as="xs:string?" select="hcmc:last-flex-match($txt, $term)"/>
    <xsl:variable name="start" as="xs:integer?" select="if ($match) then hcmc:last-index-of(lower-case($txt), $match) else ()"/>
    <xsl:sequence select="if ($start and $match) then $start + string-length($match) - 1 else ()"/>
  </xsl:function>

  <xsl:function name="hcmc:node-matches-term" as="xs:boolean">
    <xsl:param name="txt" as="xs:string"/>
    <xsl:param name="term" as="xs:string?"/>
    <xsl:sequence select="exists(hcmc:last-flex-start($txt, $term))"/>
  </xsl:function>

  <xsl:function name="hcmc:note-term" as="xs:string?">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:variable name="t" select="normalize-space(string($note/tei:term[1]))"/>
    <xsl:sequence select="if ($t) then $t else ()"/>
  </xsl:function>

  <xsl:function name="hcmc:auto-label-from-context" as="xs:string?">
    <xsl:param name="note" as="element(tei:note)"/>
    <!--
      Fallback label for notes with no tei:term:
      scan preceding text in the note scope and use the last non-empty
      token after trimming punctuation.
    -->
    <xsl:variable name="scopeText" as="xs:string"
      select="normalize-space(string-join(hcmc:preceding-scope-text-nodes($note) ! string(.), ' '))"/>
    <xsl:variable name="siblingText" as="xs:string"
      select="normalize-space(string-join($note/preceding-sibling::node() ! string(.), ' '))"/>
    <xsl:variable name="contextText" as="xs:string" select="if ($siblingText) then $siblingText else $scopeText"/>
    <xsl:variable name="tokens" as="xs:string*" select="if ($contextText) then tokenize($contextText, '\s+') else ()"/>
    <xsl:variable name="cleaned" as="xs:string*"
      select="
        for $tok in reverse($tokens)
        return replace($tok, '^[^\p{L}\p{N}''-]+|[^\p{L}\p{N}''-]+$', '')[matches(., '[\p{L}\p{N}]')]
      "/>
    <xsl:sequence select="$cleaned[1]"/>
  </xsl:function>

  <xsl:function name="hcmc:term-part-a" as="xs:string?">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:variable name="term" select="hcmc:note-term($note)"/>
    <xsl:sequence select="if ($term and contains($term, '...')) then normalize-space(tokenize($term, '\.\.\.')[1]) else ()"/>
  </xsl:function>

  <xsl:function name="hcmc:term-part-b" as="xs:string?">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:variable name="term" select="hcmc:note-term($note)"/>
    <xsl:sequence select="if ($term and contains($term, '...')) then normalize-space(tokenize($term, '\.\.\.')[last()]) else ()"/>
  </xsl:function>

  <xsl:function name="hcmc:note-scope" as="element()?">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:sequence select="$note/ancestor::tei:sp[1]"/>
  </xsl:function>

  <xsl:function name="hcmc:preceding-scope-text-nodes" as="text()*">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:variable name="scope" select="hcmc:note-scope($note)"/>
    <xsl:sequence select="$scope//text()[. &lt;&lt; $note]"/>
  </xsl:function>

  <!--
    Concat-based term matching helpers.

    Rather than checking each text node individually for the term, these functions
    concatenate all preceding scope text nodes into a single string and match
    against that. This correctly resolves terms that span element boundaries
    (e.g. "Oh, Monsieur" split across a plain text node and a <seg> child).

    Positions are then mapped back to the specific text node via
    hcmc:text-node-at-concat-pos / hcmc:local-pos-in-concat.
  -->

  <xsl:function name="hcmc:concat-start-pos" as="xs:integer?">
    <!--
      Returns the 1-based position in $concat where the start term begins.
      For ellipsis terms (A...B): finds the last B match, then the last A before it.
    -->
    <xsl:param name="note"   as="element(tei:note)"/>
    <xsl:param name="concat" as="xs:string"/>
    <xsl:variable name="term" as="xs:string?" select="hcmc:note-term($note)"/>
    <xsl:choose>
      <xsl:when test="not($term)">
        <xsl:sequence select="()"/>
      </xsl:when>
      <xsl:when test="contains($term, '...')">
        <xsl:variable name="partA" as="xs:string?" select="hcmc:term-part-a($note)"/>
        <xsl:variable name="partB" as="xs:string?" select="hcmc:term-part-b($note)"/>
        <xsl:variable name="bStart" as="xs:integer?" select="hcmc:last-flex-start($concat, $partB)"/>
        <xsl:sequence select="if (exists($bStart) and $bStart gt 1 and exists($partA))
                              then hcmc:last-flex-start(substring($concat, 1, $bStart - 1), $partA)
                              else ()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="hcmc:last-flex-start($concat, $term)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="hcmc:concat-end-pos" as="xs:integer?">
    <!--
      Returns the 1-based position in $concat where the end term finishes (last char).
    -->
    <xsl:param name="note"   as="element(tei:note)"/>
    <xsl:param name="concat" as="xs:string"/>
    <xsl:variable name="term" as="xs:string?" select="hcmc:note-term($note)"/>
    <xsl:choose>
      <xsl:when test="not($term)">
        <xsl:sequence select="()"/>
      </xsl:when>
      <xsl:when test="contains($term, '...')">
        <xsl:sequence select="hcmc:last-flex-end($concat, hcmc:term-part-b($note))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="hcmc:last-flex-end($concat, $term)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="hcmc:text-node-at-concat-pos" as="text()?">
    <!--
      Returns the text node in $texts whose span in the concatenated string
      includes 1-based position $pos.
    -->
    <xsl:param name="texts" as="text()*"/>
    <xsl:param name="pos"   as="xs:integer"/>
    <xsl:sequence select="hcmc:text-node-at-concat-pos-impl($texts, $pos, 0)"/>
  </xsl:function>

  <xsl:function name="hcmc:text-node-at-concat-pos-impl" as="text()?">
    <xsl:param name="texts"  as="text()*"/>
    <xsl:param name="pos"    as="xs:integer"/>
    <xsl:param name="cumLen" as="xs:integer"/>
    <xsl:choose>
      <xsl:when test="empty($texts)">
        <xsl:sequence select="()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="len" as="xs:integer" select="string-length(string($texts[1]))"/>
        <xsl:choose>
          <xsl:when test="$pos le $cumLen + $len">
            <xsl:sequence select="$texts[1]"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="hcmc:text-node-at-concat-pos-impl(subsequence($texts, 2), $pos, $cumLen + $len)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="hcmc:local-pos-in-concat" as="xs:integer?">
    <!--
      Returns the 1-based local offset within the text node that corresponds
      to $concatPos in the string formed by concatenating all $texts.
    -->
    <xsl:param name="texts"     as="text()*"/>
    <xsl:param name="concatPos" as="xs:integer"/>
    <xsl:sequence select="hcmc:local-pos-in-concat-impl($texts, $concatPos, 0)"/>
  </xsl:function>

  <xsl:function name="hcmc:local-pos-in-concat-impl" as="xs:integer?">
    <xsl:param name="texts"     as="text()*"/>
    <xsl:param name="concatPos" as="xs:integer"/>
    <xsl:param name="cumLen"    as="xs:integer"/>
    <xsl:choose>
      <xsl:when test="empty($texts)">
        <xsl:sequence select="()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="len" as="xs:integer" select="string-length(string($texts[1]))"/>
        <xsl:choose>
          <xsl:when test="$concatPos le $cumLen + $len">
            <xsl:sequence select="$concatPos - $cumLen"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="hcmc:local-pos-in-concat-impl(subsequence($texts, 2), $concatPos, $cumLen + $len)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="hcmc:note-has-resolved-range" as="xs:boolean">
    <xsl:param name="note" as="element(tei:note)"/>
    <xsl:sequence select="exists($noteRanges[@noteIndex = hcmc:note-index($note) and @resolved = 'true'])"/>
  </xsl:function>

  
  <xd:desc>
    <xd:doc>Loading data from LEMDO Ography files</xd:doc>
  </xd:desc>
  <xsl:variable name="pros" select="doc('../src/ographies/PROS1.xml')"/>
  <xsl:variable name="pers" select="doc('../src/ographies/PERS1.xml')"/>
  
  
  <xd:doc>
    <xd:desc>Main template that matches the TEI root element</xd:desc>
  </xd:doc>
  <xsl:template match="/">
    <TEI xml:id="{$docId}">
      <xsl:apply-templates select="tei:TEI/tei:teiHeader" mode="header"/>
      <xsl:apply-templates select="tei:TEI/tei:text" mode="text"/>
    </TEI>
    <xsl:call-template name="emit-annotation-document"/>
  </xsl:template>
  
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
    <xsl:variable name="edType" select="if (contains($filename, 'Edited')) then 'M' else if (contains($filename, 'BaseText')) then 'F' else ''"/>
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
        <particDesc>
          <!--Going to take the castList from the front (TSC/TSV format) or listPerson directly in text (emdSpCu_M format) -->
          <xsl:apply-templates select="/tei:TEI/tei:text/tei:front" mode="header"/>
        </particDesc>
        <textClass>
          <xsl:if test="contains($source-filename, 'Edited')">
            <catRef scheme="tax:emdEditorialTreatments" target="cat:letModernized"/>
          </xsl:if>
          <xsl:if test="contains($source-filename, 'BaseText')">
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
  
  <xsl:template match="tei:text" mode="text">
    <text>
      <xsl:apply-templates select="node()[not(self::tei:front)]" mode="text"/>
    </text>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for replacing straight quotes with curly quotes in all text nodes. Just using a straight replace here rather than a wrap-quotes function because it seems that the quotes are all apostrophes</xd:desc>
  </xd:doc>  
  <xsl:template match="text()" mode="header annotation" priority="2">
    <xsl:value-of select="replace(.,'''','’')"/>
  </xsl:template>
  
  <xsl:template match="tei:pb" mode="text">
    <!--Going to comment these out for now. We will have to figure out what to do with these/compute a new facs values later. Ignore the n attribute-->
      <xsl:comment>&lt;pb facs="<xsl:value-of select="@facs"/>"/&gt;</xsl:comment>
  </xsl:template>
  
  <xsl:template match="tei:front" mode="header">
    <xsl:apply-templates select="tei:head" mode="header"/>
    <xsl:apply-templates select="tei:castList" mode="header"/>
  </xsl:template>
  
  <xsl:template match="tei:head" mode="header">
    <!--Maybe change to label instead?-->
    <head>
      <xsl:apply-templates mode="text"/>
    </head>
  </xsl:template>
  
  <xsl:template match="tei:castList" mode="header">
    <listPerson type="castlist" xml:id="{concat($docId,'_castlist')}">
      <xsl:apply-templates select="tei:castGroup" mode="text"/>
      <xsl:apply-templates select="tei:castItem" mode="text"/>
    </listPerson>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for castGroup. Just apply templates to children</xd:desc>
  </xd:doc>
  <xsl:template match="tei:castGroup" mode="text">  
      <xsl:apply-templates mode="text"/>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for castItems. If there is already an xml:id, transform it.</xd:desc>
  </xd:doc>
  <xsl:template match="tei:castItem" mode="text"> 
    <person>
      <xsl:if test="tei:role/@xml:id">
        <xsl:attribute name="xml:id" select="concat($docId, '_', tei:role/@xml:id)"/>
      </xsl:if>
      <persName>
        <name>
          <xsl:choose>
          <xsl:when test="tei:roleDesc">
            <xsl:value-of select="concat(tei:role/text(), ', ', tei:roleDesc/text())"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="tei:role"/>
            </xsl:otherwise>
          </xsl:choose>
            </name>
        <reg><xsl:value-of select="tei:role/text()"/></reg>
      </persName>
    </person>
  </xsl:template>
  
  <xsl:template match="tei:body" mode="text">
    <body>
      <xsl:apply-templates mode="text"/>
    </body>
  </xsl:template>
  
  <!-- Template for supplied elements. Keep all attributes except for source -->
  <xsl:template match="tei:supplied" mode="text">
    <supplied>
      <xsl:copy-of select="@*[name() != 'source']"/>
      <xsl:apply-templates mode="text"/>
    </supplied>
  </xsl:template>
  
  <!--Mark a prologue as such. Do not keep the n attribute-->
  <xsl:template match="tei:div[@type='prologue']" mode="text">
    <div type="prologue">
      <xsl:apply-templates mode="text"/>
    </div>
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
    <xsl:variable name="spId" select="@who"/>
    <xsl:variable name="speech-number" select="
      if ($scene)
        then count(preceding::tei:sp[normalize-space(string(ancestor::tei:div[@type='scene']/@n)) = $scene and normalize-space(string(ancestor::tei:div[@type='act']/@n)) = $act]) + 1
      else count(preceding::tei:sp) + 1"/>
    <sp who="{concat('#',$docId, '_', substring-after($spId, '#'))}">
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

  <xsl:template match="text()" mode="text" priority="1">
    <!--
      Inserts anchor milestones directly into text nodes based on precomputed $noteRanges.
      End anchors are emitted before start anchors when they share the same position,
      which keeps overlapping ranges well-formed.
    -->
    <xsl:variable name="thisText" as="text()" select="."/>
    <xsl:variable name="thisId" as="xs:string" select="generate-id($thisText)"/>
    <xsl:variable name="starts" as="element(tei:range)*"
      select="$noteRanges[@resolved = 'true' and @startNodeId = $thisId]"/>
    <xsl:variable name="ends" as="element(tei:range)*"
      select="$noteRanges[@resolved = 'true' and @endNodeId = $thisId]"/>
    <xsl:choose>
      <xsl:when test="empty($starts) and empty($ends)">
        <xsl:value-of select="replace(.,'''','’')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="eventsRaw" as="element(tei:ev)*">
          <xsl:for-each select="$starts">
            <ev kind="start"
                id="{@startAnchor}"
                pos="{@startPos}"/>
          </xsl:for-each>
          <xsl:for-each select="$ends">
            <ev kind="end"
                id="{@endAnchor}"
                pos="{xs:integer(@endPos) + 1}"/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="events" as="element(tei:ev)*">
          <xsl:for-each select="$eventsRaw[@pos castable as xs:integer and xs:integer(@pos) ge 1]">
            <xsl:sort select="xs:integer(@pos)"/>
            <xsl:sort select="if (@kind = 'end') then 0 else 1"/>
            <xsl:sequence select="."/>
          </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="txt" as="xs:string" select="replace(string(.),'''','’')"/>
        <xsl:call-template name="emit-text-with-events">
          <xsl:with-param name="txt" select="$txt"/>
          <xsl:with-param name="events" select="$events"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="emit-text-with-events">
    <!--
      Recursive text slicer:
      emits plain text chunks and anchor milestones in sorted event order.
    -->
    <xsl:param name="txt" as="xs:string"/>
    <xsl:param name="events" as="element(tei:ev)*"/>
    <xsl:param name="cursor" as="xs:integer" select="1"/>
    <xsl:choose>
      <xsl:when test="empty($events)">
        <xsl:value-of select="substring($txt, $cursor)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="event" as="element(tei:ev)" select="$events[1]"/>
        <xsl:variable name="pos" as="xs:integer" select="min((string-length($txt) + 1, xs:integer($event/@pos)))"/>
        <xsl:value-of select="substring($txt, $cursor, $pos - $cursor)"/>
        <anchor xml:id="{$event/@id}"/>
        <xsl:call-template name="emit-text-with-events">
          <xsl:with-param name="txt" select="$txt"/>
          <xsl:with-param name="events" select="$events[position() gt 1]"/>
          <xsl:with-param name="cursor" select="$pos"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="tei:note" mode="text">
    <!--
      Notes with resolved ranges are removed from inline playtext and represented by anchors.
      Unresolved notes fall back to collapsed anchors at note location, with an inline warning comment.
    -->
    <xsl:if test="@type='mansNote'">
      <note type="marginal">
        <xsl:value-of select="replace(normalize-space(string-join(node()[not(self::tei:term)] ! string(.), ' ')), '^\s*:\s*', '')"/>
      </note>
    </xsl:if>
    <xsl:if test="@type!='mansNote'">
    <xsl:variable name="range" as="element(tei:range)?"
      select="$noteRanges[@noteIndex = hcmc:note-index(current())][1]"/>
    <xsl:variable name="termText" as="xs:string" select="normalize-space(string(tei:term[1]))"/>
    <xsl:choose>
      <xsl:when test="$range/@resolved = 'true'">
        <!-- handled through anchor insertion in preceding text nodes -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:comment>
          <xsl:choose>
            <xsl:when test="$range/@issue = 'missing-term'">WARNING: Missing term element in note. Inserted collapsed anchors.</xsl:when>
            <xsl:when test="$range/@issue = 'unmatched-term'">WARNING: Could not find insertion point for term text "{$termText}". Inserted collapsed anchors. Check input XML file to confirm that the term is spelled the same way in the term tag as it is in the play text.</xsl:when>
            <xsl:when test="$range/@issue = 'missing-start-position'">WARNING: Could not compute start insertion point for term text "{$termText}". Inserted collapsed anchors.</xsl:when>
            <xsl:when test="$range/@issue = 'missing-end-position'">WARNING: Could not compute end insertion point for term text "{$termText}". Inserted collapsed anchors.</xsl:when>
            <xsl:otherwise>WARNING: Could not resolve anchor insertion point for this note. Inserted collapsed anchors.</xsl:otherwise>
          </xsl:choose>
        </xsl:comment>
        <anchor xml:id="{$range/@startAnchor}"/>
        <anchor xml:id="{$range/@endAnchor}"/>
      </xsl:otherwise>
    </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="emit-annotation-document">
    <!--
      Emits a separate annotation document and links each note back to playtext anchor ranges.
    -->
    <xsl:result-document href="{concat($docId, '_annotation', '.xml')}" method="xml" indent="yes">
      <TEI xml:id="{concat($docId, '_annotation')}">
        <teiHeader>
          <fileDesc>
            <titleStmt>
              <title type="main">Annotations for {$docId}</title>
              <respStmt>
                <resp ref="resp:aut">Author</resp>
                <persName><xsl:comment>Insert ref attribute to persName and add author name here</xsl:comment></persName>
              </respStmt>
              <respStmt>
                <resp ref="resp:edt_gen">Editor in Chief</resp>
                <persName ref="pers:BOUR10">Claire M. L. Bourne</persName>
              </respStmt>
              <respStmt>
                <resp ref="resp:rtm">Project Manager</resp>
                <persName ref="pers:FROE2">Heather Froehlich</persName>
              </respStmt>
              <respStmt> 
                <resp ref="resp:rtm_ra">Graduate Research Assistant</resp> 
                <persName ref="pers:CENC1">Lauren M. Cenci</persName> 
              </respStmt> 
              <respStmt> 
                <resp ref="resp:edt_mrk">Remediation</resp> 
                <orgName ref="org:LEMD1">LEMDO Team</orgName> 
              </respStmt> 
              <respStmt> 
                <resp ref="resp:edt_mrk">Remediation</resp> 
                <persName ref="pers:JENS1">Janelle Jenstad</persName> 
              </respStmt> 
              <respStmt> 
                <resp ref="resp:prg">Conversion</resp> 
                <persName ref="pers:NOKH1">Illya Nokhrin (HCMC)</persName> 
              </respStmt> 
              <respStmt> 
                <resp ref="resp:edt_mrk">Original TEI Markup</resp> 
                <orgName ref="org:DBNF">Digital Beaumont and Fletcher</orgName> 
              </respStmt> 
              <sponsor ref="org:CWBJ1"/> 
              <funder><ref target="https://www.sshrc-crsh.gc.ca/">Social Sciences and Humanities Research Council of Canada</ref></funder> 
              <funder><ref target="https://www.cambridge.org/governance">Cambridge University Press Syndicate</ref> 
              </funder> 
            </titleStmt>
            <publicationStmt> 
              <publisher>University of Victoria on the Linked Early Modern Drama Online Platform</publisher> 
              <availability> 
                <licence from="2026-04-30" resp="pers:BUTL4" corresp="anth:cwbj"/> 
                <licence from="2026-04-30" resp="pers:BUTL4" corresp="anth:lemdo"/> 
                <p>Intellectual copyright in this edition is held by the surviving General Editor, <persName ref="pers:BUTL4">Martin Butler</persName>. Copyright on the TEI-XML markup is held by the <orgName ref="org:UVIC1">University of Victoria</orgName> on behalf of the <orgName ref="org:LEMD1">LEMDO Team</orgName>. The content and TEI-XML markup in this file are licensed under a <ref target="https://creativecommons.org/licenses/by-nc-nd/4.0/">CC BY-NC_ND 4.0 license</ref>. This file is freely downloadable without permission under the following conditions: (1) credit must be given to the editor, CEWBJO, and LEMDO in any subsequent use of the files and/or data; (2) this availability statement must remain in the file; (3) the content cannot be adapted or repurposed (except for quotations for the purposes of academic review and citation); and (4) commercial uses are not permitted without the knowledge and consent of the editor, CEWBJO, and LEMDO. Neither the content nor the code in this file is licensed for training large language models (LLMs), ingestion into an LLM, or any use in any artificial intelligence applications; such uses are considered to be commercial uses and are strictly prohibited.</p> 
              </availability> 
            </publicationStmt> 
            <seriesStmt>
              <p>Cambridge Edition of the Works of Ben Jonson Online</p>
            </seriesStmt>
            <notesStmt>
              <relatedItem target="{concat('doc:', $docId)}"/>
            </notesStmt>
            <sourceDesc>
              <p>Annotations extracted from CEWBJ’s TEI-XML</p>
            </sourceDesc>
          </fileDesc>
          <profileDesc>
            <textClass>
              <catRef scheme="tax:emdDocumentTypes" target="cat:ldtBornDigParatextAnnotation"/>
              <catRef scheme="tax:emdDocumentHist" target="cat:edhSourceCBJ"/>
            </textClass>
          </profileDesc>
          <encodingDesc>
            <p>Encoded in TEI P5 according to the LEMDO Customization and Encoding Guidelines.</p>
          </encodingDesc>
          <revisionDesc status="TEI_INP">
            <change who="pers:NOKH1" when="{format-date(current-date(), '[Y0001]-[M01]-[D01]')}" status="prgGenerated">Converted file from CEWBJO to LEMDO TEI</change>
          </revisionDesc>
        </teiHeader>
        <text>
          <body>
            <div type="annotations">
              <xsl:apply-templates select="$notesInText" mode="annotation"/>
            </div>
          </body>
        </text>
      </TEI>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="@* | node()" mode="annotation" priority="-0.5">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" mode="annotation"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="tei:term" mode="annotation"/>

  <xsl:template match="tei:note" mode="annotation">
    <!--
      Spinout format:
      - outer note points to playtext anchors via target/targetEnd
      - inner label note comes from tei:term
      - inner content note carries normalized body text (whitespace normalized, leading colon trimmed)
    -->
    <xsl:variable name="range" as="element(tei:range)?"
      select="$noteRanges[@noteIndex = hcmc:note-index(current())][1]"/>
    <xsl:variable name="labelText" as="xs:string?"
      select="if (tei:term) then hcmc:normalize-ellipsis(normalize-space(string(tei:term[1]))) else hcmc:auto-label-from-context(.)"/>
    <xsl:variable name="labelTextNode" as="text()">
      <xsl:value-of select="$labelText"/>
    </xsl:variable>
    <xsl:variable name="bodyNodesRaw" as="node()*">
      <xsl:apply-templates select="node()[not(self::tei:term)]" mode="annotation"/>
    </xsl:variable>
    <xsl:variable name="bodyNodesCollapsed" as="node()*">
      <xsl:for-each select="$bodyNodesRaw">
        <xsl:choose>
          <xsl:when test="self::text()">
            <xsl:value-of select="replace(., '\s+', ' ')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="bodyNodesPrefixTrimmed" as="node()*">
      <xsl:variable name="firstNonEmptyTextPos" as="xs:integer?"
        select="(for $p in 1 to count($bodyNodesCollapsed) return if ($bodyNodesCollapsed[$p] instance of text() and normalize-space(string($bodyNodesCollapsed[$p]))) then $p else ())[1]"/>
      <xsl:choose>
        <xsl:when test="exists($firstNonEmptyTextPos)">
          <xsl:for-each select="$bodyNodesCollapsed">
            <xsl:choose>
              <xsl:when test="position() = $firstNonEmptyTextPos and self::text()">
                <xsl:value-of
                  select="if (@type='gloss') then replace(string(.), '^[^:]*:\s*', '') else replace(string(.), '^\s*:\s*', '')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:sequence select="."/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$bodyNodesCollapsed"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="bodyNodes" as="node()*">
      <xsl:for-each select="$bodyNodesPrefixTrimmed">
        <xsl:choose>
          <xsl:when test="self::text() and position() = 1 and position() = last()">
            <xsl:value-of select="normalize-space(.)"/>
          </xsl:when>
          <xsl:when test="self::text() and position() = 1">
            <xsl:value-of select="replace(., '^\s+', '')"/>
          </xsl:when>
          <xsl:when test="self::text() and position() = last()">
            <xsl:value-of select="replace(., '\s+$', '')"/>
          </xsl:when>
          <xsl:when test="self::text() and not(normalize-space(.))">
            <!-- Drop whitespace-only text nodes after normalization. -->
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <note type="annotation"
          target="{concat('doc:', $docId, '#', $range/@startAnchor)}"
          targetEnd="{concat('doc:', $docId, '#', $range/@endAnchor)}">
      <xsl:if test="$labelText">
        <note type="label">
          <xsl:sequence select="hcmc:wrap-quotes($labelTextNode)"/>
        </note>
      </xsl:if>
      <xsl:choose>
        <!-- Convert mansNote to marginal note types-->
        <xsl:when test="@type='mansNote'">
          <note type="marginal">      
            <xsl:sequence select="hcmc:wrap-quotes($bodyNodes)"/>
          </note>
        </xsl:when>
        <xsl:when test="@type='annotation' or @type='context'">
          <note type="commentary">
            <xsl:sequence select="hcmc:wrap-quotes($bodyNodes)"/>
          </note>
        </xsl:when>
        <xsl:otherwise>
        <note type="{@type}">
          <xsl:sequence select="hcmc:wrap-quotes($bodyNodes)"/>
        </note>
        </xsl:otherwise>
      </xsl:choose>
    </note>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for ref elements. Converting these to @type="bibl" in anticipation of moving the works cited list to a bibliography file</xd:desc>
  </xd:doc>
  <xsl:template match="tei:ref" mode="annotation">
    <ref type="bibl">
      <xsl:attribute name="target"
        select="if (starts-with(normalize-space(@target), 'bibl:')) then normalize-space(@target) else concat('bibl:', normalize-space(@target))"/>
      <xsl:apply-templates mode="annotation"/>
    </ref>
  </xsl:template>
  
  <xsl:template match="tei:stage" mode="text">
    <stage>
      <xsl:choose>
      <xsl:when test="@type='enter'">
        <xsl:attribute name="type">entrance</xsl:attribute>
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
  <xsl:template match="tei:speaker" mode="text">
    <speaker>
      <xsl:value-of select="replace(normalize-space(string(.)), '\s*[:.]+\s*$', '')"/>
    </speaker>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for roleName and persName. We take the text node without the elements. Can change this in future depending on discussion with JJ.</xd:desc>
  </xd:doc>
  <xsl:template match="tei:persName" mode="text">
      <xsl:apply-templates select="text()" mode="text"/>
  </xsl:template>
  
  <xsl:template match="tei:roleName" mode="text">
      <xsl:apply-templates select="text()" mode="text"/>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Template for seg elements. Converts @ana tokens to nested seg[@type] elements — one
      per category token — so that multi-value @ana (e.g. ana="food object") produces valid
      single-token @type attributes on each layer. The @resp attribute is preserved on every
      layer.</xd:desc>
  </xd:doc>
  <xsl:template match="tei:seg" mode="text">
    <xsl:variable name="tokens" as="xs:string*"
      select="tokenize(normalize-space(@ana), '[\s#]+')[normalize-space(.)]"/>
    <xsl:call-template name="emit-seg-layers">
      <xsl:with-param name="tokens" select="$tokens"/>
      <xsl:with-param name="resp" select="string(@resp)"/>
    </xsl:call-template>
  </xsl:template>

  <xd:doc>
    <xd:desc>Recursive helper: wraps content in nested seg elements, one per token from @ana.
      When all tokens are consumed, emits the actual child content.</xd:desc>
  </xd:doc>
  <xsl:template name="emit-seg-layers">
    <xsl:param name="tokens" as="xs:string*"/>
    <xsl:param name="resp" as="xs:string"/>
    <xsl:choose>
      <xsl:when test="empty($tokens)">
        <xsl:apply-templates mode="text"/>
      </xsl:when>
      <xsl:otherwise>
        <seg type="{$tokens[1]}" resp="{$resp}">
          <xsl:call-template name="emit-seg-layers">
            <xsl:with-param name="tokens" select="$tokens[position() gt 1]"/>
            <xsl:with-param name="resp" select="$resp"/>
          </xsl:call-template>
        </seg>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!--- SUPPRESSION TEMPLATES -->
  
  <xsl:template match="tei:name" mode="text">
    <!-- Suppress name elements, just emit their text content. -->
    <xsl:apply-templates mode="text"/>
  </xsl:template>
  
</xsl:stylesheet>