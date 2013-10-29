<xsl:stylesheet version="2.0" xmlns:customer="http://www.temenos.com/T24/event/T24Integration/Customer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" indent="no" omit-xml-declaration="no"/>

<xsl:template match="/">
  <xsl:for-each select="*">
    <xsl:element name="add">
      <xsl:element name="doc">
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>id</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:id" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>name</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:shortNameList/customer:shortName[contains(@language,'GB')]" />
	        <xsl:text> </xsl:text>
	        <xsl:value-of select="/customer:Customer/customer:name1List/customer:name1[contains(@language,'GB')]" />
	        <xsl:text> </xsl:text>
	        <xsl:value-of select="/customer:Customer/customer:name2List/customer:name2[contains(@language,'GB')]" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>mnemonic</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:mnemonic" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>address</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:streetList/customer:street[contains(@language,'GB')]" />
	      </xsl:element>
	      <xsl:element name="field">
	        <xsl:attribute name="name"><xsl:text>postcode</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:postCodeList/customer:postCode[contains(@language,'GB')]" />
	      </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
