<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8"/>

  <xsl:template name="replace">
    <xsl:param name="text"/>
    <xsl:param name="from"/>
    <xsl:param name="into"/>
    <xsl:choose>
      <xsl:when test="contains($text,$from)">
        <xsl:value-of select="substring-before($text,$from)"/>
        <xsl:value-of select="$into"/>
        <xsl:call-template name="replace">
          <xsl:with-param name="text"
            select="substring-after($text,$from)"/>
          <xsl:with-param name="from" select="$from"/>
          <xsl:with-param name="into" select="$into"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="pronunciation">
    <xsl:param name="text"/>
    <xsl:variable name="apos">'</xsl:variable>
    <xsl:variable name="text00" select="$text"/>
    <xsl:variable name="text01">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text00"/>
        <xsl:with-param name="from" select="'&#50;'"/>
        <xsl:with-param name="into" select="'&#xb2;'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text02">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text01"/>
        <xsl:with-param name="from" select="'&#43;'"/>
        <xsl:with-param name="into" select="'_'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text03">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text02"/>
        <xsl:with-param name="from" select="'&#64;'"/>
        <xsl:with-param name="into" select="'ng'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text04">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text03"/>
        <xsl:with-param name="from" select="'&#99;'"/>
        <xsl:with-param name="into" select="'tj'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text05">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text04"/>
        <xsl:with-param name="from" select="'&#36;'"/>
        <xsl:with-param name="into" select="'sj'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text06">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text05"/>
        <xsl:with-param name="from" select="'&#65;'"/>
        <xsl:with-param name="into" select="concat($apos, 'a')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text07">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text06"/>
        <xsl:with-param name="from" select="'&#69;'"/>
        <xsl:with-param name="into" select="concat($apos, 'e')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text08">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text07"/>
        <xsl:with-param name="from" select="'&#73;'"/>
        <xsl:with-param name="into" select="concat($apos, 'i')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text09">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text08"/>
        <xsl:with-param name="from" select="'&#79;'"/>
        <xsl:with-param name="into" select="concat($apos, 'o')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text10">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text09"/>
        <xsl:with-param name="from" select="'&#85;'"/>
        <xsl:with-param name="into" select="concat($apos, 'u')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text11">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text10"/>
        <xsl:with-param name="from" select="'&#89;'"/>
        <xsl:with-param name="into" select="concat($apos, 'y')"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text12">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text11"/>
        <xsl:with-param name="from" select="'&#197;'"/>
        <xsl:with-param name="into" select="'&#xe5;'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text13">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text12"/>
        <xsl:with-param name="from" select="'&#196;'"/>
        <xsl:with-param name="into" select="'&#xe4;'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="text14">
      <xsl:call-template name="replace">
        <xsl:with-param name="text" select="$text13"/>
        <xsl:with-param name="from" select="'&#214;'"/>
        <xsl:with-param name="into" select="'&#xf6;'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$text14"/>
  </xsl:template>

  <xsl:template match="/">
    <d:dictionary xmlns="http://www.w3.org/1999/xhtml" xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
      <xsl:text>
      </xsl:text>
      <xsl:for-each select="dictionary/word">
        <d:entry>
          <xsl:attribute name="id">id_<xsl:number value="position()"/></xsl:attribute>
          <xsl:attribute name="d:title"><xsl:value-of select="@value"/></xsl:attribute>

          <xsl:text>
          </xsl:text>

          <!-- Make sure that the actual word has an index entry -->
          <d:index d:value="{@value}"></d:index>

          <!-- Add all inflections to the search index so we will be able to -->
          <!-- find bil even so we search for bilen. -->
          <xsl:for-each select="paradigm/inflection">
            <xsl:text>
            </xsl:text>
            <d:index d:value="{@value}"></d:index>
          </xsl:for-each>

          <!-- Add all the translations to the search index as well. -->
          <xsl:for-each select="translation[@value!='']">
            <xsl:text>
            </xsl:text>
            <d:index d:value="{@value}"></d:index>
          </xsl:for-each>

          <xsl:text>
          </xsl:text>

          <!-- Header -->
          <h1><xsl:value-of select="@value"/></h1>

          <!-- Translations -->
          <xsl:if test="translation/@value">
            <ol>
              <xsl:for-each select="translation">
                <li>
                  <xsl:value-of select="@value"/>
                  <xsl:if test="@comment">
                    [<xsl:value-of select="@comment"/>]
                  </xsl:if>
                </li>
              </xsl:for-each>
            </ol>
          </xsl:if>

          <!-- Comment -->
          <xsl:if test="@comment">
            <span d:priority="2">Comment: <xsl:value-of select="@comment"/><br/></span>
          </xsl:if>

          <!-- Pronunciations -->
          <xsl:if test="phonetic/@value">
            <xsl:for-each select="phonetic">
              <span d:priority="2">Pronunciation:
                [<xsl:call-template name="pronunciation">
                    <xsl:with-param name="text" select="@value"/>
                </xsl:call-template>]
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <!-- Word class -->
          <xsl:if test="@class">
            <span d:priority="2">Word class:
              <xsl:choose>
                <xsl:when test="@class = 'nn'">substantiv</xsl:when>
                <xsl:when test="@class = 'jj'">adjektiv</xsl:when>
                <xsl:when test="@class = 'vb'">verb</xsl:when>
                <xsl:when test="@class = 'in'">interjektion</xsl:when>
                <xsl:when test="@class = 'pp'">preposition</xsl:when>
                <xsl:when test="@class = 'pn'">pronomen</xsl:when>
                <xsl:when test="@class = 'abbrev'">förkortning</xsl:when>
                <xsl:when test="@class = 'ab'">adverb</xsl:when>
                <xsl:when test="@class = 'rg'">grundtal</xsl:when>
                <xsl:otherwise></xsl:otherwise>
              </xsl:choose>
              <br/>
            </span>
          </xsl:if>

          <!-- Synonyms -->
          <xsl:if test="synonym/@value">
            <span d:priority="2">Synonyms:
              <xsl:for-each select="synonym">
                <xsl:value-of select="@value"/>,
              </xsl:for-each>
              <br/>
            </span>
          </xsl:if>

          <!-- Inflections -->
          <xsl:if test="paradigm/inflection/@value">
            <span d:priority="2">Inflections:
              <xsl:for-each select="paradigm/inflection">
                <xsl:value-of select="@value"/>,
              </xsl:for-each>
              <br/>
            </span>
          </xsl:if>

          <!-- Definitions -->
          <xsl:if test="definition/@value">
            <xsl:for-each select="definition">
              <span>Definition: <xsl:value-of select="@value"/></span>
              <xsl:if test="translation/@value">
                <span> (<xsl:value-of select="translation/@value"/>)</span>
              </xsl:if>
              <br/>
            </xsl:for-each>
          </xsl:if>

          <!-- Examples -->
          <xsl:if test="example/@value">
            <xsl:for-each select="example">
              <span>Example: <xsl:value-of select="@value"/></span>
              <xsl:if test="translation/@value">
                <span> (<xsl:value-of select="translation/@value"/>)</span>
              </xsl:if>
              <br/>
            </xsl:for-each>
          </xsl:if>

          <!-- Idioms -->
          <xsl:if test="idiom/@value">
            <xsl:for-each select="idiom">
              <span d:priority="2">Idiom: <xsl:value-of select="@value"/>
                <xsl:if test="translation/@value">
                  (<xsl:value-of select="translation/@value"/>)
                </xsl:if>
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <!-- Derivations -->
          <xsl:if test="derivation/@value">
            <xsl:for-each select="derivation">
              <span d:priority="2">Derivation: <xsl:value-of select="@value"/>
                <xsl:if test="translation/@value">
                  (<xsl:value-of select="translation/@value"/>)
                </xsl:if>
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <!-- Compounds -->
          <xsl:if test="compound/@value">
            <xsl:for-each select="compound">
              <span d:priority="2">Compound: <xsl:value-of select="@value"/>
                <xsl:if test="translation/@value">
                  (<xsl:value-of select="translation/@value"/>)
                </xsl:if>
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <!-- Explanations -->
          <xsl:if test="explanation/@value">
            <xsl:for-each select="explanation">
              <span d:priority="2">Explanation: <xsl:value-of select="@value"/>
                <xsl:if test="translation/@value">
                  (<xsl:value-of select="translation/@value"/>)
                </xsl:if>
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <xsl:text>
          </xsl:text>
        </d:entry>

        <xsl:text>
        </xsl:text>
      </xsl:for-each>

      <!-- FOOTER -->
      <d:entry id="front_back_matter" d:title="Front/Back Matter">
