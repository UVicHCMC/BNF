<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<sch:schema xmlns:rng="http://relaxng.org/ns/structure/1.0"
            xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            queryBinding="xslt2">
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           prefix="tei"
           uri="http://www.tei-c.org/ns/1.0"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           prefix="xs"
           uri="http://www.w3.org/2001/XMLSchema"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           prefix="rng"
           uri="http://relaxng.org/ns/structure/1.0"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           prefix="rna"
           uri="http://relaxng.org/ns/compatibility/annotations/1.0"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           prefix="sch"
           uri="http://purl.oclc.org/dsdl/schematron"/>
   <sch:ns xmlns="http://www.tei-c.org/ns/1.0"
           xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
           xmlns:tei="http://www.tei-c.org/ns/1.0"
           xmlns:teix="http://www.tei-c.org/ns/Examples"
           xmlns:xlink="http://www.w3.org/1999/xlink"
           xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
           prefix="sch1x"
           uri="http://www.ascc.net/xml/schematron"/>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.cmc-generatedBy-CMC_generatedBy_within_post-constraint-rule-1">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@generatedBy]">
         <sch:assert test="ancestor-or-self::tei:post">The @generatedBy attribute is for use within a &lt;post&gt; element.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.datable.w3c-att-datable-w3c-when-constraint-rule-2">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@when]">
         <sch:report test="@notBefore|@notAfter|@from|@to" role="nonfatal">The @when attribute cannot be used with any other att.datable.w3c attributes.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.datable.w3c-att-datable-w3c-from-constraint-rule-3">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@from]">
         <sch:report test="@notBefore" role="nonfatal">The @from and @notBefore attributes cannot be used together.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.datable.w3c-att-datable-w3c-to-constraint-rule-4">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@to]">
         <sch:report test="@notAfter" role="nonfatal">The @to and @notAfter attributes cannot be used together.</sch:report>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@rendition]">
         <sch:assert test="not(root(.)/*[self::tei:div[@xml:id] or @xml:id='lemdo_odd'])">ERROR: the @rendition attribute should not be used
                                 on TEI elements in documentation.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@rendition][ancestor::tei:TEI]">
         <sch:let name="rndRegex"
                  value="'^rnd:((blackletter)|(bold)|(block)|(braced)|(centre)|(dropcap)|(inline)|(inline-block)|(italic)|(justify)|(left)|(indent)|(letterspace)|(monospace)|(normalstyle)|(normal)|(roman)|(right)|(rightAdjacent)|(rules)|(smallcaps)|(strikethrough)|(subscript)|(superscript)|(underline)|(uppercase)|(xx-small)|(x-small)|(small)|(medium)|(large)|(x-large)|(xx-large)|(ligature)|(numbered)|(bulleted)|(simple))$'"/>
         <sch:let name="ptrs" value="tokenize(@rendition,'\s+')"/>
         <sch:let name="hashPtrs" value="$ptrs[starts-with(.,'#')]"/>
         <sch:let name="others" value="$ptrs[not(starts-with(.,'#'))]"/>
         <sch:let name="badHashes"
                  value="for $h in $hashPtrs return if ($renditions[@xml:id=substring-after($h,'#')]) then () else $h"/>
         <sch:let name="badPtrs"
                  value="for $o in $others return if (not(matches($o,$rndRegex))) then $o else ()"/>
         <sch:assert test="empty($badPtrs)">
                                 ERROR: Bad pointer: <sch:value-of select="string-join($badPtrs,', ')"/>. Only point to predefined renditions using the rnd: pointer scheme. 
                              </sch:assert>
         <sch:assert test="empty($badHashes)">
                                 ERROR: Bad pointer: <sch:value-of select="string-join($badHashes,', ')"/>. All locally defined rendition pointers must point to a rendition declared in the teiHeader.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[matches(@rendition,'rnd:(numbered|bulleted|simple)')]">
         <sch:assert test="self::tei:list">
                                 ERROR: The renditions rnd:numbered, rnd:bulleted, and rnd:simple are only meant to be used on lists.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@style]">
         <sch:assert test="not(starts-with(@style,'rnd:'))">
                                 ERROR: Style attributes should be CSS; use @rendition if you want to point to a defined rendition.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:rendition[@selector]">
         <sch:let name="selectorString" value="normalize-space(@selector)"/>
         <sch:let name="hasError"
                  value="if (matches($selectorString,'=[^''\]]+\]')) then true() else false()"/>
         <sch:assert test="not($hasError)">ERROR: @selector syntax wrong: ensure that you put quotation marks around the attribute
                                 values.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@style] | tei:rendition">
         <sch:let name="text"
                  value="if (local-name(.)='rendition') then normalize-space(string-join(text(), '')) else xs:string(@style)"/>
         <sch:let name="rules" value="tokenize(normalize-space($text), '\s*;\s*')"/>
         <sch:assert test="not(matches($text, 'centre'))"> ERROR: CSS uses 'center’, not
                                 'centre’. </sch:assert>
         <sch:assert test="not(matches($text, 'align-items')) or not(matches($text, 'align-items\s*:\s*((left)|(right))\s*;'))">
                                    ERROR: invalid value for property 'align-items'. See https://developer.mozilla.org/en-US/docs/Web/CSS/align-items for a listing of permitted values.
                                 </sch:assert>
         <sch:assert test="not(matches($text, 'align-content')) or not(matches($text, 'align-content\s*:\s*((left)|(right))\s*;'))">
                                    ERROR: invalid value for property 'align-content'. See https://developer.mozilla.org/en-US/docs/Web/CSS/align-content for a listing of permitted values.
                                 </sch:assert>
         <sch:assert test="not(matches($text, 'justify-items')) or not(matches($text, 'justify-items\s*:\s*((right)|(left))\s*;'))">
                                    ERROR: invalid value for property 'justify-items'. See https://developer.mozilla.org/en-US/docs/Web/CSS/justify-items for a listing of permitted values.
                                 </sch:assert>
         <sch:assert test="not(matches($text, ','))"> ERROR: Use a semi-colon, not a comma, to separate CSS properties.</sch:assert>
         <sch:assert test="self::tei:graphic or not(matches($text, 'px'))"> ERROR: Do not use pixel units. Use
                                 ems or percentages, or for line widths use points (pt). </sch:assert>
         <sch:assert test="not(matches($text, 'italics'))"> ERROR: It’s 'italic’, not
                                 'italics’. </sch:assert>
         <sch:assert test="not(matches($text, 'padding(-[^\s]+)?\s*:\s*-'))"> ERROR:
                                 Padding values cannot be negative. </sch:assert>
         <sch:assert test="not(matches($text, '\d\s+em(;|$)'))"> ERROR: There is no space
                                 between the number and the unit ('3em;', not ’3 em;'). </sch:assert>
         <sch:assert test="not(contains($text, '='))"> ERROR: Don’t use the equals sign
                                 in CSS code. </sch:assert>
         <sch:assert test="not(matches($text, 'float:\s*center'))"> ERROR: You cannot
                                 float center in CSS. </sch:assert>
         <sch:assert test="not(@style) or string-length(normalize-space(@style)) gt 0"> ERROR: @style
                                 should not be empty. </sch:assert>
         <sch:assert test="not(@style) or matches(@style, ';\s*$')"> ERROR: @style should end with a
                                 semi-colon. </sch:assert>
         <sch:assert test="every $r in $rules satisfies (($r = '') or (matches($r, '^[a-z\-]+\s*:\s*.+')))"> ERROR: Syntax error in your CSS. </sch:assert>
         <sch:assert test="not(matches($text,'::+|:\s*[^;]*\s:\s*'))"> ERROR: Do not use multiple colons
                                 in your CSS. If you attempting to use a pseudo-selector, speak with a
                                 programmer. </sch:assert>
         <sch:assert test="(not(self::tei:rendition) and matches(normalize-space($text),'[A-Za-z\d;%]$')) or (self::tei:rendition and (string-length(normalize-space(.)) eq 0 or matches(normalize-space($text),'[A-Za-z\d;%]$')))"> ERROR:
                                 Syntax error at the end of your CSS. </sch:assert>
         <sch:assert test="(not(self::tei:rendition) and not(matches(normalize-space($text),'font-variant:\s*small\s*caps'))) or (self::tei:rendition and (string-length(normalize-space(.)) eq 0 or not(matches(normalize-space($text),'font-variant:\s*small\s*caps'))))">
                                 ERROR: CSS syntax error: small-caps is a hyphenated compound. </sch:assert>
         <sch:assert test="(not(self::tei:rendition) and not(matches(normalize-space($text),'-margin'))) or (self::tei:rendition and (string-length(normalize-space(.)) eq 0 or not(matches(normalize-space($text),'-margin'))))"> ERROR: Margin
                                 properties begin with "margin". </sch:assert>
         <sch:assert test="(not(self::tei:rendition) and not(matches(normalize-space($text),'font-style:\s*small[\s-]*caps'))) or (self::tei:rendition and (string-length(normalize-space(.)) eq 0 or not(matches(normalize-space($text),'font-style:\s*small[\s-]*caps'))))">
                                 ERROR: Use font-variant, not font-style, for small-caps. </sch:assert>
         <sch:assert test="(not(self::tei:rendition) and not(matches(normalize-space($text),'font-size:\s*-?[1-9]\d*;'))) or (self::tei:rendition and (string-length(normalize-space(.)) eq 0 or not(matches(normalize-space($text),'font-size:\s*-?[1-9]\d*;'))))">
                                 ERROR: Only 0 can be without unit for font-size; make sure to use a unit (%,
                                 rem, em) after your font-size. </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.global.source-source-only_1_ODD_source-constraint-rule-11">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@source]">
         <sch:let name="srcs" value="tokenize( normalize-space(@source),' ')"/>
         <sch:report test="(   self::tei:classRef                                 | self::tei:dataRef                                 | self::tei:elementRef                                 | self::tei:macroRef                                 | self::tei:moduleRef                                 | self::tei:schemaSpec )                                   and                                   $srcs[2]">
              When used on a schema description element (like
              <sch:value-of select="name(.)"/>), the @source attribute
              should have only 1 value. (This one has <sch:value-of select="count($srcs)"/>.)
            </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.pointing-targetLang-constraint-rule-12">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[not(self::tei:schemaSpec)][@targetLang]">
         <sch:assert test="@target">@targetLang should only be used on <sch:name/> if @target is specified.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.styleDef-schemeVersion-schemeVersionRequiresScheme-constraint-rule-13">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@schemeVersion]">
         <sch:assert test="@scheme and not(@scheme = 'free')">
              @schemeVersion can only be used if @scheme is specified.
            </sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.typed-subtypeTyped-constraint-rule-14">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@subtype]">
         <sch:assert test="@type">The <sch:name/> element should not be categorized in detail with @subtype unless also categorized in general with @type</sch:assert>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@xml:lang]">
         <sch:assert test="not(@xml:lang='ita')">
                                ERROR: "ita" is not a valid language code. Did you mean "it" (Italian)?
                             </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@xml:lang]">
         <sch:assert test="not(@xml:lang='lat')">
                                ERROR: "lat" is not a valid language code. Did you mean "la" (Latin)?
                             </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@xml:lang]">
         <sch:assert test="not(@xml:lang='fra')">
                                ERROR: "fra" is not a valid language code. Did you mean "fr" (French)?
                             </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-att.calendarSystem-calendar-calendar_attr_on_empty_element-constraint-rule-18">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:*[@calendar]">
         <sch:assert test="string-length( normalize-space(.) ) gt 0"> @calendar indicates one or more
              systems or calendars to which the date represented by the content of this element belongs,
              but this <sch:name/> element has no textual content.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-p-abstractModel-structure-p-in-ab-or-p-constraint-rule-19">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:p">
         <sch:report test="(ancestor::tei:ab or ancestor::tei:p) and                        not( ancestor::tei:floatingText                           | parent::tei:exemplum                           | parent::tei:item                           | parent::tei:note                           | parent::tei:q                           | parent::tei:quote                           | parent::tei:remarks                           | parent::tei:said                           | parent::tei:sp                           | parent::tei:stage                           | parent::tei:cell                           | parent::tei:figure )">
          Abstract model violation: Paragraphs may not occur inside other paragraphs or ab elements.
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-p-abstractModel-structure-p-in-l-constraint-rule-20">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:l//tei:p">
         <sch:assert test="ancestor::tei:floatingText | parent::tei:figure | parent::tei:note">
          Abstract model violation: Metrical lines may not contain higher-level structural elements such as div, p, or ab, unless p is a child of figure or note, or is a descendant of floatingText.
        </sch:assert>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:hi[not(some $c in $catRefs satisfies (matches($c/@target,'Documentation')))][ancestor::tei:TEI/descendant::tei:revisionDesc[@status]][not(ancestor::tei:TEI//tei:revisionDesc[@status=('IML-TEI', 'TCP-TEI')])]">
         <sch:assert test="@style or @rendition">A hi element must have at least one attribute (style or rendition)</sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-desc-deprecationInfo-only-in-deprecated-constraint-rule-22">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:desc[ @type eq 'deprecationInfo']">
         <sch:assert test="../@validUntil">Information about a
        deprecation should only be present in a specification element
        that is being deprecated: that is, only an element that has a
        @validUntil attribute should have a child &lt;desc
        type="deprecationInfo"&gt;.</sch:assert>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:term[matches(@ref, '^\s*gloss:')]">
         <sch:assert test="ancestor::tei:div[starts-with(@xml:id, 'learn_')] or ancestor::tei:TEI[starts-with(@xml:id, 'learn_')] or ancestor::*:egXML or contains(document-uri(/), 'tempEgXML')">
                              ERROR: A term element can only point to a glossary entry from 
                              inside a documentation file.
                            </sch:assert>
         <sch:assert test="not(ancestor::tei:ref or ancestor::tei:term or ancestor::tei:*[@ref])">
                                  ERROR: A term element linking to a glossary item 
                                  should never appear inside another element that will
                                  become a link.
                                </sch:assert>
         <sch:assert test="not(ancestor::tei:head)">
                                  ERROR: A term element linking to a glossary item 
                                  should never appear inside a head element.
                                </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:reg">
         <sch:assert test="normalize-space(.)">
                                    ERROR: reg elements must not be empty.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ptr[not(ancestor::tei:linkGrp)][contains(@target, '_anc_')]">
         <sch:assert test="@type = 'localCit'">
                                    ERROR: Pointers to anchors must have the type attribute with a value of localCit.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ptr[@target]">
         <sch:assert test="not(matches(@target, '(^|\s)role:'))">
                                    Do not use the role: prefix to point to cast roles (person elements in
                                    the particDesc). Use a ref element and supply the appropriate text for 
                                    the link.
                                 </sch:assert>
         <sch:assert test="not(matches(@target, '(^|\s)doc:TAXO1#'))">
                                    Do not use ptr elements to point to ids in TAXO1. Use a 
                                    ref element and provide suitable link text.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-ptr-ptrAtts-constraint-rule-27">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:ptr">
         <sch:report test="@target and @cRef">Only one of the attributes @target and @cRef may be supplied on <sch:name/>.</sch:report>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ref">
         <sch:assert test="not(matches(@target, '\s'))">
                             ERROR: A ref/@target attribute can only have one pointer in it.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ref[matches(@target, 'https://lemdo.uvic.ca/')]">
         <sch:assert test="matches(@target, '^https://lemdo.uvic.ca/[a-zA-Z_]+/.*$')">
                                    ERROR: Links to LEMDO folders or anthologies by directory must
                                    include the trailing slash: e.g. https://lemdo.uvic.ca/moms/
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ref">
         <sch:assert test="not(child::tei:note)">
                                    ERROR: ref elements may not have a child note element.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-ref-refAtts-constraint-rule-31">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:ref">
         <sch:report test="@target and @cRef">Only one of the attributes @target and @cRef may be supplied on <sch:name/>.</sch:report>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:list[@type='glossary']">
         <sch:assert test="ancestor::tei:TEI[@xml:id='GLOSS1'] or                                    ancestor::tei:*[starts-with(@xml:id, 'lemdo_spec_')] or                                    ancestor::tei:standOff or ancestor::tei:div[starts-with(@xml:id, 'learn_')] or ancestor::*:egXML or contains(document-uri(/), 'tempEgXML')">
                              ERROR: A glossary list can only be created in the GLOSS1.xml
                              file.
                            </sch:assert>
      </sch:rule>
      <sch:rule context="tei:list[@type='gloss']">
         <sch:assert test="ancestor::tei:*[starts-with(@xml:id, 'lemdo_spec_')]">
                                 ERROR: list[@type="gloss"] is not allowed in LEMDO's own documents; 
                                 it should only appear in a lemdo_spec_* file created from the TEI 
                                 P5 source.
                               </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:head">
         <sch:assert test="normalize-space(.) ne ''">
                             ERROR: head elements must not be empty.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:head">
         <sch:assert test="not(descendant::tei:note[not(@type='editorial')])">
                              ERROR: note elements are not allowed in head elements unless they have @type='editorial'.
                            </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[not(ancestor::tei:person|ancestor::tei:app|ancestor::tei:bibl|ancestor::tei:teiHeader|ancestor::tei:facsimile|ancestor::tei:org)]">
         <sch:assert test="@type">
                                 ERROR: All in-text notes and notes in annotation files must have a @type attribute.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='annotation']">
         <sch:assert test="child::tei:note[@type='label'][normalize-space(.)] or parent::*:egXML or not(parent::*)">
                                    ERROR: all annotations (note[@type='annotation']) must have child labels 
                                           (note[@type='label']).
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='annotation']">
         <sch:assert test="parent::*[self::tei:div[@type='annotations']] or parent::*:egXML or not(parent::*)">
                                    ERROR: all annotations (note[@type='annotation']) must be inside a parent
                                    div[@type='annotations'].
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:body//tei:note[not(ancestor::tei:TEI[matches(@xml:id, '^BIBL1(_.)?$')])][not(some $c in $catRefs satisfies (matches($c/@target,'Paratext|Documentation|Mixed')))]">
         <sch:assert test="not(@type='editorial')">
                                    ERROR: Type editorial is not allowed inline, unless it is a paratext file, or has editorial treatment "letMixed" (meaning that it's an old supplementary text which has not yet been remediated. Instead, either use &lt;supplied&gt; or &lt;anchor&gt;s as appropriate.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:body//tei:note[not(some $c in $catRefs satisfies (matches($c/@target,'Apparatus|Annotation')))]">
         <sch:assert test="not(@type='lexical')">
                                    ERROR: Type lexical is not allowed inline, unless it is a collation or annotation file. Instead, either use &lt;supplied&gt; or &lt;anchor&gt;s as appropriate.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:body//tei:note[@subtype='printOnly']">
         <sch:assert test="string-length(.) lt 226 or ancestor::tei:TEI/@xml:id=('emdOth_M_annotation', 'emdAYL_M_annotation', 'emdH5_FM_annotation')">
                                    ERROR: printOnly notes should not be more than 225 characters long.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='annotation'][count(child::tei:note[@type='gloss']) gt 1]">
         <sch:assert test="not(child::tei:note[@type='gloss' and not(@subtype)])">
                                    ERROR: The only reason there should be more than one
                                    note[@type="gloss"] in an annotation is when there is 
                                    one with @subtype="onlineOnly" and one with 
                                    @subtype="printOnly". Otherwise, use separate paragraphs
                                    inside a single note element.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:surface/tei:milestone">
         <sch:assert test="@unit and @n and @unit=('page', 'sig')">
                              ERROR: A milestone in a surface element must have both @unit and 
                              @n, and @unit must be either "sig" or "page".
                            </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:milestone[@unit=('linepart', 'nonstructural')]">
         <sch:assert test="ancestor::tei:TEI/descendant::tei:revisionDesc[@status=('IML-TEI', 'IML-TEI_INP')] or ancestor::*[last()]/local-name() = 'div'">
                               ERROR: A milestone with @unit= either "linepart" or "nonstructural" may only appear
                               in a transitional document with revisionDesc/@status="IML-TEI" or "IML-TEI_INP". These milestones must be 
                               remediated before changing the document status.
                             </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:pb[not(ancestor::tei:facsimile)][matches(@n,'\d*[A-Za-z\*\p{IsGreek}¶]*\d+(bis)?(r|v)')]">
         <sch:assert test="not(@n = following::tei:pb/@n)">
                                    ERROR: The signature <sch:value-of select="@n"/> appears to be 
                                    repeated. Bibliographic signatures should be unique within a document.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp/tei:pb">
         <sch:assert test="preceding-sibling::tei:*">
                                    ERROR: Page beginnings should come before a speech or between anonymous
                                    blocks.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:pb">
         <sch:assert test="not(ancestor::tei:titlePage)">
                                    ERROR: Do not put page beginnings in a title page.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:pb">
         <sch:assert test="not(parent::tei:text)">
                                    ERROR: Page beginnings in stages and abs must have meaningful content before them.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:stage/tei:pb | tei:ab/tei:pb">
         <sch:let name="preText"
                  value="normalize-space(string-join(preceding-sibling::node()/descendant-or-self::text(),''))"/>
         <sch:assert test="not($preText = '')">
                                    ERROR: Page beginnings in stages and abs must have meaningful content before them.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:pb">
         <sch:assert test="ancestor::tei:TEI[descendant::tei:catRef[contains(@target, 'SemiDiplomatic')]] or not(ancestor::tei:TEI)">
                              ERROR: pb (page beginning) elements can only be used in semi-diplomatic transcriptions (with the 'letSemiDiplomatic' catRef).
                            </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:pb[@facs]">
         <sch:assert test="contains(@facs, 'http') or matches(@facs, '^facs:[a-zA-Z0-9_]+|\d+$')">
                                    ERROR: pb/@facs must follow a pattern like this:
                                    facs:FEm_Q1_O|016
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:lb[not(some $c in $catRefs satisfies (matches($c/@target,'Documentation')))][ancestor::tei:TEI/descendant::tei:revisionDesc[@status]][not(ancestor::tei:TEI//tei:revisionDesc[@status=('IML-TEI', 'TCP-TEI')])]">
         <sch:assert test="not(following-sibling::node()[(not(self::text() and normalize-space(.) = '')) and not(self::comment())][1][self::tei:lb])">ERROR: Uninterrupted sequences of lb are not allowed. If you need to style for more space between lines, please use the style attribute, with proper padding or margin CSS.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:title | tei:titlePart | tei:epigraph | tei:figDesc | tei:byline | tei:docImprint">
         <sch:assert test="string-length(normalize-space(.)) gt 0"> ERROR: title, titlePart and similar elements must not be empty. ( <sch:value-of select="ancestor::tei:TEI/@xml:id"/> ) </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[matches(@xml:id, '^BIBL1(_.)?$')]/descendant::tei:bibl/descendant::*[self::tei:author or self::tei:editor]">
         <sch:assert test="not(contains(., ',')) or not(matches(., '[A-Z]$'))">
                              ERROR: The period for an initial at the end of an author
                              or editor element must be inside the element.
                            </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[matches(@xml:id, '^BIBL1(_.)?$')]/descendant::tei:bibl/descendant::text()">
         <sch:assert test="not(matches(., '[A-Z]\.\s+[A-Z]\.'))">
                              ERROR: Inside BIBL1 bibl elements, sequences of two or more
                              initials should not have spaces between them. Use J.J.
                              instead of J. J.
                            </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[matches(@xml:id, '^BIBL1(_.)?$')]/descendant::tei:bibl">
         <sch:assert test="not(contains(., 'Eds'))">
                                    ERROR: eds. should never be capitalized in bibliographic entries (i.e., we want eds. or Ed., not Eds.)
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[matches(@xml:id, '^BIBL1(_.)$')]/descendant::tei:bibl">
         <sch:let name="startLetter"
                  value="substring-after(ancestor::tei:TEI/@xml:id, '_')"/>
         <sch:assert test="substring(@xml:id, 1, 1) eq $startLetter">
                                    ERROR: @xml:id values in this file must start with the letter <sch:value-of select="$startLetter"/>
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ref[starts-with(@type, 'bibl')]">
         <sch:assert test="@target">
                                    ERROR: A ref to a bibl element must contain a target
                                    attribute: ref type="bibl" target="bibl:ABCD1".
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-relatedItem-targetorcontent1-constraint-rule-59">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:relatedItem">
         <sch:report test="@target and count( child::* ) &gt; 0">If the @target attribute on <sch:name/> is used, the relatedItem element must be empty</sch:report>
         <sch:assert test="@target or child::*">A relatedItem element should have either a @target attribute or a child element to indicate the related bibliographic item</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-l-abstractModel-structure-l-in-l-constraint-rule-60">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:l">
         <sch:report test="ancestor::tei:l[not(.//tei:note//tei:l[. = current()])]">Abstract model violation: Lines may not contain lines or lg elements.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-lg-atleast1oflggapl-constraint-rule-61">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:lg">
         <sch:assert test="count(descendant::tei:lg|descendant::tei:l|descendant::tei:gap) &gt; 0">An lg element must contain at least one child l, lg, or gap element.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-lg-abstractModel-structure-lg-in-l-constraint-rule-62">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:lg">
         <sch:report test="ancestor::tei:l[not(.//tei:note//tei:lg[. = current()])]">Abstract model violation: Lines may not contain line groups.</sch:report>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp[@next]">
         <sch:let name="targId" value="substring-after(@next, '#')"/>
         <sch:assert test="following::tei:sp[@xml:id eq $targId]">
                                    ERROR: @next points to an xml:id <sch:value-of select="$targId"/>,
                                    but no such id follows it in the text.
                                 </sch:assert>
      </sch:rule>
      <sch:rule context="tei:sp[@prev]">
         <sch:let name="targId" value="substring-after(@prev, '#')"/>
         <sch:assert test="preceding::tei:sp[@xml:id eq $targId]">
                                    ERROR: @prev points to an xml:id <sch:value-of select="$targId"/>,
                                    but no such id precedes it in the text.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp[count(child::*) = 1 and child::tei:speaker]">
         <sch:assert test="@next">A speech which contains only a speaker must have @next
                            because such a speech only exists when it's part of a split element.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp[ancestor::tei:sp]">
         <sch:assert test="ancestor::tei:TEI/descendant::tei:catRef[@target='cat:letSemiDiplomatic']">
                                    ERROR: Nested speeches may only occur in semi-diplomatic encoding.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp[parent::tei:ab]">
         <sch:assert test="parent::tei:ab/parent::tei:sp">
                                    ERROR: Speeches may only appear in ab elements that are inside sp elements
                                    (and only in semi-diplomatic texts).
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:speaker[some $c in $catRefs satisfies (matches($c/@target,'Modern'))][not(ancestor::tei:quote)][not(parent::tei:sp[@who[matches(., 'spkr:other')]])][not(count(tokenize(normalize-space(parent::tei:sp/@who), '\s+')) gt 1)][ancestor::tei:TEI/descendant::tei:revisionDesc[@status[not(.=('IML-TEI', 'TCP-TEI', 'TEI_collating'))]]]">
         <sch:let name="thisSpeaker" value="normalize-space(.)"/>
         <sch:let name="thisWho" value="parent::tei:sp/@who"/>
         <sch:let name="thisSpeakerId" value="replace($thisWho,'#','')"/>
         <sch:let name="matches"
                  value="ancestor::tei:TEI//tei:person[@xml:id=$thisSpeakerId]//tei:reg[. = $thisSpeaker]"/>
         <sch:assert test="count($matches) = 1">
                                    ERROR: Your speaker (<xsl:value-of select="$thisSpeaker"/>) must exactly match one of the names tagged with &lt;reg&gt;. Check your spelling; otherwise add this name to the &lt;reg&gt; list for the corresponding &lt;person&gt; in &lt;listPerson&gt;.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:stage">
         <sch:assert test="not(child::tei:l)">
                                    ERROR: stage elements cannot have lines inside them.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:stage">
         <sch:assert test="not(child::tei:figure)">
                                    ERROR: stage elements cannot have figures inside them.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-span-target-from-constraint-rule-71">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:span">
         <sch:report test="@from and @target">
          Only one of the attributes @target and @from may be supplied on <sch:name/>
         </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-span-targetto-constraint-rule-72">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:span">
         <sch:report test="@to and @target">
          Only one of the attributes @target and @to may be supplied on <sch:name/>
         </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-span-tonotfrom-constraint-rule-73">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:span">
         <sch:report test="@to and not(@from)">
          If @to is supplied on <sch:name/>, @from must be supplied as well
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-span-tofrom-constraint-rule-74">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:span">
         <sch:report test="contains(normalize-space(@to),' ') or contains(normalize-space(@from),' ')">
          The attributes @to and @from on <sch:name/> may each contain only a single value
        </sch:report>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:table[not(descendant::tei:*[@cols or @rows])]">
         <sch:let name="baseCellCount" value="count(tei:row[1]/tei:cell)"/>
         <sch:assert test="every $row in tei:row satisfies count($row/tei:cell) = $baseCellCount">
                              ERROR: At least one row in this table has the wrong number of cells. The cell count
                              established by the first row is <sch:value-of select="$baseCellCount"/>.
                                </sch:assert>
      </sch:rule>
      <sch:rule context="tei:table[descendant::tei:*[@cols or @rows]]">
         <sch:let name="baseCellCount"
                  value="count(tei:row[i]/tei:cell) + sum((for $s in tei:row[1]/tei:cell/@cols return xs:integer($s) - 1))"/>
         <sch:let name="spanAdjustment"
                  value="sum((for $s in (descendant::tei:cell/@cols, descendant::tei:cell/@rows) return xs:integer($s) - 1))"/>
         <sch:let name="totalCells" value="count(descendant::tei:cell) + $spanAdjustment"/>
         <sch:assert test="$totalCells mod count(descendant::tei:row) = 0">
                                 ERROR: This table has an incorrect number of cells.
                               </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:figure[ancestor::tei:TEI[descendant::tei:catRef/@target[.= 'cat:letSemiDiplomatic']]]">
         <sch:assert test="@type">
                                    Error: Figures in semi-diplomatic transcriptions require a type attribute
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:figure[@type=('addition', 'illustration', 'portrait')]">
         <sch:assert test="child::tei:figDesc">
                                    Error: Figures with a type value of addition require a child figDesc element
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:figure[@type=('device', 'fleuron', 'horizontal-rule', 'manicule', 'ornament', 'virgule')]">
         <sch:assert test="not(child::tei:figDesc)">
                                    Error: Figures for horizontal rules, devices, and ornaments may not have child figDesc elements
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:figure[@type='device']/@n">
         <sch:assert test="matches(., 'McKerrow\s\d+')">
                                    Error: n values on pb must cite a McKerrow number
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:g[@ref=('g:cutp', 'g:cutP', 'g:con')]">
         <sch:assert test="ancestor::tei:TEI/descendant::tei:catRef[contains(@target, 'lbfManuscript')]">
                                    ERROR: The glyphs g_cutp, g_cutP, and g_con are allowed only in transcriptions of manuscripts. If your document is a manuscript, add a catRef element with the value "lbfManuscript."
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:idno[@type=('ESTC', 'LEME')]">
         <sch:assert test="not(matches(text(), '\s+'))">
                                    ERROR: There should be no spaces in an ESTC or LEME idnos. Include only the 
                                    identifier itself.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:licence">
         <sch:assert test="not(@corresp) or matches(@corresp, '^anth:')">
                                    ERROR: The @corresp attribute on a licence element must point 
                                    at an anthology using the anth: prefix.
                                 </sch:assert>
      </sch:rule>
      <sch:rule context="tei:licence">
         <sch:assert test="not(@corresp) or (@from and @resp)">
                                    ERROR: The licence element pointing to an anthology must have
                                    @from and @resp.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:rendition[@xml:id]">
         <sch:assert test="matches(@xml:id, concat('^(',$docId,'|rnd_)'))">ERROR: All rendition elements with an xml:id
                                    must start with either the root document id  or 'rnd_').</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:rendition">
         <sch:assert test="@xml:id or @selector">
                                    ERROR: All renditions must have at least one of a selector or xml:id.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:prefixDef[@ident]">
         <sch:let name="currIdent" value="@ident"/>
         <sch:assert test="not(following::tei:prefixDef[@ident=$currIdent])">
                             ERROR: We do not (currently) allow multiple prefixDefs with the same @ident, 
                             because our processing depends on unique ways of handling each prefix.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:change[parent::tei:revisionDesc]">
         <sch:assert test="@when or @to or @from or @notBefore or @notAfter">ERROR: All change elements must have a dating attribute (@when, @to, @from, @notBefore, @notAfter).  </sch:assert>
      </sch:rule>
      <sch:rule context="tei:change[parent::tei:revisionDesc]">
         <sch:assert test="@who">ERROR: All change elements in revisionDesc
                                    must have @who.  </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:change[parent::tei:revisionDesc]">
         <sch:assert test="not(following-sibling::tei:change[xs:date(@when) &gt; xs:date(current()/@when)])"> ERROR: The order of &lt;changes&gt; elements in the
                                 &lt;revisionDesc&gt; in this file is not correct. Later changes should
                                 always come first. 
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:change[@who]">
         <sch:assert test="starts-with(@who, $persPrefix) or starts-with(@who,$orgPrefix)">ERROR: @who attributes should point to a person in the personography
                                 or an organization in the orgography.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[descendant::tei:revisionDesc/@status ne 'IML-TEI']/descendant::tei:ab[@type]">
         <sch:assert test="not(@type=('setAsProse', 'setAsVerse', 'hungword', 'literaryDivision', 'song'))">
                                    ERROR: The legacy values 'setAsProse', 'setAsVerse', 'hungword', 'literaryDivision', 'song'
                                    may only be used on ab/@type in documents whose status is IML-TEI.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-ab-abstractModel-structure-ab-in-l-constraint-rule-93">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:l//tei:ab">
         <sch:assert test="ancestor::tei:floatingText | parent::tei:figure | parent::tei:note">
          Abstract model violation: Metrical lines may not contain higher-level divisions such as p or ab, unless ab is a child of figure or note, or is a descendant of floatingText.
        </sch:assert>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:seg">
         <sch:assert test="not(child::tei:figure)">
                                    ERROR: seg elements cannot have figures inside them.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-msDesc-one_ms_singleton_max-constraint-rule-95">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:msContents|tei:physDesc|tei:history|tei:additional">
         <sch:let name="gi" value="name(.)"/>
         <sch:report test="preceding-sibling::*[ name(.) eq $gi ]                           and                           not( following-sibling::*[ name(.) eq $gi ] )">
          Only one <sch:name/> is allowed as a child of <sch:value-of select="name(..)"/>.
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-msIdentifier-msId_minimal-constraint-rule-96">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:msIdentifier">
         <sch:report test="not( parent::tei:msPart )                           and                           ( child::*[1]/self::idno  or  child::*[1]/self::altIdentifier  or  normalize-space(.) eq '')">An msIdentifier must contain either a repository or location.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-physDesc-physDescRespIsOrgsOrPeople-constraint-rule-97">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:physDesc[@resp]">
         <sch:assert test="matches(@resp, '^((pers)|(org)):')">
                                 ERROR: The @resp attribute on physDesc must point to a person (pers:...) or
                                 an organization (org:...).
                              </sch:assert>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:person/tei:persName[ancestor::tei:particDesc]">
         <sch:assert test="not(child::tei:note)">
                             ERROR: Do not place note elements inside persNames. Add the note 
                                    to the person element after the persName.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:persName | tei:orgName">
         <sch:assert test="not(descendant::tei:anchor)">
                                    ERROR: Do not place anchor elements inside persName or orgName elements. A persName or orgName typically becomes a link itself, so it cannot host another link inside it.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-listRef-TagDocsNestinglistRef-constraint-rule-100">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef">
         <sch:report test="tei:listRef">In the context of tagset documentation, the listRef element must not self-nest.</sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-listRef-TagDocslistRefChildren-constraint-rule-101">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef/tei:ptr | ( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef/tei:ref">
         <sch:assert test="@target and not( matches( @target,'\s') )">In the context of tagset documentation, each ptr or ref element inside a listRef must have a target attribute with only 1 pointer as its value.</sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-constraintDecl-one-constraintDecl-per-scheme-constraint-rule-102">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="/*[ count( //tei:constraintDecl ) gt 1 ]">
         <sch:let name="schemes"
                  value="//tei:constraintDecl[ not(ancestor::*[local-name(.) eq 'egXML'] ) ]/@scheme"/>
         <sch:let name="disctinct_schemes" value="distinct-values( $schemes )"/>
         <sch:assert test="count( $schemes ) eq count( $disctinct_schemes )">
          Each &lt;constraintDecl&gt; element should have a @scheme attribute that is distinct from that of all the other &lt;constraintDecl&gt;s.
        </sch:assert>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:witness">
         <sch:let name="contents" value="normalize-space(.)"/>
         <sch:assert test="(@corresp and string-length($contents) = 0) or (not(@corresp) and string-length($contents) gt 0)">
                             ERROR: A witness element must EITHER be empty and link to a BIBL1 or BEED1 entry
                             using @corresp, OR have descriptive content and no @corresp attribute.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:div[ancestor::tei:*[last()]/self::tei:div]">
         <sch:assert test="@xml:id">
                                    ERROR: All documentation divs must have an xml:id.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@xml:id][ancestor::tei:*[last()]/self::tei:div]">
         <sch:assert test="starts-with(@xml:id, ancestor::tei:*[last()]/@xml:id) or matches(ancestor::tei:div[last()]/@xml:id, '^GLOSS1_')">
                                    ERROR: All xml:ids in a documentation file must begin with the xml:id
                                    of the root div element in the file.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:div[not(parent::*)][starts-with(@xml:id, 'learn_')]">
         <sch:assert test="child::tei:head">
                                    ERROR: The root div element in a documentation file must have a head element.
                                 </sch:assert>
         <sch:assert test="@ana">
                                    ERROR: The root div element in a documentation file must have @ana specifying its target audience(s).
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:div[@subtype]">
         <sch:assert test="@type and @type eq 'audience'">
                                    ERROR: If using the @subtype attribute, the @type attribute
                                           must be set to "audience".
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-div-abstractModel-structure-div-in-l-constraint-rule-108">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:l//tei:div">
         <sch:assert test="ancestor::tei:floatingText">
          Abstract model violation: Metrical lines may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
        </sch:assert>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-div-abstractModel-structure-div-in-ab-or-p-constraint-rule-109">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:div">
         <sch:report test="(ancestor::tei:p or ancestor::tei:ab) and not(ancestor::tei:floatingText)">
          Abstract model violation: p and ab may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
        </sch:report>
      </sch:rule>
   </pattern>
   <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:teix="http://www.tei-c.org/ns/Examples"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            id="lemdo_all-facsimile-no_facsimile_text_nodes-constraint-rule-110">
      <sch:rule xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                context="tei:facsimile//tei:line | tei:facsimile//tei:zone">
         <sch:report test="child::text()[ normalize-space(.) ne '']">
          A facsimile element represents a text with images, thus
          transcribed text should not be present within it.
        </sch:report>
      </sch:rule>
   </pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:fw[@type]">
         <sch:assert test="not(descendant::tei:fw)">
                                   ERROR: Do not nest forme work elements which have @type attributes.
                                </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:fw">
         <sch:assert test="@type or child::tei:fw[@type]">
                                    ERROR: forme work elements nested inside fw, or not containing other fws, must have @type attributes.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:fw">
         <sch:assert test="ancestor::tei:TEI[descendant::tei:catRef[contains(@target, 'SemiDiplomatic')]] or not(ancestor::tei:TEI)">
                                    ERROR: forme work elements are only allowed in semi-diplomatic texts
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xi="http://www.w3.org/2001/XInclude"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:space">
         <sch:assert test="not(some $c in $catRefs satisfies (matches($c/@target,'Modern')))">
                                    ERROR: &lt;space&gt; element is not allowed in Modern Texts. LEMDO does not capture page layout.
                                 </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:let name="spaceRegex" value="'(^\s)|(\s$)'"/>
      <sch:let name="persPrefix" value="'pers'"/>
      <sch:let name="prosPrefix" value="'pros'"/>
      <sch:let name="biblPrefix" value="'bibl'"/>
      <sch:let name="docPrefix" value="'doc'"/>
      <sch:let name="orgPrefix" value="'org'"/>
      <sch:let name="binPrefix" value="'bin'"/>
      <sch:let name="imgPrefix" value="'img'"/>
      <sch:let name="docId" value="root(/)/tei:*/@xml:id"/>
      <sch:let name="docUri" value="document-uri(/)"/>
      <sch:let name="appPattern" value="'^tln:\d+(\.\d+)?(\|\d+)?$'"/>
      <sch:let name="docIds" value="//tei:*[@xml:id]/@xml:id"/>
      <sch:let name="catRefs" value="//tei:catRef"/>
      <sch:let name="renditions" value="//tei:rendition"/>
      <sch:let name="entityFileIds"
               value="('TAXO1', 'PROS1', 'PERS1', 'PROD1', 'BEED1', 'ORGS1', 'BIBL1', 'BIBL1_A', 'BIBL1_B', 'BIBL1_C', 'BIBL1_D', 'BIBL1_E', 'BIBL1_G', 'BIBL1_G', 'BIBL1_H', 'BIBL1_I', 'BIBL1_J', 'BIBL1_K', 'BIBL1_L', 'BIBL1_M', 'BIBL1_N', 'BIBL1_O', 'BIBL1_P', 'BIBL1_Q', 'BIBL1_R', 'BIBL1_S', 'BIBL1_T', 'BIBL1_U', 'BIBL1_V', 'BIBL1_W', 'BIBL1_X', 'BIBL1_Y', 'BIBL1_Z', 'GLOSS1', 'HAND1')"/>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@target[contains(., '//')]]">
         <sch:assert test="not(matches(@target, '\s'))">ERROR: URLs in the @target attribute should not contain spaces.</sch:assert>
         <sch:assert test="not(contains(@target, 'proxy'))">ERROR: URLs in the @target attribute should not point to proxy servers, because these URLs are not public.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@target[contains(., '//')] or @url[contains(., '//')]]">
         <sch:assert test="not(matches(@target, '^http://.+\.uvic\.ca/.*') or matches(@url, '^http://.+\.uvic\.ca/.*'))">ERROR: All UVic URLs should use https, not http.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:graphic">
         <sch:assert test="not(matches(@url, '[A-Z]$'))">
                            ERROR: Image filenames must have lower-case extensions:
                            .png, .jpg etc. Do not use upper-case file extensions.
                          </sch:assert>
         <sch:assert test="matches(@url, '\.((png)|(svg)|(jpg))$') or not(matches(@url, '^\s*img:'))">
                                 ERROR: Image filenames must have extensions of .jpg, .png, or .svg.
                              </sch:assert>
         <sch:let name="fName" value="tokenize(@url, '[:/]')[last()]"/>
         <sch:assert test="encode-for-uri($fName) eq $fName">
                                 ERROR: This filename contains characters unsuitable for web publication.
                                 Use only upper- and lower-case ASCII characters, digits, hyphens, and underscores
                                 in filenames.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:surface/tei:graphic">
         <sch:assert test="matches(@url, '\.[a-z]+$')">
                                 ERROR: Image filenames must have lower-case extensions:
                                 .png, .jpg etc. Do not use upper-case file extensions.
                              </sch:assert>
         <sch:assert test="matches(@url, '^\s*sourcefacs:[A-Za-z\d_/\.]+\s*$')">
                                 ERROR: @url attributes on surface graphics should take the form:
                                 sourcefacs:FOLDER/FILENAME.ext
                              </sch:assert>
         <sch:assert test="substring-after(@url, '.') eq replace(substring-after(@mimeType, '/'), 'e', '') and matches(@mimeType, '/(png|jpeg)$')">
                                 ERROR: The mime type for png graphics is image/png, and for jpg graphics it is image/jpeg.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@target][matches(@target, '^\s*bin:')]">
         <sch:assert test="matches(@target, '\.pdf\s*$')">
                                 ERROR: The only binary files which you can link to are PDFs
                                 (with a lower-case .pdf extension).
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@target][matches(@target, '\.pdf$')]">
         <sch:assert test="matches(@target, '://') or matches(@target, '^bin:')">
                                 ERROR: Point to local .pdf files using the bin: prefix.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:surface">
         <sch:assert test="not(contains(@xml:id, '.'))">
                                 ERROR: The xml:ids of surface elements must not include periods.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:graphic[@mimeType]">
         <sch:assert test="not(normalize-space(@mimeType) eq 'image/jpg')">
                                 ERROR: The @mimeType for jpg images is "image/jpeg".
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:person[@xml:id][$docId='PERS1'] | tei:person[@xml:id][$docId='PROS1'] | tei:bibl[@xml:id][starts-with($docId,'BIBL1')] | tei:org[@xml:id][starts-with($docId,'ORGS1')]">
         <sch:assert test="matches(@xml:id,'^[A-Z]{4}\d+$') or (@xml:id=('DRE1','QME1','ISE1'))">ERROR: Every <sch:value-of select="local-name()"/> should have an id
                              that is a sequence of 4 uppercase letters and a number. </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[not(@xml:id = $entityFileIds) and not(ends-with(@xml:id, '_template')) and not(matches(@xml:id, '^BIBL1_[A-Z]$')) and not(descendant::tei:revisionDesc[@status='prgGenerated'])]/descendant::tei:*[@xml:id][not(self::tei:rendition) and not(@xml:id='staticSearch')]">
         <sch:assert test="starts-with(@xml:id, ancestor::tei:TEI/@xml:id || '_')">
                                 ERROR: @xml:id attributes should begin with the @xml:id of their ancestor TEI
                                 element followed by an underscore.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[@xml:id = $entityFileIds][not(@xml:id = 'TAXO1')]/descendant::*[not(self::tei:div or self::tei:handNotes)][@xml:id]">
         <sch:assert test="matches(@xml:id, '^[A-Z]{3,4}\d+$')">
                                 ERROR: @xml:id attributes in database files should follow a pattern of 3–4 uppercase letters followed by a number.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="/tei:TEI[not(ancestor::tei:teiCorpus)] | /tei:teiCorpus | /tei:div[not(ancestor::tei:*) and not(contains(document-uri(/), 'tempEgXML'))][@xml:id]">
         <sch:assert test="@xml:id and matches($docUri,concat('[/\\]',$docId,'.xm[l_]$'))"> ERROR: Document
                              xml:id (<sch:value-of select="$docId"/>) does not match the document file
                              name (<sch:value-of select="$docUri"/>). </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:revisionDesc[@status=('IML-TEI', 'IML-TEI_INP', 'IML-TEI_proofed')]">
         <sch:assert test="not(ancestor::tei:TEI/descendant::tei:catRef[starts-with(@target, 'cat:ldtBornDigDocumentation')])">Status IML is not allowed for documentation files. Instead, use the appropriate TEI status.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:textClass">
         <sch:assert test="not((child::tei:catRef[contains(@target, 'ldtPrimary')]) and (child::tei:catRef[contains(@target, 'ldtBornDig')]))">
                                 ERROR: A text cannot be simultaneously ldtPrimary and ldtBornDig.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:textClass">
         <sch:assert test="child::tei:catRef[contains(@target, 'ldtPrimary')] or child::tei:catRef[contains(@target, 'ldtBornDig')]">
                                 ERROR: A text must be either ldtPrimary or ldtBornDig.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:revisionDesc[@status=('TCP-TEI', 'TCP-TEI_INP', 'TCP-TEI_proofed')]">
         <sch:assert test="ancestor::tei:TEI/descendant::tei:catRef[contains(@target, 'Primary')]">Status TCP is not allowed for non primary files. Instead, use the appropriate IML or TEI status.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[not(some $c in $catRefs satisfies (matches($c/@target,'Documentation')))][not(some $c in $catRefs satisfies (matches($c/@target,'Primary')))][ancestor::tei:TEI/descendant::tei:revisionDesc[@status]][not(ancestor::tei:TEI//tei:revisionDesc[@status=('IML-TEI', 'TCP-TEI')])][not(ancestor-or-self::tei:code)][not(ancestor::tei:TEI/@xml:id='lemdo_spec_tag')][not(ancestor-or-self::tei:gap[@reason='invalid'])][not(ancestor-or-self::tei:eg)][not(ancestor-or-self::tei:quote)][not(ancestor-or-self::tei:q)][not(ancestor-or-self::tei:title[@level='m'])][text()]">
         <sch:assert test="not(matches(string-join(text(),''), '[&#34;“”]'))">
                                 ERROR: Quotations are not allowed in text, except in semi-diplomatic texts. Use the proper element (quote, q, soCalled, or title for example).</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[not(some $c in $catRefs satisfies (matches($c/@target,'Documentation')))][not(some $c in $catRefs satisfies (matches($c/@target,'Primary')))][ancestor::tei:TEI/descendant::tei:revisionDesc[@status]][not(ancestor::tei:TEI//tei:revisionDesc[@status=('IML-TEI', 'TCP-TEI')])][not(ancestor-or-self::tei:code)][not(ancestor::tei:TEI/@xml:id='lemdo_spec_tag')][not(ancestor-or-self::tei:gap[@reason='invalid'])][not(ancestor-or-self::tei:eg)][not(ancestor-or-self::tei:quote)][not(ancestor-or-self::tei:q)][not(ancestor-or-self::tei:title[@level='m'])][text()]">
         <sch:assert test="not(matches(string-join(child::text(),''), '[&#34;‘]'))">
                                 ERROR: Single quotations are not allowed in text. Use the proper element (quote, q, or soCalled for example).</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[not(self::tei:eg or self::tei:code or self::tei:q or self::tei:quote)][not(ancestor::tei:TEI/descendant::tei:revisionDesc[@status='IML-TEI'])]/text()">
         <sch:assert test="not(matches(., ''''))">
                                 ERROR: Straight apostrophes are not allowed in text. Use curly apostrophes instead. The shortcut to add a curly apostrophe is ctrl+shift+’ (on PC or Unix) and command+shift+’ (on iOS).</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:particDesc/tei:listPerson[@type='castlist']/tei:person/tei:note">
         <sch:assert test="not(matches(., '[&#34;''‘“”]'))">
                                 ERROR: Quotation marks and straight apostrophes are not allowed in text. Use curly apostrophes or 
                                 use the proper element (quote, q, or soCalled for example).
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[descendant::tei:catRef[contains(@target, 'ldtBornDigParatext')]]/descendant::tei:cit">
         <sch:assert test="ancestor::tei:p or ancestor::tei:note">
                                 ERROR: cit elements should be inside p elements or note elements;
                                 block quotations belong inside paragraphs.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@resp]">
         <sch:assert test="starts-with(@resp,$persPrefix)">ERROR: @resp should point
                              to a person in the personography using the 'pers’ prefix.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:name[@ref]">
         <sch:assert test="starts-with(@ref,$persPrefix) or starts-with(@ref,$prosPrefix) or starts-with(@ref,$orgPrefix)">ERROR: Name/@ref should point to a person in the personography using
                              the 'pers’ prefix, a historical person in the prosography using the 'pros' prefix, or an organization in the orgography using the 'org’
                              prefix.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:let name="personographyIds"
               value="if (doc-available('../PERS1.xml')) then doc('../PERS1.xml')//tei:TEI//tei:*/@xml:id else doc('../original/PERS1.xml')//tei:TEI//tei:*/@xml:id"/>
      <sch:rule context="tei:name[starts-with(@ref,$persPrefix)]">
         <sch:assert test="some $p in $personographyIds satisfies (matches($p, substring-after(@ref, ':')))">ERROR: Name/@ref should point to a person in the personography
                                 if it has the 'pers’ prefix.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:let name="prosographyIds"
               value="if (doc-available('../PROS1.xml')) then doc('../PROS1.xml')//tei:TEI//tei:*/@xml:id else doc('../original/PROS1.xml')//tei:TEI//tei:*/@xml:id"/>
      <sch:rule context="tei:name[starts-with(@ref,$prosPrefix)]">
         <sch:assert test="some $h in $prosographyIds satisfies (matches($h, substring-after(@ref, ':')))">ERROR: Name/@ref should point to a historical person in the prosography if it has the 'pros' prefix.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:name[starts-with(@ref,$orgPrefix)]">
         <sch:let name="orgographyIds"
                  value="if (doc-available('../ORGS1.xml')) then doc('../ORGS1.xml')//tei:TEI//tei:*/@xml:id else doc('../original/ORGS1.xml')//tei:TEI//tei:*/@xml:id"/>
         <sch:assert test="some $o in $orgographyIds satisfies (matches($o, substring-after(@ref, ':')))">ERROR: Name/@ref should point to an organization in the orgography if it has the 'org’ prefix.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ref[@type='bibl'][@target]">
         <sch:assert test="matches(@target,'^(bibl)|(prod)|(beed):')">ERROR: Bibl references should
                              start with either the 'bibl' or the 'prod' prefix.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:person/tei:note">
         <sch:assert test="tei:p"> ERROR: Personography biography notes must have at
                              least one child paragraph. </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:bibl[starts-with($docId, 'BIBL1')]/tei:title[not(ends-with(., 'ff.'))]">
         <sch:assert test="not(matches(., '[a-z]\.$'))"> HINT: Final periods usually belong outside title tags. Are you sure this 
                                 final period is actually part of
                              the title? </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:author[ancestor::tei:bibl] | tei:editor[ancestor::tei:bibl] | tei:pubPlace[ancestor::tei:bibl] | tei:publisher[ancestor::tei:bibl] | tei:idno[ancestor::tei:bibl] | tei:date[ancestor::tei:bibl] | tei:title[ancestor::tei:bibl]">
         <sch:let name="elem" value="local-name(.)"/>
         <sch:assert test="not(matches(.,$spaceRegex))"> ERROR: <sch:value-of select="$elem"/> should not begin or end with spaces. Please remove
                              empty spaces from the beginning and end of <sch:value-of select="$elem"/>
                              elements.  </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:date[ancestor::tei:bibl]">
         <sch:assert test="not(ends-with(.,'.'))">ERROR: Final periods belong outside
                              of date tags.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:bibl[starts-with($docId,'BIBL1')]">
         <sch:assert test="not(matches(string-join(text(),''), '[&#34;“”]'))"> ERROR:
                              Quotation mark characters are not permitted. Use the appropriate
                              element (&lt;quote&gt;, &lt;title&gt;, &lt;mentioned&gt;,
                              &lt;soCalled&gt;, etc) instead.  </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:taxonomy[@xml:id = 'emdRespTaxonomy']/tei:category[starts-with(@corresp, 'marc:')]">
         <sch:assert test="string-length(normalize-space(tei:catDesc/tei:gloss[@type = 'marc'])) gt 0"> ERROR: All categories that point to the LOC has a have an associated
                              gloss.  </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:category">
         <sch:assert test="child::tei:catDesc/child::tei:term"> ERROR: All categories must have a child catDesc element with a child term element providing the caption for the category.  </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:taxonomy">
         <sch:assert test="child::tei:desc/child::tei:term"> ERROR: All taxonomies must have a child desc element with a child term element providing the caption for the taxonomy.  </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:span">
         <sch:assert test="tei:term"> ERROR: Annotation missing required element
                              "term". </sch:assert>
         <sch:assert test="count(tei:term) = 1"> ERROR: All annotations should only
                              have one term. </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:catRef[@target = 'cat:ldtBornDigParatextCollation']">
         <sch:assert test="preceding::tei:fileDesc/tei:notesStmt/tei:relatedItem">
                              ERROR: All apparatus documents must explicitly reference an associated
                              text in the &lt;notesStmt&gt;/&lt;relatedItem&gt; element in the
                              teiHeader. </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:div[matches(@xml:id, '_a\d+$')]">
         <sch:let name="actNum" value="xs:integer(replace(@xml:id, '^.+_a(\d+)$', '$1'))"/>
         <sch:assert test="(root(.)/tei:*[not(self::tei:TEI)]) or ($actNum = 1) or (preceding-sibling::tei:div[1][ends-with(@xml:id, '_a' || xs:string($actNum - 1))])">
                            ERROR: The @xml:id of this act div does not follow logically from the @xml:id of the preceding act div.
                          </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:div[matches(@xml:id, '_s\d+$')]">
         <sch:let name="sceneNum"
                  value="xs:integer(replace(@xml:id, '^.+_s(\d+)$', '$1'))"/>
         <sch:assert test="(root(.)/tei:*[not(self::tei:TEI)]) or ($sceneNum = 0) or (($sceneNum = 1) and (not(preceding-sibling::tei:div[1][matches(@xml:id, '_s\d$')]))) or (preceding-sibling::tei:div[1][ends-with(@xml:id, '_s' || xs:string($sceneNum - 1))])">
                           ERROR: The @xml:id of this scene div does not follow logically from the @xml:id of the preceding scene div.
                         </sch:assert>
         <sch:assert test="not(parent::tei:div[matches(@xml:id, '_((a)|(pr)|(bt)|(ps))\d+$')]) or (starts-with(@xml:id, parent::tei:div/@xml:id))">
                               ERROR: The @xml:id of this scene div does not match that of its parent div.
                             </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp[matches(@xml:id, '_sp\d+$')]">
         <sch:let name="spNum" value="xs:integer(replace(@xml:id, '^.+_sp(\d+)$', '$1'))"/>
         <sch:assert test="(root(.)/tei:*[not(self::tei:TEI)]) or ($spNum = 1) or (preceding::tei:sp[matches(@xml:id, '_sp\d+$')][1][ends-with(@xml:id, '_sp' || xs:string($spNum - 1))]) or (ancestor::tei:sp[matches(@xml:id, '_sp\d+$')][1][ends-with(@xml:id, '_sp' || xs:string($spNum - 1))])">
                           ERROR: The @xml:id of this speech does not follow logically from the @xml:id of the preceding speech.
                         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:p[matches(@xml:id, '_p\d+$')]">
         <sch:let name="pNum" value="xs:integer(replace(@xml:id, '^.+_p(\d+)$', '$1'))"/>
         <sch:assert test="(root(.)/tei:*[not(self::tei:TEI)]) or ($pNum = 1) or (preceding::tei:p[not(ancestor::tei:cit)][matches(@xml:id, '_p\d+$')][1][ends-with(@xml:id, '_p' || xs:string($pNum - 1))])">
                                 ERROR: The @xml:id of this paragraph does not follow logically from the @xml:id of the preceding paragraph.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:p[ancestor::tei:cit]">
         <sch:assert test="not(@xml:id)">
                                 ERROR: Paragraphs inside block quotations should not have @xml:id attributes.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[@xml:id=('emdH5_FM', 'emdAYL_M', 'emdOth_M', 'emdRho_M')][descendant::tei:catRef[starts-with(@target, 'cat:ldtPrimary')]]/tei:text/descendant::tei:div">
         <sch:assert test="@n[matches(., '^((\d+)|(Prologue)|(Epilogue)|(Chorus))$')] or @type[.=('dedication', 'encomium')]">
                                 All div elements in the play text of a modern edition intended for print must have @n indicating what 
                                 number act or scene they are, or one of "Prologue", "Epilogue", "Chorus", or "Other".
                              </sch:assert>
         <sch:assert test="@type[. = ('act', 'scene', 'prologue', 'epilogue', 'chorus', 'dedication', 'encomium')]">
                                 All div elements in the play text of a modern edition intended for print must have @type specifying what 
                                 type of division they are.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:respStmt[not(ancestor::tei:sourceDesc)]/tei:*[local-name() = ('persName', 'orgName')]">
         <sch:assert test="@ref">
                              ERROR: All respStmt/names must have a ref that points to a person, historical person, or organization.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='marginal']">
         <sch:assert test="not(ancestor::tei:note[@type='annotation'])"> ERROR: Do not use marginal notes in
                              annotations. 
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='annotation']/tei:note">
         <sch:assert test="@type"> ERROR: All annotative notes need to be
                              appropriately typed. 
                           </sch:assert>
         <sch:assert test="not(@type='annotation')"> ERROR: you can't nest an annotation inside another annotation. 
                             </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='annotation']">
         <sch:assert test="@target or parent::*:egXML or not(parent::*)"> ERROR: All annotation notes must have a target attribute.
                              </sch:assert>
         <sch:assert test="not(matches(@target, '\s'))"> ERROR: @target attributes must not 
                                 contain spaces. To annotate a span of text, use @target and @targetEnd.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='editorial']">
         <sch:assert test="not(ancestor::tei:span)">ERROR: Do not use
                              note/@type=’editorial’ within standoff annotations.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='gloss']">
         <sch:assert test="not(ancestor::tei:q or ancestor::tei:quote)">ERROR: Do not use
                           note/@type=’gloss’ within quotations. Use @type=’editorial’ instead.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[@type='longCaption']">
         <sch:assert test="ancestor::tei:figure">ERROR: Long caption
                           notes can only be contained within a figure element.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:bibl[ancestor::tei:text]">
         <sch:assert test="ancestor::tei:listBibl or ancestor::tei:cit">ERROR: bibl elements should only be used in a block quote
                           with the cit element or in a listBibl in BIBL1.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:quote[not(ancestor::tei:cit)][some $n in $catRefs satisfies (contains($n/@target,'BornDig'))]">
         <sch:assert test="not(descendant::tei:p | descendant::tei:lg | descendant::tei:ab | descendant::tei:stage | descendant::tei:l)">ERROR: Do not put block level elements within a regular quotation. If you are marking up a block of text, nest the quote element within a cit element to make a block quotation.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:app[@from and @to][not(starts-with(@from,'tln:') or starts-with(@to,'tln:'))] | tei:note[@type='annotation'][@target and @targetEnd][not(starts-with(@target,'tln:') or starts-with(@targetEnd,'tln:'))]">
         <sch:let name="left" value="if (self::tei:app) then @from else @target"/>
         <sch:let name="right" value="if (self::tei:app) then @to else @targetEnd"/>
         <sch:assert test="not($left = $right)">
                              ERROR: <sch:value-of select="local-name($left)"/> and <sch:value-of select="local-name($right)"/> are identical values. If you want to annotate an entire element, just use <sch:value-of select="local-name($left)"/>.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[processing-instruction(lemdo-import)]">
         <sch:assert test="self::tei:teiCorpus">
                                 ERROR: Only use lemdo-import processing instructions in corpus documents
                                 where a TEI element would normally go.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:teiCorpus[processing-instruction(lemdo-import)]">
         <sch:assert test="every $p in processing-instruction() satisfies contains($p, '_edition')">
                                 ERROR: lemdo-import processing instructions may only import edition files.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp/tei:ab| tei:sp/tei:p |tei:sp/tei:lg">
         <sch:assert test="string-length(normalize-space(string-join(descendant::text(),''))) gt 0 or (comment()[contains(., 'Empty ab')])">
                              ERROR: Speech must have contents.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:sp[some $c in $catRefs satisfies (matches($c/@target,'Modern'))][ancestor::tei:TEI/descendant::tei:revisionDesc[@status[not(.=('IML-TEI', 'TCP-TEI', 'TEI_collating'))]]]">
         <sch:assert test="@who[matches(., '(^(spkr:other)|(#[a-zA-Z0-9\-_]+)$)')]">
                                 ERROR: The speech element must have a who attribute, either refering to the speaker id in the listPerson or otherwise having a value of spkr:other.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ab[some $c in $catRefs satisfies (matches($c/@target,'Modern'))]">
         <sch:assert test="not(@type='setAsVerse')" role="warning">
                              WARNING: &lt;ab&gt; elements with @type verse should be changed to lg elements ASAP.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@part='I'][not(ancestor::tei:quote)]">
         <sch:let name="part" value="@part"/>
         <sch:let name="thisEl" value="."/>
         <sch:let name="thisElName" value="local-name($thisEl)"/>
         <sch:let name="followingElOfType"
                  value="$thisEl/following::tei:*[local-name()=$thisElName][1]"/>
         <sch:assert test="$followingElOfType[@part and @part=('M','F')]">
                              ERROR: This <sch:value-of select="$thisElName"/> has part value 'I’ but no following M or F.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@part='M'][not(ancestor::tei:quote)]">
         <sch:let name="part" value="@part"/>
         <sch:let name="thisEl" value="."/>
         <sch:let name="thisElName" value="local-name($thisEl)"/>
         <sch:let name="followingElOfType"
                  value="$thisEl/following::tei:*[local-name()=$thisElName][1]"/>
         <sch:assert test="$followingElOfType[@part and @part=('M','F')]">
                              ERROR: This <sch:value-of select="$thisElName"/> has part value 'M’, but no following M or F <sch:value-of select="$thisElName"/>.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@part='F'][not(ancestor::tei:quote)]">
         <sch:let name="part" value="@part"/>
         <sch:let name="thisEl" value="."/>
         <sch:let name="thisElName" value="local-name($thisEl)"/>
         <sch:let name="precedingElOfType"
                  value="$thisEl/preceding::tei:*[local-name()=$thisElName][1]"/>
         <sch:assert test="$precedingElOfType[@part and @part=('I','M')]">
                              ERROR: This <sch:value-of select="$thisElName"/> has part value 'F’, but no preceding I or M <sch:value-of select="$thisElName"/>.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:l[count(*)=1][tei:stage]">
         <sch:assert test="not(every $n in child::text() satisfies (matches($n,'^\s+$')))">
                              ERROR: Do not tag stage directions as verse lines.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[not(ancestor-or-self::tei:code)][not(ancestor::tei:TEI/@xml:id='lemdo_spec_tag')][not(ancestor-or-self::tei:gap[@reason='invalid'])][not(ancestor-or-self::tei:eg)][text()][not(ancestor-or-self::tei:quote)][not(ancestor-or-self::tei:rdg)]">
         <sch:assert test="not(matches(string-join(text(),''),'(&lt;|&gt;)'))">
                              ERROR: Don’t use explicit angle brackets in text. If you want to reference an element, use the gi element or the code element.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[text()][not(self::tei:code or self::tei:item[ancestor::tei:*[starts-with(@xml:id, 'lemdo_spec_')]] or self::tei:bibl[@type='cip'] or self::tei:rendition or self::tei:lem or self::tei:rdg or self::tei:quote or self::tei:mentioned)][text()][(some $c in $catRefs satisfies matches($c/@target,'(Modern)|(BornDig)')) or (./root()/*[local-name(.) = 'div'])]">
         <sch:assert test="not(matches(string-join(child::text(), ''),'(--)|(––)'))">
                           ERROR: Use the em-dash character (—), not double hyphens or en-dashes.
                         </sch:assert>
      </sch:rule>
      <sch:rule context="*:egXML[not(@valid='false')]/descendant::*[text()][not(self::*:code or ancestor::tei:*[starts-with(@xml:id, 'lemdo_spec_')])]">
         <sch:assert test="not(matches(string-join(child::text(), ''),'(--)|(––)'))">
                              ERROR: Use the em-dash character (—), not double hyphens or en-dashes.
                            </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:l[not(matches($docId,'^emd((MND)|(Tim)|(MV))'))][some $c in $catRefs satisfies (matches($c/@target,'Modern'))][not(ancestor::tei:TEI//tei:revisionDesc[@status='TEI_collating'])][not(@part=('M','F'))][not(@prev)]">
         <sch:let name="text"
                  value="normalize-space(string-join(descendant::text()[not(ancestor::tei:stage)],''))"/>
         <xsl:variable name="punctuation">['"‘’,\(-–—\s\.]</xsl:variable>
         <sch:assert test="if (matches($text,'^—') or matches($text,'^\.') or $text='') then true() else matches($text,concat('^',$punctuation,'*[A-Z–]'))">
                              ERROR: Modern verse lines should start with a capital.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[text()][not(self::tei:rdg or self::tei:lem or self::tei:quote or self::tei:code or self::tei:idno or self::tei:pc or self::tei:bibl[@type='cip'])][some $c in $catRefs satisfies (matches($c/@target,'Modern'))][ancestor::tei:TEI/descendant::tei:revisionDesc[@status[not(.=('IML-TEI', 'TCP-TEI', 'TEI_collating'))]]][not(some $c in $catRefs satisfies (matches($c/@target, 'Mixed')))]">
         <sch:let name="text" value="normalize-space(string-join(text(),''))"/>
         <sch:assert test="not(matches($text,'\[|\]'))">
                              ERROR: Do not use square brackets to denote editorially supplied text in modern or born-digital documents. Use the supplied element instead.
                           </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[descendant::tei:catRef[contains(@target, 'ParatextCritical')]][not(descendant::tei:revisionDesc[@status='IML-TEI'])]/descendant::tei:*[not(self::tei:idno) and not(self::tei:pc)]">
         <sch:let name="text" value="normalize-space(string-join(text(),''))"/>
         <sch:assert test="not(matches($text, '\[|\]'))">
                                 ERROR: Do not use square brackets to denote editorially supplied text in
                                 quoting text that contains square brackets, wrap each one in a pc element. The quotation needs to be wrapped in the quote element. 
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[ends-with(@xml:id, '_edition')]/tei:text/descendant::tei:ref[starts-with(@target, 'doc:')]">
         <sch:let name="ref" value="xs:string(@target)"/>
         <sch:assert test="$ref = ancestor::tei:TEI/tei:teiHeader/tei:fileDesc/tei:notesStmt/tei:relatedItem/@target">
                                 ERROR: You have linked to <xsl:value-of select="$ref"/> but that document does not appear as a relatedItem in the header.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:head">
         <sch:assert test="not(descendant::*:egXML)">
                                 ERROR: egXML elements cannot appear in head elements.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:list[ancestor::*[last()][self::tei:div]]">
         <sch:assert test="not(child::tei:head)">
                                 ERROR: Don't put head elements in lists in documentation. Create a div with a head, and put the list in there.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:gi | tei:att">
         <sch:assert test="not(ancestor::tei:ref) or not(ancestor::*[last()][self::div])">
                                 ERROR: Don't put gi or att inside ref elements; links within links are not valid.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:persName[@ref] | tei:orgName[@ref] | tei:ref[@target]">
         <sch:assert test="not(ancestor::tei:ref)">
                                 ERROR: Don't put ref, persName or orgName elements inside ref elements; links within links are not valid.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:persName | tei:orgName | tei:name | tei:ref">
         <sch:assert test="not(matches(., '[,;]\s*$'))">
                                 ERROR: Don't enclose a final comma or other punctuation which is not part
                                 of a name inside the name tag, or inside a link created with a ref element.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[not(matches(@xml:id, '_index$'))][not(ancestor::tei:teiCorpus)][descendant::tei:catRef[matches(@target, 'ornDig')]][not(descendant::tei:catRef[matches(@target, '((BornDigPrint)|(nnotation)|(atabase)|(Documentation))')])]/child::tei:text">
         <sch:assert test="not(child::tei:front)">
                            ERROR: This kind of born-digital document should not have a front element.
                            Front matter is drawn from the teiHeader. Put any byline elements in the 
                            body.
                          </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="*:egXML[@valid='true'][ancestor::tei:div[starts-with(@xml:id, 'learn_')]]">
         <sch:assert test="count(child::*) = 1 and not(child::node()[1][self::text() and normalize-space(.) ne ''])">
                           ERROR: An egXML must have one and only one child element,
                           unless it is valid="false".
                         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="*:egXML[ancestor::tei:div[starts-with(@xml:id, 'learn_')]]">
         <sch:assert test="not(@valid='feasible')">
                           ERROR: Do not use @valid="feasible" in LEMDO documentation. All good
                           examples are @valid="true", and examples of what NOT to do are 
                           @valid="false".
                         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="*:egXML[ancestor::tei:div[starts-with(@xml:id, 'learn_')]]">
         <sch:assert test="@valid">
                           ERROR: All egXMLs in LEMDO documentation must have the @valid attribute. 
                           All good examples are @valid="true", and examples of what NOT to do are 
                           @valid="false".
                         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:textClass[child::tei:catRef[@target = ('cat:letMixed', 'cat:letExcerpted')]]">
         <sch:assert test="not(child::tei:catRef[@target = ('cat:ldtBornDigitalParatextCritical', 'cat:ldtPrimaryText')])">
                           ERROR: If a file has letMixed or letExcerpted, it cannot have ldtBornDigitalParatextCritical or 
                           ldtPrimaryText. In other words, supplementary texts must be either ldtBornDigitalParatext OR 
                           ldtPrimary.
                              </sch:assert>
         <sch:assert test="not(child::tei:catRef[matches(@target, '^cat:((lwt)|(lbf))')])">
                               ERROR: If a file has letMixed or letExcerpted, it cannot have any lwt (work type) 
                               or lbf (book format) catRefs.
                             </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:tagsDecl">
         <sch:assert test="child::tei:*">
                           ERROR: Empty tagsDecl elements are not allowed. Please delete the tagsDecl
                           or add one or more child elements.
                         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@xml:lang]">
         <sch:assert test="not(matches(@xml:lang, '\s+'))">
                                 ERROR: Spaces are not allowed in @xml:lang values.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:byline">
         <sch:assert test="not(child::tei:figure)">
                                 ERROR: The figure element is not allowed inside a byline.
                                 Instead, fragment your byline into two pieces around the figure
                                 and link them with @next and @prev.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="text()">
         <sch:assert test="not(matches(., '[&#x80;-&#x9f;]'))">
                                 ERROR: This text node contains one or more control characters which are not allowed
                                 in our texts. They may have originated in an old word-processor file
                                 which was saved in the obsolete Windows 1252 encoding.
                              </sch:assert>
         <sch:assert test="not(matches(., ' [^:]'))">
                                 ERROR: This text node contains one or more non-breaking spaces (U+00A0).
                                 Avoid using these, because they have unexpected effects on page layout.
                              </sch:assert>
         <sch:assert test="not(contains(., ' '))">
                                 ERROR: This text node a narrow non-breaking space (U+202F).
                                 Avoid using these, because they have unexpected effects on page layout.
                                 This often happens when you copy-paste from a highly formatted source
                                 such as a PDF.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:stage | tei:seg | tei:hi">
         <sch:assert test="not(descendant::tei:label or descendant::tei:ab)">
                            ERROR: label and ab elements are not allowed inside stage, hi, or seg elements.
                                   If you need to style one of these elements, put the @rendition attribute on the label or stage element itself.
                          </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[matches(@xml:id, '_(annotation|collation)$')]/descendant::tei:note[@type='annotation']">
         <sch:let name="targDocId"
                  value="replace(ancestor::tei:TEI/@xml:id, '_(annotation|collation)$', '')"/>
         <sch:assert test="not(@target) or starts-with(@target, concat('doc:', $targDocId, '#', $targDocId)) or starts-with(@target, 'tln:')">
                                 The @target value must point to an anchor in the document <sch:value-of select="$targDocId"/>.
                              </sch:assert>
         <sch:assert test="not(@targetEnd) or starts-with(@targetEnd, concat('doc:', $targDocId, '#', $targDocId)) or starts-with(@targetEnd, 'tln:')">
                                 The @target value must point to an anchor in the document <sch:value-of select="$targDocId"/>.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*/@*[starts-with(., 'doc:')]">
         <sch:assert test="not(matches(., '\.xml\s*(#|$)'))">
                                 ERROR: When linking with the doc: prefix, do NOT include the .xml file suffix.
                                 Just use the xml:id of the target document.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[not(matches(@xml:id, '_template$'))]">
         <sch:assert test="not(descendant::*/@*[local-name(.) = ('target', 'id', 'targetEnd')][contains(., 'emdABBR')])">
                                 ERROR: The value 'emdABBR...' for ids and pointers is only valid in templates, and should not be used
                                        in actual documents.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[descendant::tei:revisionDesc/@status = 'published']/descendant::tei:editionStmt">
         <sch:assert test="matches(., 'Released\s+with\s+.+?\s+(\.*\d)+')">
                                 ERROR: editionStmt elements must contain the string "released with".
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="@*|text()">
         <sch:assert test="not(contains(., 'jenkins' || '.' || 'hcmc' || '.' || 'uvic' || '.' || 'ca'))">
                           ERROR: Links to the Jenkins server are NOT ALLOWED in documents.
                         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:teiHeader">
         <sch:assert test="not(descendant::tei:anchor)">
                           ERROR: Anchors are not allowed in metadata.
                         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ref[@target]">
         <sch:assert test="not(descendant::tei:anchor)">
                                 ERROR: Anchors are not allowed in ref elements.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:p[@xml:id]">
         <sch:assert test="not(ancestor::tei:quote or ancestor::tei:cit)">
                                 ERROR: Paragraphs in quotations should not have ids.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:note[ancestor::tei:note]">
         <sch:assert test="ancestor::tei:note[@type='annotation']">
                                 ERROR: note elements may not be nested except in the context of annotations.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:ptr[@target[starts-with(., '#')]] | tei:ref[@target[starts-with(., '#')]]">
         <sch:let name="targ" value="substring-after(@target, '#')"/>
         <sch:assert test="ancestor::*[last()]//*[@xml:id = $targ] or ancestor::*[last()]/matches(@xml:id, 'lemdo_spec_')">
                                 ERROR: The pointer #<sch:value-of select="$targ"/> must point to an xml:id in this file.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:l">
         <sch:assert test="string-length(normalize-space(.)) gt 0">
                                 ERROR: Poetic lines must not be empty. Do you mean to use an lb element?
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:TEI[contains(@xml:id, '_annotation')]/tei:text">
         <sch:assert test="not(child::tei:front)">
                                 ERROR: front elements are not allowed in annotation files.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@xml:id]">
         <sch:assert test="not(@xml:id = following::tei:*/@xml:id)">
                                 ERROR: @xml:id attributes must be unique. <xsl:value-of select="@xml:id"/> is not.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:titlePart">
         <sch:assert test="not(descendant::tei:figure)">
                                 ERROR: figure elements are not allowed in titlePart.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="text()[not(ancestor::tei:q or ancestor::tei:quote or ancestor::tei:soCalled or ancestor::tei:mentioned)][not(//tei:textClass/tei:catRef[@target='cat:edhSourceCBJ'])]">
         <sch:assert test="not(matches(., '(^|\W)[Ss]ig.?\s*[A-Z][a-z]*\d+(r|v)'))">
                                 ERROR: Do not use "sig" or "sig." or "Sig" or "Sig." etc. before a signature: just use the signature.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[@*]">
         <sch:assert test="not(@*[matches(., 'doc:[^#]+_anc_')])">
            <xsl:for-each select="@*[matches(., 'doc:[^#]+_anc_')]">
                                    ERROR: <sch:value-of select="."/> looks like
                                    an attempt to link to an anchor, but it needs to
                                    be a complete reference to a document followed by 
                                    a hash and the anchor id.
                                 </xsl:for-each>
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern xmlns="http://www.tei-c.org/ns/1.0"
                xmlns:lemdo="http://hcmc.uvic.ca/lemdo/ns"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <sch:rule context="tei:*[matches(@target, '^(pers|pros|bibl):')]">
         <sch:assert test="not(ancestor::tei:listPerson[not(@type='castlist')] or ancestor::tei:listBibl)">
                                 ERROR: Do not link from one entity (person or bibl item) to 
                                 another, because this can cause recursive linking that is 
                                 unmanageable at build time.
                              </sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:diagnostics/>
</sch:schema>
