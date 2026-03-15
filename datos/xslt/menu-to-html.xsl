<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html lang="es">
        <head>
            <title>Catálogo de Alcoholes - Proyecto</title>
            <link rel="stylesheet" type="text/css" href="../style.css"/>
        </head>
        <body>
            <header class="main-header">
                <h1>Catálogo Generado Dinámicamente</h1>
            </header>

            <main class="container">
                <section class="section-card">
                    <h2>Resumen de Stock</h2>
                    <p>Total de productos Premium disponibles: 
                       <strong><xsl:value-of select="count(//alcohol_premium//*[@disponible='TRUE'])"/></strong>
                    </p>
                </section>

                <section>
                    <h2>Nuestros Rones (Ordenados por Precio)</h2>
                    <table class="product-table">
                        <thead>
                            <tr>
                                <th>Marca</th>
                                <th>Precio</th>
                                <th>Descripción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="//rones/*">
                                <xsl:sort select="translate(@precio, '€', '')" data-type="number" order="ascending"/>
                                
                                <xsl:if test="@disponible='TRUE'">
                                    <tr>
                                        <xsl:if test="translate(@precio, '€', '') > 30">
                                            <xsl:attribute name="style">background-color: #fce4ec; color: #800020;</xsl:attribute>
                                        </xsl:if>
                                        
                                        <td><xsl:value-of select="name()"/></td>
                                        <td><xsl:value-of select="@precio"/></td>
                                        <td><xsl:value-of select="."/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </section>

                <section>
                    <h2>Whiskeys Destacados</h2>
                    <xsl:apply-templates select="//Whiskey/*"/>
                </section>
            </main>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="Whiskey/*">
        <div class="card" style="margin-bottom: 10px; padding: 10px; border-left: 5px solid #800020;">
            <strong><xsl:value-of select="name()"/></strong> - <xsl:value-of select="@precio"/>
            <p><xsl:value-of select="."/></p>
        </div>
    </xsl:template>

</xsl:stylesheet>