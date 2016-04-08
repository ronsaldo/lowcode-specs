<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
 
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
 
  <xsl:template match="/lowcode">
    <html>
      <head>
        <title>Cog Lowcode Documentation</title>
        <link rel="stylesheet" href="lowcode.css" type="text/css" />
      </head>
      <body>
        <h1>Cog Lowcode Documentation</h1>
        <div id="description">
            <xsl:apply-templates select="description" />
        </div>

        <div id="instruction-table">
          <h2>Lowcode Instruction Set Table</h2>
          <table>
            <tr>
              <th>Opcode</th>
              <th>Mnemonic</th>
              <th>Name</th>
            </tr>
            <xsl:for-each select="instruction">
              <tr>
                <td><xsl:value-of select="@opcode"/></td>
                <td>
                  <a>
                    <xsl:attribute name="href">#spec-of-<xsl:value-of select="@mnemonic"/>
                    </xsl:attribute>
                    <xsl:value-of select="@mnemonic"/>
                  </a>
                </td>
                <td><xsl:value-of select="name"/></td>
              </tr>
            </xsl:for-each>
          </table>
        </div>

        <div id="instruction-specs">
          <h2>Lowcode Instruction Specification</h2>
          <xsl:apply-templates select="instruction"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="instruction">
    <div class="instruction-spec">
      <xsl:attribute name="id">spec-of-<xsl:value-of select="@mnemonic"/>
      </xsl:attribute>
      <h3>[<xsl:value-of select="@opcode" />] <xsl:value-of select="@mnemonic"/> - <xsl:value-of select="name"/></h3>
      <p><xsl:value-of select="description"/></p>

      <xsl:apply-templates select="warning"/>
      <xsl:apply-templates select="arguments"/>
      <xsl:apply-templates select="stack-arguments"/>
      <xsl:apply-templates select="stack-results"/>
      <xsl:apply-templates select="semantic"/>
    </div>
  </xsl:template>

  <xsl:template match="arguments">
    <h4>Arguments</h4>
    <table>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
      </tr>
      <xsl:apply-templates />
    </table>
  </xsl:template>

  <xsl:template match="stack-arguments">
    <h4>Stack Arguments</h4>
    <table>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
      </tr>
      <xsl:apply-templates />
    </table>
  </xsl:template>

  <xsl:template match="stack-results">
    <h4>Stack Results</h4>
    <table>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
      </tr>
      <xsl:apply-templates />
    </table>
  </xsl:template>

  <xsl:template match="extend-a">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Extension A</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="extend-b">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Extension B</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="oop">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Object</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="int32">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Int32</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="int64">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Int64</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="pointer">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Pointer</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="float32">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Float32</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="float64">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td>Float64</td>
      <td><xsl:value-of select="@description"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="semantic">
    <div class="semantic">
      <h4><xsl:value-of select="@language"/> Semantics</h4>
      <code>
        <xsl:value-of select="."/>
      </code>
    </div>
  </xsl:template>

  <xsl:template match="warning">
    <span class="warning">WARNING: <xsl:value-of select="."/></span>
  </xsl:template>

  <xsl:template match="p">
    <p><xsl:value-of select="." /></p>
  </xsl:template>

  <xsl:template match="br">
    <br/>
  </xsl:template>

</xsl:stylesheet>

