<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="utf-8" />
                <title>Tienda de Alcohol - Variados</title>
                <link rel="stylesheet" type="text/css" href="../style.css" />
                <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&amp;family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
            </head>
            <body>
                <header class="main-header">
                    <div class="container header-flex">
                        <a href="../index.html" class="logo-link" style="display: flex; align-items: center; text-decoration: none; color: white;">
                            <img src="../imagenes/logo.png" alt="Logo" style="height: 50px; margin-right: 15px;" />
                            <h1 style="margin: 0; font-size: 1.5rem;">Cazique 500</h1>
                        </a>
                        
                        <nav class="main-nav">
                            <ul>
                                <li><a href="../index.html">Inicio</a></li>
                                <li><a href="../promociones.html">Promociones</a></li>
                                <li><a href="../alcoholes.xml">Variados</a></li> 
                                <li><a href="../contactanos.html">Contacto</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>

                <main class="container">
                    <section class="hero-variados">
                        <h1>Nuestra Selección de Licores</h1>
                        <p>Catálogo siempre actualizado, con las mejores ofertas, listas para el consumidor </p>
                    </section>

                    <section id="catalogo">
                        <ul class="product-grid">
                            <xsl:for-each select="tienda_alcohol/alcoholes/*/*/*">
                                <li class="card">
                                    <h3><xsl:value-of select="translate(name(), '_', ' ')"/></h3>
                                    
                                    <p><xsl:value-of select="."/></p>
                                    
                                    <span class="precio">
                                        <xsl:value-of select="@precio"/>
                                    </span>

                                    <div style="margin-top: 15px;">
                                        <xsl:choose>
                                            <xsl:when test="@disponible='TRUE'">
                                                <a href="../contactanos.html" class="btn-primary">Comprar</a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <span class="agotado" style="color: #d9534f; font-weight: bold;">AGOTADO</span>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </section>
                </main>

                <footer class="main-footer">
                    <p>© 2026 Cazique-500. Prohibida la venta a menores de 18 años.</p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>