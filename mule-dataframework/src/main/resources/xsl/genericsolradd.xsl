<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <xsl:for-each select="*">
    <xsl:element name="add">
      <xsl:element name="doc">

  <xsl:for-each select="*">
	<xsl:if test="not(local-name() = 'application') 
		and not(local-name() = 'companyId')
		and not(local-name() = 'operator')
		and not(local-name() = 'today')
		and not(local-name() = 'transactionStage')">
      <xsl:element name="field">
        <xsl:attribute name="name">
          <xsl:value-of select="local-name()"/>
        </xsl:attribute>
        <xsl:value-of select="*" />
      </xsl:element>
	</xsl:if>

  </xsl:for-each>

      <xsl:element name="field">
        <xsl:attribute name="name">table</xsl:attribute>
        <xsl:value-of select="local-name()"/>
      </xsl:element>

      </xsl:element>
    </xsl:element>
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
