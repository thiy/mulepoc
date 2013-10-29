<xsl:stylesheet version="2.0" xmlns:account="http://www.temenos.com/T24/event/T24Integration/Account" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" indent="no" omit-xml-declaration="no"/>

<xsl:template match="/">
  <xsl:for-each select="*">
    <xsl:element name="add">
      <xsl:element name="doc">
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>id</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:id" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>mnemonic</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:mnemonic" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>category</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:categoryList/account:category[contains(@language,'GB')]" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>accountTitle1</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:accountTitle1" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>accountTitle2</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:accountTitle2" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>shortTitle</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:shortTitle" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>customerNo</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:customerNo" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>currency</xsl:text></xsl:attribute>
	        <xsl:value-of select="/account:Account/account:currency" />
	      </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
