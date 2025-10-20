<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    XSLT MINIMUM pour le projet PadChest XML
    Niveau : Minimum requis
    Fonctionnalité : Tableau simple et fonctionnel
-->

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template racine -->
    <xsl:template match="/">
        <html>
            <head>
                <title>PadChest - Images Radiographiques</title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <h1>PadChest - Base de Données d'Images Radiographiques</h1>
                
                <!-- Statistiques simples -->
                <p><strong>Nombre total d'images :</strong> <xsl:value-of select="count(//image)"/></p>
                <p><strong>Images avec "loc right" :</strong> 
                   <xsl:value-of select="count(//location[contains(text(), 'loc right')])"/>
                </p>

                <!-- Tableau simple -->
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr style="background-color: #cccccc;">
                        <th>ID Image</th>
                        <th>Patient ID</th>
                        <th>Année Naissance</th>
                        <th>Projection</th>
                        <th>Labels</th>
                        <th>Localisations</th>
                        <th>Rapport</th>
                    </tr>
                    
                    <xsl:for-each select="//image">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="patient/id"/></td>
                            <td><xsl:value-of select="patient/birth"/></td>
                            <td><xsl:value-of select="study/projection"/></td>
                            <td>
                                <xsl:for-each select="diagnosis/labels/label">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="diagnosis/localizations/location">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </td>
                            <td><xsl:value-of select="report"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <p><em>Projet PadChest XML - HEPL 2024</em></p>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
