<xsl:stylesheet version="2.0" xmlns:customer="http://www.temenos.com/T24/event/T24Integration/Customer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" indent="no" omit-xml-declaration="no"/>

<xsl:template match="/">
  <xsl:for-each select="*">
    <xsl:element name="database">
      <xsl:element name="table">
		<xsl:attribute name="tableName"><xsl:text>customer_stage</xsl:text></xsl:attribute>
		<xsl:attribute name="action"><xsl:text>insert</xsl:text></xsl:attribute>
	      <xsl:element name="column">
	        <xsl:attribute name="columnName"><xsl:text>id</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:id" />
	      </xsl:element>
	      <xsl:element name="column">
	        <xsl:attribute name="columnName"><xsl:text>shortname</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:shortNameList/customer:shortName[contains(@language,'GB')]" />
	      </xsl:element>
	      <xsl:element name="column">
	        <xsl:attribute name="columnName"><xsl:text>name1</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:name1List/customer:name1[contains(@language,'GB')]" />
	      </xsl:element>
	      <xsl:element name="column">
	        <xsl:attribute name="columnName"><xsl:text>name2</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:name2List/customer:name2[contains(@language,'GB')]" />
	      </xsl:element>
	      <xsl:element name="column">
	        <xsl:attribute name="columnName"><xsl:text>mnemonic</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:mnemonic" />
	      </xsl:element>
	      <xsl:element name="column">
	        <xsl:attribute name="columnName"><xsl:text>address</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:streetList/customer:street[contains(@language,'GB')]" />
	      </xsl:element>
	      <xsl:element name="column">
	        <xsl:attribute name="columnName"><xsl:text>postcode</xsl:text></xsl:attribute>
	        <xsl:value-of select="/customer:Customer/customer:postCodeList/customer:postCode[contains(@language,'GB')]" />
	      </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
