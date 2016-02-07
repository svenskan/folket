<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8"/>
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
                  <xsl:value-of select="@value"/><xsl:if test="@comment"> [<xsl:value-of select="@comment"/>]</xsl:if>
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
              <span d:priority="2">Pronunciation: |<xsl:value-of select="@value"/>|<br/></span>
            </xsl:for-each>
          </xsl:if>

          <!-- Word class -->
          <xsl:if test="@class">
            <span d:priority="2">
              <xsl:choose>
                <xsl:when test="@class = 'nn'">Word class: substantiv</xsl:when>
                <xsl:when test="@class = 'jj'">Word class: adjektiv</xsl:when>
                <xsl:when test="@class = 'vb'">Word class: verb</xsl:when>
                <xsl:when test="@class = 'in'">Word class: interjektion</xsl:when>
                <xsl:when test="@class = 'pp'">Word class: preposition</xsl:when>
                <xsl:when test="@class = 'pn'">Word class: pronomen</xsl:when>
                <xsl:when test="@class = 'abbrev'">Word class: förkortning</xsl:when>
                <xsl:when test="@class = 'ab'">Word class: adverb</xsl:when>
                <xsl:when test="@class = 'rg'">Word class: grundtal</xsl:when>
                <xsl:when test="@class = ''"></xsl:when>
                <xsl:otherwise>Word class: DEBUG: <xsl:value-of select="@class"/></xsl:otherwise>
              </xsl:choose>
              <br/>
            </span>
          </xsl:if>

          <!-- Synonyms -->
          <xsl:if test="synonym/@value">
            <span d:priority="2">Synonyms: <xsl:for-each select="synonym"><xsl:value-of select="@value"/>, </xsl:for-each><br/></span>
          </xsl:if>

          <!-- Inflections -->
          <xsl:if test="paradigm/inflection/@value">
            <span d:priority="2">Inflections: <xsl:for-each select="paradigm/inflection"><xsl:value-of select="@value"/>, </xsl:for-each><br/></span>
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
                <xsl:if test="translation/@value"> (<xsl:value-of select="translation/@value"/>)</xsl:if>
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <!-- Derivations -->
          <xsl:if test="derivation/@value">
            <xsl:for-each select="derivation">
              <span d:priority="2">Derivation: <xsl:value-of select="@value"/>
                <xsl:if test="translation/@value"> (<xsl:value-of select="translation/@value"/>)</xsl:if>
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <!-- Compounds -->
          <xsl:if test="compound/@value">
            <xsl:for-each select="compound">
              <span d:priority="2">Compound: <xsl:value-of select="@value"/>
                <xsl:if test="translation/@value"> (<xsl:value-of select="translation/@value"/>)</xsl:if>
                <br/>
              </span>
            </xsl:for-each>
          </xsl:if>

          <!-- Explanations -->
          <xsl:if test="explanation/@value">
            <xsl:for-each select="explanation">
              <span d:priority="2">Explanation: <xsl:value-of select="@value"/>
                <xsl:if test="translation/@value"> (<xsl:value-of select="translation/@value"/>)</xsl:if>
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
        <xsl:text>
        </xsl:text>
      </d:entry>

      <xsl:text>
      </xsl:text>
    </d:dictionary>
  </xsl:template>
</xsl:stylesheet>
