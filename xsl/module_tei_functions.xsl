<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:hcmc="http://hcmc.uvic.ca/ns"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="#all"
                version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Sept 18, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> inokhrin</xd:p>
      <xd:p>These are functions to help convert TEI files for modern spelling text editions from CEWBJ to TEI for LEMDO.</xd:p>
    </xd:desc>
    <xd:param name="basedir">The project base directory.</xd:param>
  </xd:doc>
  
  <xsl:variable name="works" select="doc('../src/works1.xml')"/>
  <xd:doc>
    <xd:desc>Map that goes through the works1.xml file and creates a lookup from work title to xml:id</xd:desc>
  </xd:doc>
  <xsl:variable name="mapWorkTitleToXmlid" as="map(xs:string, xs:string)">
    <xsl:map>
      <xsl:for-each select="$works//bibl">
        <xsl:map-entry key="normalize-space(tei:title[@type='main'])" select="@xml:id"/>
      </xsl:for-each>
    </xsl:map>
  </xsl:variable>
  
  <xd:doc>
    <xd:desc>Map of title tokens to unique uppercase prefixes. 
      Conflicts use longer prefixes (e.g., barriers/bartholomew → BARRI/BARTH).
      Edition-specific keys (e.g., cynthia_q, cynthia_f1) handle variant editions of same work.</xd:desc>
  </xd:doc>
  <xsl:variable name="titlePrefixMap" as="map(xs:string, xs:string)">
    <xsl:map>
      <!-- Conflict resolutions - longer prefixes needed -->
      <xsl:map-entry key="'barriers'" select="'Brrs'"/>
      <xsl:map-entry key="'bartholomew'" select="'Bart'"/>
      <xsl:map-entry key="'beaumont'" select="'BEAUM'"/>
      <xsl:map-entry key="'beauty'" select="'MBea'"/>
      <xsl:map-entry key="'challenge'" select="'CTil'"/>
      <xsl:map-entry key="'chapman'" select="'CHAPM'"/>
      <xsl:map-entry key="'character'" select="'CHARA'"/>
      <xsl:map-entry key="'christening'" select="'ChBF'"/>
      <xsl:map-entry key="'christmas'" select="'CHM'"/>
      <xsl:map-entry key="'cynthia_q'" select="'CynRQ'"/>
      <xsl:map-entry key="'cynthia_f1'" select="'CynRF1'"/>
      <xsl:map-entry key="'emi_q'" select="'EMIQ'"/>
      <xsl:map-entry key="'emi_f1'" select="'EMIF1'"/>
      <xsl:map-entry key="'lovefreed'" select="'LFIF'"/>
      <xsl:map-entry key="'loversmm'" select="'LovR'"/>
      <xsl:map-entry key="'lovestriumph'" select="'Calli'"/>
      <xsl:map-entry key="'newinn'" select="'NInn'"/>
      <xsl:map-entry key="'newsnw'" select="'NNW'"/>
      <xsl:map-entry key="'odehh'" select="'ODEHH'"/>
      <xsl:map-entry key="'odehimself'" select="'ODEHI'"/>
      <xsl:map-entry key="'odeif'" select="'ODEIF'"/>
      <xsl:map-entry key="'odelm'" select="'ODELM'"/>
      <!-- Standard 3-char prefixes (non-conflicting titles) -->
      <xsl:map-entry key="'acrostic'" select="'ACR'"/>
      <xsl:map-entry key="'adventurers'" select="'ADV'"/>
      <xsl:map-entry key="'alchemist'" select="'Alch'"/>
      <xsl:map-entry key="'althorp'" select="'ALT'"/>
      <xsl:map-entry key="'artofpoetry'" select="'ART'"/>
      <xsl:map-entry key="'augurs'" select="'MAug'"/>
      <xsl:map-entry key="'blackness'" select="'MBla'"/>
      <xsl:map-entry key="'bolsover'" select="'EBol'"/>
      <xsl:map-entry key="'breton'" select="'BRE'"/>
      <xsl:map-entry key="'brome'" select="'BRO'"/>
      <xsl:map-entry key="'brooke'" select="'BROOK'"/>
      <xsl:map-entry key="'browne'" select="'BROWN'"/>
      <xsl:map-entry key="'burse'" select="'EBB'"/>
      <xsl:map-entry key="'case'" select="'Case'"/>
      <xsl:map-entry key="'catiline'" select="'Cat'"/>
      <xsl:map-entry key="'cavendish'" select="'CAV'"/>
      <xsl:map-entry key="'censure'" select="'CEN'"/>
      <xsl:map-entry key="'certain'" select="'CER'"/>
      <xsl:map-entry key="'chloridia'" select="'Chlo'"/>
      <xsl:map-entry key="'crookback'" select="'CRO'"/>
      <xsl:map-entry key="'detractor'" select="'DET'"/>
      <xsl:map-entry key="'devil'" select="'DevA'"/>
      <xsl:map-entry key="'discoveries'" select="'DIS'"/>
      <xsl:map-entry key="'distichs'" select="'DIST'"/>
      <xsl:map-entry key="'dogs'" select="'DOG'"/>
      <xsl:map-entry key="'dover'" select="'DOV'"/>
      <xsl:map-entry key="'drayton'" select="'DRA'"/>
      <xsl:map-entry key="'eastward'" select="'EHo'"/>
      <xsl:map-entry key="'emo'" select="'EMO'"/>
      <xsl:map-entry key="'epicene'" select="'Epic'"/>
      <xsl:map-entry key="'epigrams'" select="'EPIG'"/>
      <xsl:map-entry key="'expostulation'" select="'EXP'"/>
      <xsl:map-entry key="'farnabyj'" select="'FARNJ'"/>
      <xsl:map-entry key="'farnabyp'" select="'FARNP'"/>
      <xsl:map-entry key="'farnabys'" select="'FARNS'"/>
      <xsl:map-entry key="'filmer'" select="'FIL'"/>
      <xsl:map-entry key="'fletcher'" select="'FLE'"/>
      <xsl:map-entry key="'foliotp'" select="'FOL'"/>
      <xsl:map-entry key="'forest'" select="'FOR'"/>
      <xsl:map-entry key="'fortunate'" select="'FITU'"/>
      <xsl:map-entry key="'gil'" select="'GIL'"/>
      <xsl:map-entry key="'golden'" select="'GAR'"/>
      <xsl:map-entry key="'grace'" select="'GRA'"/>
      <xsl:map-entry key="'grammar'" select="'GRAM'"/>
      <xsl:map-entry key="'gypsies'" select="'GypM'"/>
      <xsl:map-entry key="'haddington'" select="'HCC'"/>
      <xsl:map-entry key="'highgate'" select="'HIG'"/>
      <xsl:map-entry key="'hot'" select="'HOT'"/>
      <xsl:map-entry key="'husband'" select="'HUS'"/>
      <xsl:map-entry key="'hymenaei'" select="'Hymn'"/>
      <xsl:map-entry key="'informations'" select="'INF'"/>
      <xsl:map-entry key="'irish'" select="'Irsh'"/>
      <xsl:map-entry key="'janeogle'" select="'JANEO'"/>
      <xsl:map-entry key="'journeyanswer'" select="'JOU'"/>
      <xsl:map-entry key="'katherineogle'" select="'KATH'"/>
      <xsl:map-entry key="'kings'" select="'KIN'"/>
      <xsl:map-entry key="'leges'" select="'LEG'"/>
      <xsl:map-entry key="'lordmayor'" select="'LOR'"/>
      <xsl:map-entry key="'lostplays'" select="'LOS'"/>
      <xsl:map-entry key="'lucan'" select="'LUC'"/>
      <xsl:map-entry key="'mabbe'" select="'MAB'"/>
      <xsl:map-entry key="'magnetic'" select="'MagL'"/>
      <xsl:map-entry key="'martial'" select="'MART'"/>
      <xsl:map-entry key="'may'" select="'MAY'"/>
      <xsl:map-entry key="'maylord'" select="'MAYL'"/>
      <xsl:map-entry key="'merchant'" select="'MER'"/>
      <xsl:map-entry key="'mercury'" select="'MVin'"/>
      <xsl:map-entry key="'moon'" select="'MOO'"/>
      <xsl:map-entry key="'mortimer'" select="'MHF'"/>
      <xsl:map-entry key="'nashe'" select="'NAS'"/>
      <xsl:map-entry key="'neptune'" select="'NepT'"/>
      <xsl:map-entry key="'oberon'" select="'MOb'"/>
      <xsl:map-entry key="'owls'" select="'MOwl'"/>
      <xsl:map-entry key="'palmer'" select="'PAL'"/>
      <xsl:map-entry key="'panegyre'" select="'PAN'"/>
      <xsl:map-entry key="'pansann'" select="'PanA'"/>
      <xsl:map-entry key="'parnassus'" select="'PAR'"/>
      <xsl:map-entry key="'phoenix'" select="'PHO'"/>
      <xsl:map-entry key="'pleasure'" select="'PRV'"/>
      <xsl:map-entry key="'plymouth'" select="'PLY'"/>
      <xsl:map-entry key="'poetaster'" select="'Poet'"/>
      <xsl:map-entry key="'queens'" select="'MQns'"/>
      <xsl:map-entry key="'restored'" select="'LovR'"/>
      <xsl:map-entry key="'robert'" select="'ROB'"/>
      <xsl:map-entry key="'royalentry'" select="'ROY'"/>
      <xsl:map-entry key="'rutter'" select="'RUT'"/>
      <xsl:map-entry key="'sadshep'" select="'SadS'"/>
      <xsl:map-entry key="'salisbury'" select="'SAL'"/>
      <xsl:map-entry key="'sejanus'" select="'Sej'"/>
      <xsl:map-entry key="'shakesbeloved'" select="'SHAKB'"/>
      <xsl:map-entry key="'shakesreader'" select="'SHAKR'"/>
      <xsl:map-entry key="'sirinigo'" select="'SIR'"/>
      <xsl:map-entry key="'somerset'" select="'SOM'"/>
      <xsl:map-entry key="'staple'" select="'Stap'"/>
      <xsl:map-entry key="'stephens'" select="'STE'"/>
      <xsl:map-entry key="'sutcliffe'" select="'SUT'"/>
      <xsl:map-entry key="'theobalds'" select="'ETbd'"/>
      <xsl:map-entry key="'tilting'" select="'Tilt'"/>
      <xsl:map-entry key="'time'" select="'TVin'"/>
      <xsl:map-entry key="'toinigo'" select="'TOI'"/>
      <xsl:map-entry key="'tub'" select="'TTub'"/>
      <xsl:map-entry key="'twokings'" select="'TWO'"/>
      <xsl:map-entry key="'underwood'" select="'UND'"/>
      <xsl:map-entry key="'vision'" select="'VoD'"/>
      <xsl:map-entry key="'volpone'" select="'Volp'"/>
      <xsl:map-entry key="'wales'" select="'HWal'"/>
      <xsl:map-entry key="'welbeck'" select="'Welb'"/>
      <xsl:map-entry key="'welcome'" select="'WELC'"/>
      <xsl:map-entry key="'wright'" select="'WRI'"/>
    </xsl:map>
  </xsl:variable>
  
  <xd:doc>
    <xd:desc>Function to generate XML IDs based on filename patterns for modern spelling texts.
      Uses $titlePrefixMap for unique prefixes; falls back to 3-char uppercase with warning if not found.</xd:desc>
  </xd:doc> 
  <xsl:function name="hcmc:gen-xmlid" as="xs:string">
    <xsl:param name="curr_filename" as="xs:string"/>
    <!-- Tokenize filename -->
    <xsl:variable name="token_filename" select="tokenize($curr_filename, '_')"/>
    <xsl:variable name="title_token" select="$token_filename[2]"/>
    
    <!-- Detect edition type for compound keys -->
    <xsl:variable name="has_f" select="contains($curr_filename, '_f')"/>
    <xsl:variable name="has_q" select="contains($curr_filename, '_q')"/>
    <xsl:variable name="f_match" select="replace($curr_filename, '.*_f([0-9]*)_.*', '$1')"/>
    <xsl:variable name="q_match" select="replace($curr_filename, '.*_q([0-9]*)_.*', '$1')"/>
    
    <!-- Build lookup key: try compound key first (e.g., cynthia_f1), then simple title -->
    <xsl:variable name="compound_key" select="
      if ($has_f and $f_match != $curr_filename and $f_match != '') 
        then concat($title_token, '_f', $f_match)
      else if ($has_q and $q_match != $curr_filename and $q_match != '') 
        then concat($title_token, '_q', $q_match)
      else if ($has_f) 
        then concat($title_token, '_f1')
      else if ($has_q) 
        then concat($title_token, '_q')
      else ''
    "/>
    
    <!-- Look up in map: try compound key first, then simple title -->
    <xsl:variable name="base_name" select="
      if ($compound_key != '' and map:contains($titlePrefixMap, $compound_key))
        then map:get($titlePrefixMap, $compound_key)
      else if (map:contains($titlePrefixMap, $title_token))
        then map:get($titlePrefixMap, $title_token)
      else (
        (: Fallback with warning :)
        upper-case(substring($title_token, 1, 3))
      )
    "/>
    
    <!-- Emit warning if not found in map -->
    <xsl:if test="not(map:contains($titlePrefixMap, $compound_key)) and not(map:contains($titlePrefixMap, $title_token))">
      <xsl:message>WARNING: Title '<xsl:value-of select="$title_token"/>' not found in titlePrefixMap. Using 3-char fallback: <xsl:value-of select="upper-case(substring($title_token, 1, 3))"/></xsl:message>
    </xsl:if>
    
    <!-- Detect modern spelling -->
    <xsl:variable name="has_msp" select="contains($curr_filename, 'msp')"/>
    
    <!-- Build suffix -->
    <xsl:variable name="suffix"
      select="
        if ($has_f)
          then concat('_F', if ($f_match != $curr_filename and $f_match != '') then $f_match else '')
        else if ($has_q)
          then concat('_Q', if ($q_match != $curr_filename and $q_match != '') then $q_match else '')
        else ''
      "/>
    <xsl:variable name="msp_suffix" select="if ($has_msp) then '_M' else ''"/>
    <xsl:variable name="new_suffix" select="concat($suffix, $msp_suffix)"/>
    <xsl:variable name="new_name" select="concat('emd', $base_name, $new_suffix)"/>
    <xsl:sequence select="$new_name"/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Function to extract the work prefix from a docId (e.g., 'emdVOL_M' → 'VOL').
      Used for directory naming in output paths.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:get-work-prefix" as="xs:string">
    <xsl:param name="docId" as="xs:string"/>
    <!-- Remove 'emd' prefix and any suffix (_M, _F1, _Q1, etc.) -->
    <xsl:variable name="without_prefix" select="substring-after($docId, 'emd')"/>
    <xsl:variable name="prefix" select="replace($without_prefix, '_[MFQ].*$', '')"/>
    <xsl:sequence select="$prefix"/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Function to replace three dots (. . .) with ellipsis (…) in a given string.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:normalize-ellipsis" as="xs:string">
    <xsl:param name="text" as="xs:string"/>
    <!-- Step 1: Replace non-breaking spaces with regular spaces -->
    <xsl:variable name="normalized" select="replace($text, '&#160;', ' ')"/>
    <!-- Step 2: Replace all . . . patterns (with any whitespace between dots) with ellipsis -->
    <xsl:sequence select="replace($normalized, '\.\s*\.\s*\.', '…')"/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Function to transform corresp attribute values, adding doc: prefix and the appropriate filename based on the corresp value</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:transform-corresp" as="xs:string">
    <xsl:param name="corresp-value" as="xs:string"/>
    
    <!-- Get the base filename without the suffix -->
    <xsl:variable name="base-xmlid" select="hcmc:gen-xmlid($source-filename)"/>
    <!-- Remove any existing suffix (_M, _F1, _Q1, etc.) to get just emdABC -->
    <xsl:variable name="base-name" select="replace($base-xmlid, '_[MFQ].*$', '')"/>
    
    <!-- Split the corresp value by spaces to handle multiple references -->
    <xsl:variable name="tokens" select="tokenize(normalize-space($corresp-value), '\s+')"/>
    
    <!-- Transform each token -->
    <xsl:variable name="transformed-tokens" as="xs:string*">
      <xsl:for-each select="$tokens">
        <xsl:variable name="token" select="."/>
        <xsl:choose>
          <!-- Values starting with 'f' should point to _F1 -->
          <xsl:when test="starts-with($token, 'f')">
            <xsl:value-of select="concat('doc:', $base-name, '_F1#', $base-name, '_F1_', $token)"/>
          </xsl:when>
          <!-- Values starting with 'q' should point to _Q -->
          <xsl:when test="starts-with($token, 'q')">
            <xsl:value-of select="concat('doc:', $base-name, '_Q#', $base-name, '_Q_', $token)"/>
          </xsl:when>
          <!-- Values starting with 'c' should point to _M -->
          <xsl:when test="starts-with($token, 'c')">
            <xsl:value-of select="concat('doc:', $base-name, '_M#', $base-name, '_M_', $token)"/>
          </xsl:when>
          <!-- Default case - keep as is but add doc: prefix -->
          <xsl:otherwise>
            <xsl:value-of select="concat('doc:', $base-name, '_M#', $base-name, '_M_', $token)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    
    <!-- Join the transformed tokens back with spaces -->
    <xsl:sequence select="string-join($transformed-tokens, ' ')"/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Function to parse collation note content into TEI elements. Now uses two-phase approach internally.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:parse-collation-note" as="element()*">
    <xsl:param name="p-element" as="element()"/>
    <xsl:sequence select="hcmc:parse-collation-note-v2($p-element)"/>
  </xsl:function>
 
  <!-- Helper function to filter out "subst." from witness lists -->
  <xsl:function name="hcmc:filter-subst" as="xs:string">
    <xsl:param name="witnesses" as="xs:string"/>
    
    <!-- Remove "subst." and related patterns -->
    <xsl:variable name="step1" select="replace($witnesses, '\s+subst\.', '', 'i')"/>
    <xsl:variable name="step2" select="replace($step1, 'subst\.\s*,?\s*', '', 'i')"/>
    <xsl:variable name="step3" select="replace($step2, ',\s*subst\.', '', 'i')"/>
    <xsl:variable name="cleaned" select="normalize-space($step3)"/>
    
    <!-- Remove trailing comma if present -->
    <xsl:variable name="final" select="replace($cleaned, ',\s*$', '')"/>
    
    <xsl:sequence select="$final"/>
  </xsl:function>
  
  <!-- ============================================================================
       TWO-PHASE COLLATION NOTE PARSING
       Phase 1: Structural pre-processing (presentation → intermediate markup)
       Phase 2: Semantic conversion (intermediate → final TEI app structure)
       ============================================================================ -->
  
  <xd:doc>
    <xd:desc>Known witness sigils for validation. Add more as needed.</xd:desc>
  </xd:doc>
  <!--May have to add more known sigils later. 
       There is a longer list on: 
       https://universitypublishingonline.org/cambridge/benjonson/about/abbrs_sigla_citations/ -->
  <xsl:variable name="known-witness-sigils" as="xs:string+" 
    select="('Q', 'Q1', 'Q2', 'Q3', 'F', 'F1', 'F2', 'F3', 'G', 'Wh', 'MS', 'O', 'D')"/>
  
  <xd:doc>
    <xd:desc>Function to check if a string looks like a witness sigil.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:is-witness-sigil" as="xs:boolean">
    <xsl:param name="text" as="xs:string"/>
    <xsl:variable name="normalized" select="normalize-space($text)"/>
    <xsl:sequence select="
      $normalized = $known-witness-sigils or 
      (string-length($normalized) le 4 and 
        matches($normalized, '^[A-Z][A-Za-z0-9]*$') and
        not(matches($normalized, '^(The|And|But|For|No|Not|SD|This|That|With)$', 'i')))
                    "/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Function to check if a collation note is complex and needs manual review.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:is-complex-note" as="xs:boolean">
    <xsl:param name="p-element" as="element()"/>
    
    <xsl:variable name="all-text" select="string-join($p-element//text(), '')"/>
    <xsl:variable name="semicolon-count" select="string-length($all-text) - string-length(translate($all-text, ';', ''))"/>
    <xsl:variable name="has-smallcaps" select="exists($p-element//tei:hi[@rend='smallcaps'])"/>
    <xsl:variable name="text-length" select="string-length($all-text)"/>
    <xsl:variable name="has-this-edn" select="contains($all-text, 'this edn')"/>
    
    <!-- Complex if: many semicolons with smallcaps, very long, or "this edn" with multiple witness groups -->
    <xsl:sequence select="
      ($semicolon-count gt 2 and $has-smallcaps) or
      $text-length gt 200 or
      ($has-this-edn and $semicolon-count gt 1)
    "/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>PHASE 1: Pre-process collation note into intermediate structure with explicit segments.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:preprocess-collation-note" as="element(tei:p)">
    <xsl:param name="p-element" as="element()"/>
    
    <xsl:variable name="is-complex" select="hcmc:is-complex-note($p-element)"/>
    <xsl:variable name="all-text" select="string-join($p-element//text(), '')"/>
    
    <p>
      <xsl:if test="$is-complex">
        <xsl:attribute name="data-complex">true</xsl:attribute>
      </xsl:if>
      <xsl:copy-of select="$p-element/@xml:id"/>
      
      <!-- Lemma: text before ] -->
      <seg type="lemma">
        <xsl:value-of select="normalize-space(substring-before($all-text, ']'))"/>
      </seg>
      
      <!-- Witnesses: text after ], split by semicolons -->
      <xsl:variable name="witnesses-part" select="normalize-space(substring-after($all-text, ']'))"/>
      <xsl:for-each select="tokenize($witnesses-part, ';')">
        <xsl:if test="normalize-space(.) != ''">
          <seg type="witness-group">
            <xsl:value-of select="normalize-space(.)"/>
          </seg>
        </xsl:if>
      </xsl:for-each>
    </p>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>PHASE 2: Convert pre-processed note to final TEI app structure.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:convert-preprocessed-note" as="element()*">
    <xsl:param name="preprocessed-p" as="element(tei:p)"/>
    
    <xsl:variable name="is-complex" select="$preprocessed-p/@data-complex = 'true'"/>
    <xsl:variable name="lemma-text" select="hcmc:normalize-ellipsis(string($preprocessed-p/tei:seg[@type='lemma']))"/>
    <xsl:variable name="witness-groups" select="$preprocessed-p/tei:seg[@type='witness-group']"/>
    <xsl:variable name="all-witness-text" select="string-join($witness-groups, ' ')"/>
    <xsl:variable name="has-subst" select="contains($all-witness-text, 'subst.')"/>
    
    <!-- Create lemma element -->
    <lem>
      <xsl:if test="$has-subst">
        <xsl:attribute name="type">substantive</xsl:attribute>
      </xsl:if>
      <xsl:if test="$is-complex">
        <xsl:attribute name="cert">low</xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="normalize-space($lemma-text) = ''">
          <xsl:text>[WARNING: NO LEMMA FOUND. NEEDS MANUAL REMEDIATION]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$lemma-text"/>
        </xsl:otherwise>
      </xsl:choose>
    </lem>
    
    <!-- Process each witness group -->
    <xsl:for-each select="$witness-groups">
      <xsl:variable name="group-position" select="position()"/>
      <xsl:variable name="group-text" select="string(.)"/>
      <xsl:variable name="filtered-text" select="hcmc:filter-subst($group-text)"/>
      
      <xsl:choose>
        <xsl:when test="$filtered-text = ''"/>
        
        <!-- "this edn" means the modern spelling edition reading = lemma -->
        <xsl:when test="contains($group-text, 'this edn')">
          <rdg 
               wit="{concat('#', hcmc:gen-xmlid($source-filename),'_collation')}">
            <xsl:value-of select="$lemma-text"/>
          </rdg>
        </xsl:when>
        
        <xsl:when test="$group-position = 1">
          <!-- Check if this group has a variant in parentheses - if so, it's NOT agreeing with lemma -->
          <xsl:variable name="has-variant-in-parens" select="contains($filtered-text, '(') and contains($filtered-text, ')')"/>
          <xsl:sequence select="hcmc:parse-witness-group-v2($filtered-text, $lemma-text, not($has-variant-in-parens))"/>
        </xsl:when>
        
        <xsl:otherwise>
          <xsl:sequence select="hcmc:parse-witness-group-v2($filtered-text, $lemma-text, false())"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>This function parses a witness group string into rdg or note elements.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:parse-witness-group-v2" as="element()*">
    <xsl:param name="group-text" as="xs:string"/>
    <xsl:param name="lemma-text" as="xs:string"/>
    <xsl:param name="agrees-with-lemma" as="xs:boolean"/>
    
    <xsl:variable name="tokens" select="tokenize($group-text, '[,\s]+')"/>
    <xsl:variable name="potential-sigils" select="$tokens[hcmc:is-witness-sigil(.)]"/>
    
    <xsl:choose>
      <!-- "not in" pattern - create empty rdg for each witness -->
      <xsl:when test="contains(lower-case($group-text), 'not in')">
        <xsl:variable name="after-not-in" select="normalize-space(substring-after(lower-case($group-text), 'not in'))"/>
        <xsl:variable name="witness-tokens" select="tokenize($after-not-in, '[,\s]+')"/>
        
        <!-- Collect only consecutive sigils from the start, stop at first non-sigil -->
        <xsl:variable name="sigils" as="xs:string*">
          <xsl:for-each select="$witness-tokens">
            <xsl:variable name="pos" select="position()"/>
            <xsl:variable name="is-sigil" select="hcmc:is-witness-sigil(upper-case(.))"/>
            <!-- Only include if it's a sigil AND all previous tokens were also sigils -->
            <xsl:if test="$is-sigil and not(exists($witness-tokens[position() lt $pos][not(hcmc:is-witness-sigil(upper-case(.)))]))">
              <xsl:sequence select="."/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
        
        <!-- Calculate position where sigils end to extract remaining text -->
        <xsl:variable name="sigil-count" select="count($sigils)"/>
        <xsl:variable name="remaining-text" select="
          if ($sigil-count lt count($witness-tokens)) 
          then normalize-space(string-join($witness-tokens[position() gt $sigil-count], ' '))
          else ''"/>
        
        <xsl:choose>
          <xsl:when test="count($sigils) gt 0">
            <xsl:for-each select="$sigils">
              <rdg wit="{concat('#', hcmc:gen-xmlid($source-filename), '_collation_', upper-case(.))}"/>
            </xsl:for-each>
            <!-- If there's remaining text, output as note -->
            <xsl:if test="$remaining-text != ''">
              <note><xsl:value-of select="$remaining-text"/></note>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <note>not in <xsl:value-of select="$after-not-in"/></note>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
    <xsl:otherwise>
    
    <xsl:choose>
      <!-- Simple witness list agreeing with lemma (e.g., "Q, F1") -->
      <xsl:when test="$agrees-with-lemma and count($potential-sigils) gt 0 and string-length($group-text) lt 20">
        <xsl:for-each select="$potential-sigils">
          <rdg 
               wit="{concat('#', hcmc:gen-xmlid($source-filename), '_collation_', .)}">
            <xsl:value-of select="hcmc:normalize-ellipsis($lemma-text)"/>
          </rdg>
        </xsl:for-each>
      </xsl:when>
      
      <!-- Variant with witness at end (e.g., "knew F1") -->
      <xsl:when test="not($agrees-with-lemma) and count($potential-sigils) = 1 and $tokens[last()] = $potential-sigils[1]">
        <xsl:variable name="reading-text" select="normalize-space(string-join($tokens[position() lt last()], ' '))"/>
        <rdg
             wit="{concat('#', hcmc:gen-xmlid($source-filename), '_collation_', $potential-sigils[1])}">
          <xsl:value-of select="hcmc:normalize-ellipsis($reading-text)"/>
        </rdg>
      </xsl:when>
      
      <!-- Witness with variant in parentheses -->
      <xsl:when test="contains($group-text, '(') and contains($group-text, ')')">
        <xsl:variable name="before-paren" select="normalize-space(substring-before($group-text, '('))"/>
        <xsl:variable name="in-paren" select="substring-before(substring-after($group-text, '('), ')')"/>
        <xsl:choose>
          <xsl:when test="hcmc:is-witness-sigil($before-paren)">
            <rdg
                 wit="{concat('#', hcmc:gen-xmlid($source-filename), '_collation_', $before-paren)}">
              <xsl:value-of select="hcmc:normalize-ellipsis(normalize-space($in-paren))"/>
            </rdg>
          </xsl:when>
          <xsl:otherwise>
            <note>
              <xsl:variable name="text-node" as="text()">
                <xsl:value-of select="$group-text"/>
              </xsl:variable>
              <xsl:sequence select="hcmc:wrap-quotes($text-node)"/>
            </note>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <!-- Cannot parse - output as note  -->
      <xsl:otherwise>
        <xsl:if test="$group-text != ''">
          <note>
            <xsl:variable name="text-node" as="text()">
              <xsl:value-of select="$group-text"/>
            </xsl:variable>
            <xsl:sequence select="hcmc:wrap-quotes($text-node)"/>
          </note>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Main two-phase entry point for parsing collation notes.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:parse-collation-note-v2" as="element()*">
    <xsl:param name="p-element" as="element()"/>
    <xsl:variable name="preprocessed" select="hcmc:preprocess-collation-note($p-element)"/>
    <xsl:sequence select="hcmc:convert-preprocessed-note($preprocessed)"/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Normalize straight single/double quotes to curly quotes before quote wrapping.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:normalize-straight-quotes" as="xs:string">
    <xsl:param name="text" as="xs:string"/>
    <xsl:sequence select="hcmc:normalize-straight-quotes($text, 1, false(), false(), '')"/>
  </xsl:function>

  <xsl:function name="hcmc:normalize-straight-quotes" as="xs:string">
    <xsl:param name="text" as="xs:string"/>
    <xsl:param name="pos" as="xs:integer"/>
    <xsl:param name="in-double" as="xs:boolean"/>
    <xsl:param name="in-single" as="xs:boolean"/>
    <xsl:param name="out" as="xs:string"/>
    <xsl:choose>
      <xsl:when test="$pos gt string-length($text)">
        <xsl:sequence select="$out"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="ch" as="xs:string" select="substring($text, $pos, 1)"/>
        <xsl:variable name="prev" as="xs:string" select="if ($pos gt 1) then substring($text, $pos - 1, 1) else ''"/>
        <xsl:variable name="next" as="xs:string" select="if ($pos lt string-length($text)) then substring($text, $pos + 1, 1) else ''"/>
        <xsl:variable name="prev-word" as="xs:boolean" select="matches($prev, '[\p{L}\p{N}]')"/>
        <xsl:variable name="next-word" as="xs:boolean" select="matches($next, '[\p{L}\p{N}]')"/>
        <xsl:choose>
          <xsl:when test="$ch = '&quot;'">
            <xsl:variable name="replacement" as="xs:string"
              select="
                if ($in-double) then '”'
                else if (not($prev-word) and $next-word) then '“'
                else if ($prev-word and not($next-word)) then '”'
                else '“'
              "/>
            <xsl:sequence select="hcmc:normalize-straight-quotes($text, $pos + 1, $replacement = '“', $in-single, concat($out, $replacement))"/>
          </xsl:when>
          <xsl:when test="$ch = &quot;'&quot;">
            <xsl:variable name="replacement" as="xs:string"
              select="
                if ($prev-word and $next-word) then '’'
                else if ($in-single) then '’'
                else if (not($prev-word) and $next-word) then '‘'
                else '’'
              "/>
            <xsl:sequence select="hcmc:normalize-straight-quotes($text, $pos + 1, $in-double, $replacement = '‘', concat($out, $replacement))"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="hcmc:normalize-straight-quotes($text, $pos + 1, $in-double, $in-single, concat($out, $ch))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xd:doc>
    <xd:desc>Function to wrap text between quotes in &lt;q&gt; elements, handling nested quotes.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:wrap-quotes" as="item()*">
    <xsl:param name="nodes" as="node()*"/>
    <xsl:variable name="tokens" as="item()*">
      <xsl:for-each select="$nodes">
        <xsl:choose>
          <xsl:when test="self::tei:supplied">
            <xsl:sequence select="."/>
          </xsl:when>
          <xsl:when test="self::tei:quote">
            <xsl:sequence select="."/>
          </xsl:when>
          <xsl:when test="self::text()">
            <xsl:analyze-string select="hcmc:normalize-ellipsis(hcmc:normalize-straight-quotes(.))" regex="([‘’“”])">
              <xsl:matching-substring>
                <xsl:sequence select="regex-group(1)"/>
              </xsl:matching-substring>
              <xsl:non-matching-substring>
                <xsl:sequence select="."/>
              </xsl:non-matching-substring>
            </xsl:analyze-string>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:sequence select="hcmc:group-between-quotes($tokens, (), ())"/>
  </xsl:function>
  
  <xd:doc>
    <xd:desc>Recursive helper function to group tokens between quotes, handling nesting.</xd:desc>
  </xd:doc>
  <xsl:function name="hcmc:group-between-quotes" as="item()*">
    <xsl:param name="tokens" as="item()*"/>
    <xsl:param name="quote-stack" as="xs:string*"/>
    <xsl:param name="accumulated" as="item()*"/>
    
    <xsl:choose>
      <!-- Base case: no more tokens -->
      <xsl:when test="empty($tokens)">
        <xsl:sequence select="$accumulated"/>
      </xsl:when>
      
      <!-- Preserve supplied elements -->
      <xsl:when test="$tokens[1] instance of element() and local-name($tokens[1]) = 'supplied'">
        <supplied>
          <xsl:copy-of select="$tokens[1]/@*"/>
          <xsl:sequence select="hcmc:group-between-quotes($tokens[1]/node(), (), ())"/>
        </supplied>
        <xsl:sequence select="hcmc:group-between-quotes($tokens[position() gt 1], $quote-stack, $accumulated)"/>
      </xsl:when>
      
      <!-- Preserve quote elements, wrapping them in cit -->
      <xsl:when test="$tokens[1] instance of element() and local-name($tokens[1]) = 'quote'">
        <xsl:sequence select="$accumulated"/>
        <cit>
          <quote>
            <xsl:copy-of select="$tokens[1]/@*"/>
            <xsl:apply-templates select="$tokens[1]/node()"/>
          </quote>
        </cit>
        <xsl:sequence select="hcmc:group-between-quotes($tokens[position() gt 1], $quote-stack, ())"/>
      </xsl:when>
      
      <!-- Opening single quote -->
      <xsl:when test="$tokens[1] = '‘'">
        <xsl:choose>
          <xsl:when test="empty($quote-stack)">
            <!-- Start new single quote context, look for closing single quote -->
            <xsl:variable name="result" select="hcmc:collect-until-quote($tokens[position() gt 1], '’', ())"/>
            <xsl:sequence select="$accumulated"/>
            <xsl:element name="q" namespace="http://www.tei-c.org/ns/1.0" inherit-namespaces="no">
              <xsl:sequence select="$result?content"/>
            </xsl:element>
            <xsl:sequence select="hcmc:group-between-quotes($result?remaining, (), ())"/>
          </xsl:when>
          <xsl:otherwise>
            <!-- Nested single quote - treat as content -->
            <xsl:sequence select="hcmc:group-between-quotes($tokens[position() gt 1], $quote-stack, ($accumulated, $tokens[1]))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <!-- Opening double quote -->
      <xsl:when test="$tokens[1] = '“'">
        <xsl:choose>
          <xsl:when test="empty($quote-stack)">
            <!-- Start new double quote context, look for closing double quote -->
            <xsl:variable name="result" select="hcmc:collect-until-quote($tokens[position() gt 1], '”', ())"/>
            <xsl:sequence select="$accumulated"/>
            <xsl:element name="q" namespace="http://www.tei-c.org/ns/1.0" inherit-namespaces="no">
              <xsl:sequence select="$result?content"/>
            </xsl:element>
            <xsl:sequence select="hcmc:group-between-quotes($result?remaining, (), ())"/>
          </xsl:when>
          <xsl:when test="$quote-stack[last()] = '‘'">
            <!-- Nested double quote inside single quote, look for closing double quote -->
            <xsl:variable name="result" select="hcmc:collect-until-quote($tokens[position() gt 1], '”', ())"/>
            <xsl:variable name="new-q">
              <xsl:element name="q" namespace="http://www.tei-c.org/ns/1.0" inherit-namespaces="no">
                <xsl:sequence select="$result?content"/>
              </xsl:element>
            </xsl:variable>
            <xsl:sequence select="hcmc:group-between-quotes($result?remaining, $quote-stack, ($accumulated, $new-q))"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="hcmc:group-between-quotes($tokens[position() gt 1], $quote-stack, ($accumulated, $tokens[1]))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <!-- Regular content -->
      <xsl:otherwise>
        <xsl:variable name="processed">
          <xsl:choose>
            <xsl:when test="$tokens[1] instance of node()">
              <xsl:apply-templates select="$tokens[1]" mode="annotation"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="$tokens[1]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:sequence select="hcmc:group-between-quotes($tokens[position() gt 1], $quote-stack, ($accumulated, $processed))"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
  <!-- Helper to collect tokens until matching closing quote -->
  <xsl:function name="hcmc:collect-until-quote" as="map(*)">
    <xsl:param name="tokens" as="item()*"/>
    <xsl:param name="closing-quote" as="xs:string"/>
    <xsl:param name="content" as="item()*"/>
    
    <xsl:choose>
      <xsl:when test="empty($tokens)">
        <xsl:map>
          <xsl:map-entry key="'content'" select="$content"/>
          <xsl:map-entry key="'remaining'" select="()"/>
        </xsl:map>
      </xsl:when>
      <!--Check for supplied elements and retain them -->
      <xsl:when test="$tokens[1] instance of element() and local-name($tokens[1]) = 'supplied'">
        <xsl:variable name="processed-supplied">
          <supplied>
            <xsl:copy-of select="$tokens[1]/@*"/>
            <xsl:sequence select="hcmc:group-between-quotes($tokens[1]/node(), (), ())"/>
          </supplied>
        </xsl:variable>
        <xsl:sequence select="hcmc:collect-until-quote($tokens[position() gt 1], $closing-quote, ($content, $processed-supplied))"/>
      </xsl:when>
      <!-- Check for closing quote: match the correct closing character -->      
      <xsl:when test="($tokens[1] = '’' and $closing-quote = '’') or ($tokens[1] = '”' and $closing-quote = '”')">
        <xsl:map>
          <xsl:map-entry key="'content'" select="$content"/>
          <xsl:map-entry key="'remaining'" select="$tokens[position() gt 1]"/>
        </xsl:map>
      </xsl:when>
      <!-- Handle nested quotes: detect opening of opposite quote type -->
      <xsl:when test="($tokens[1] = '“' and $closing-quote = '’') or ($tokens[1] = '‘' and $closing-quote = '”')">
        <!-- Determine the matching closing quote for this nested quote -->
        <xsl:variable name="nested-closing" select="if ($tokens[1] = '“') then '”' else '’'"/>
        <xsl:variable name="nested-result" select="hcmc:collect-until-quote($tokens[position() gt 1], $nested-closing, ())"/>
        <xsl:variable name="nested-q">
          <q>
            <xsl:sequence select="$nested-result?content"/>
          </q>
        </xsl:variable>
        <xsl:sequence select="hcmc:collect-until-quote($nested-result?remaining, $closing-quote, ($content, $nested-q))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="processed">
          <xsl:choose>
            <xsl:when test="$tokens[1] instance of node()">
              <xsl:apply-templates select="$tokens[1]" mode="annotation"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="$tokens[1]"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:sequence select="hcmc:collect-until-quote($tokens[position() gt 1], $closing-quote, ($content, $processed))"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
  <!-- Function to extract lemma from collation note -->
  <xsl:function name="hcmc:extract-lemma" as="xs:string">
    <xsl:param name="note-p" as="element(tei:p)"/>
    
    <!-- Extract text before the first ']' as the lemma -->
    <xsl:variable name="full-text" select="string($note-p)"/>
    <xsl:choose>
      <xsl:when test="contains($full-text, ']')">
        <xsl:value-of select="normalize-space(substring-before($full-text, ']'))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space($full-text)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
  
</xsl:stylesheet>