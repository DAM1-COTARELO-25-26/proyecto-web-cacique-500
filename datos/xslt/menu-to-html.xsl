<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/tienda_alcohol">
        <html lang="es">
            <head>
                <meta charset="utf-8"/>
                <title>Catálogo Cazique 500</title>
                <link rel="stylesheet" type="text/css" href="../style.css"/>
            </head>
            <body>
                <header><h1>Catálogo Premium y Estándar</h1></header>
                <main>
                    <xsl:apply-templates select="alcoholes/alcohol_no_premium"/>
                    <xsl:apply-templates select="alcoholes/alcohol_premium"/>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="alcohol_no_premium | alcohol_premium">
        <h2>Sección: <xsl:value-of select="name()"/></h2>
        <table border="1">
            <tr>
                <th>Producto</th>
                <th>Descripción</th>
                <th>Precio</th>
            </tr>
            <xsl:for-each select="*/*">
                <xsl:sort select="translate(@precio, '€', '')" data-type="number" order="ascending"/>
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template match="*">
        <tr>
            <td><strong><xsl:value-of select="name()"/></strong></td>
            <td><xsl:value-of select="."/></td>
            <td>
                <xsl:choose>
                    <xsl:when test="translate(@precio, '€', '') > 20">
                        <span class="caro"><xsl:value-of select="@precio"/></span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@precio"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>