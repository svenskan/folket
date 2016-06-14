<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8"/>

  <xsl:template name="replace">
    <xsl:param name="text"/>
    <xsl:param name="from"/>
    <xsl:param name="into"/>
    <xsl:choose>
      <xsl:when test="contains($text, $from)">
        <xsl:value-of select="substring-before($text, $from)"/>
        <xsl:value-of select="$into"/>
        <xsl:call-template name="replace">
          <xsl:with-param name="text"
            select="substring-after($text, $from)"/>
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
      <xsl:for-each select="dictionary/word">
        <d:entry class="entry">
          <xsl:attribute name="id">id_<xsl:number value="position()"/></xsl:attribute>
          <xsl:attribute name="d:title"><xsl:value-of select="@value"/></xsl:attribute>

          <!-- Make sure that the actual word has an index entry -->
          <d:index d:value="{@value}"></d:index>

          <!-- Add all inflections to the search index so we will be able to -->
          <!-- find bil even so we search for bilen -->
          <xsl:for-each select="paradigm/inflection">
            <d:index d:value="{@value}"></d:index>
          </xsl:for-each>

          <!-- Add all the translations to the search index as well -->
          <xsl:for-each select="translation[@value!='']">
            <d:index d:value="{@value}"></d:index>
          </xsl:for-each>

          <!-- Header -->
          <h1>
            <xsl:value-of select="@value"/>

            <!-- Pronunciations -->
            <xsl:if test="phonetic/@value">
              <xsl:for-each select="phonetic">
                <span class="pronunciation">
                  <xsl:call-template name="pronunciation">
                    <xsl:with-param name="text" select="@value"/>
                  </xsl:call-template>
                </span>
              </xsl:for-each>
            </xsl:if>
          </h1>

          <!-- Part of speech -->
          <xsl:if test="@class != ''">
            <p class="part-of-speech" d:priority="2">
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
            </p>
          </xsl:if>

          <!-- Translations -->
          <xsl:if test="translation/@value">
            <ul class="translations">
              <xsl:for-each select="translation">
                <li>
                  <xsl:value-of select="@value"/>
                  <xsl:if test="@comment">
                    (<xsl:value-of select="@comment"/>)
                  </xsl:if>
                </li>
              </xsl:for-each>
            </ul>
          </xsl:if>

          <!-- Comment -->
          <xsl:if test="@comment">
            <p d:priority="2">
              <em>Comment:</em>
              <xsl:value-of select="@comment"/>
            </p>
          </xsl:if>

          <!-- Synonyms -->
          <xsl:if test="synonym/@value">
            <p d:priority="2">
              <em>Synonym:</em>
              <xsl:for-each select="synonym">
                <xsl:value-of select="@value"/><xsl:if test="position() != last()">, </xsl:if>
              </xsl:for-each>
            </p>
          </xsl:if>

          <!-- Inflections -->
          <xsl:if test="paradigm/inflection/@value">
            <p d:priority="2">
              <em>Inflection:</em>
              <xsl:for-each select="paradigm/inflection">
                <xsl:value-of select="@value"/><xsl:if test="position() != last()">, </xsl:if>
              </xsl:for-each>
            </p>
          </xsl:if>

          <!-- Definitions -->
          <xsl:if test="definition/@value">
            <p d:priority="2">
              <em>Definition:</em>
              <xsl:for-each select="definition">
                <span class="element">
                  <xsl:value-of select="@value"/>
                  <xsl:if test="translation/@value">
                    (<xsl:value-of select="translation/@value"/>)
                  </xsl:if>
                </span>
              </xsl:for-each>
            </p>
          </xsl:if>

          <!-- Examples -->
          <xsl:if test="example/@value">
            <p d:priority="2">
              <em>Example:</em>
              <xsl:for-each select="example">
                <span class="element">
                  <xsl:value-of select="@value"/>
                  <xsl:if test="translation/@value">
                    (<xsl:value-of select="translation/@value"/>)
                  </xsl:if>
                </span>
              </xsl:for-each>
            </p>
          </xsl:if>

          <!-- Idioms -->
          <xsl:if test="idiom/@value">
            <p d:priority="2">
              <em>Idiom:</em>
              <xsl:for-each select="idiom">
                <span class="element">
                  <xsl:value-of select="@value"/>
                  <xsl:if test="translation/@value">
                    (<xsl:value-of select="translation/@value"/>)
                  </xsl:if>
                </span>
              </xsl:for-each>
            </p>
          </xsl:if>

          <!-- Derivations -->
          <xsl:if test="derivation/@value">
            <p d:priority="2">
              <em>Derivation:</em>
              <xsl:for-each select="derivation">
                <span class="element">
                  <xsl:value-of select="@value"/>
                  <xsl:if test="translation/@value">
                    (<xsl:value-of select="translation/@value"/>)
                  </xsl:if>
                </span>
              </xsl:for-each>
            </p>
          </xsl:if>

          <!-- Compounds -->
          <xsl:if test="compound/@value">
            <p d:priority="2">
              <em>Compound:</em>
              <xsl:for-each select="compound">
                <span class="element">
                  <xsl:value-of select="@value"/>
                  <xsl:if test="translation/@value">
                    (<xsl:value-of select="translation/@value"/>)
                  </xsl:if>
                </span>
              </xsl:for-each>
            </p>
          </xsl:if>

          <!-- Explanations -->
          <xsl:if test="explanation/@value">
            <p d:priority="2">
              <em>Explanation:</em>
              <xsl:for-each select="explanation">
                <span class="element">
                  <xsl:value-of select="@value"/>
                  <xsl:if test="translation/@value">
                    (<xsl:value-of select="translation/@value"/>)
                  </xsl:if>
                </span>
              </xsl:for-each>
            </p>
          </xsl:if>
        </d:entry>
      </xsl:for-each>

      <!-- Footer -->
      <d:entry id="front_back_matter" d:title="Front/Back Matter">
<h1>Folket</h1>
<p>Folket is a Swedish–English dictionary for macOS.</p>
<p>
  <em>Author:</em>
  <a href="http://loessl.org">Christopher Loessl</a> and
  <a href="https://github.com/IvanUkhov">Ivan Ukhov</a>
</p>
<p>
  <em>Version:</em>
  2.0
</p>

<h2>Usage</h2>
<ul>
  <li>Tap a word with three fingers on the trackpad.</li>
  <li>Hover the cursor over a word and press ⌃⌘D.</li>
  <li>Open the Dictionary app and type a work.</li>
</ul>

<h2>License</h2>
<p>
  Folket is based on the
  <a href="http://folkets-lexikon.csc.kth.se/folkets/folkets.en.html">People’s
  Dictionary</a> (Folkets lexikon). The People’s Dictionary is free. Both the
  English–Swedish and Swedish–English dictionaries can be
  <a href="http://folkets-lexikon.csc.kth.se/folkets/om.en.html">downloaded</a>
  for use under the terms of the
  <a href="http://creativecommons.org/licenses/by-sa/2.5">Creative Commons
  Attribution-Share Alike 2.5 Generic</a> license. Folket is distributed under
  the same terms, and its source code can be found on
  <a href="https://github.com/svenskan/folket">GitHub</a>.
</p>
      </d:entry>
    </d:dictionary>
  </xsl:template>
</xsl:stylesheet>