<h1>Swedish–English</h1>
<p>
  Dictionary from Swedish to English and English to Swedish. With the dataset
  from <a href="http://folkets-lexikon.csc.kth.se/folkets/">Folkets lexikon</a>.
</p>
<p>Author: <a href="http://loessl.org">Christopher Loessl</a></p>
<p>Version: 2.0 (2016-02-07)</p>

<h2>Usage</h2>
<ul>
  <li>Tap a word with three fingers on the touchpad.</li>
  <li>Hover the cursor over a word and press Command-Control-D.</li>
  <li>Open the Dictionary application.</li>
</ul>

<h2>License</h2>
<p>
  The People’s Dictionary is free. Both the
  <a href="folkets_en_sv_public.xml">English-Swedish</a> and
  <a href="folkets_sv_en_public.xml">Swedish-English</a> dictionaries can be
  downloaded for use under the terms of the
  <a href="http://creativecommons.org/licenses/by-sa/2.5/">Creative Commons
  Attribution-Share Alike 2.5 Generic license</a>.
</p>

<p>
  The source code to build this dictionary can be found
  <a href="http://hashier.github.com/MacFolket/">here</a>.
  Christopher Loessl’s homepage can be found at
  <a href="http://loessl.org">http://loessl.org</a>.
</p>
        <xsl:text>
        </xsl:text>
      </d:entry>

      <xsl:text>
      </xsl:text>
    </d:dictionary>
  </xsl:template>
</xsl:stylesheet>
