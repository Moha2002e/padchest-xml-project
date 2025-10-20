<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    XSLT PRO pour le projet PadChest XML
    Niveau : Pro
    Fonctionnalités : Document structuré, joli, ergonomique
-->

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template racine -->
    <xsl:template match="/">
        <html>
            <head>
                <title>PadChest - Images Radiographiques</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <style>
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    
                    body { 
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
                        line-height: 1.6; 
                        color: #333; 
                        background-color: #f8f9fa;
                    }
                    
                    .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
                    
                    header { 
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white; 
                        padding: 30px 0; 
                        text-align: center; 
                        margin-bottom: 30px;
                        border-radius: 10px;
                        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                    }
                    
                    h1 { font-size: 2.5em; margin-bottom: 10px; }
                    .subtitle { font-size: 1.2em; opacity: 0.9; }
                    
                    .stats { 
                        background: white; 
                        padding: 25px; 
                        border-radius: 10px; 
                        margin-bottom: 30px;
                        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 20px;
                    }
                    
                    .stat-item { 
                        text-align: center; 
                        padding: 15px;
                        background: #f8f9fa;
                        border-radius: 8px;
                        border-left: 4px solid #667eea;
                    }
                    
                    .stat-number { 
                        font-size: 2em; 
                        font-weight: bold; 
                        color: #667eea; 
                        display: block; 
                    }
                    
                    .stat-label { 
                        color: #666; 
                        font-size: 0.9em; 
                        text-transform: uppercase; 
                        letter-spacing: 1px;
                    }
                    
                    .table-container { 
                        background: white; 
                        border-radius: 10px; 
                        overflow: hidden;
                        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                    }
                    
                    table { 
                        width: 100%; 
                        border-collapse: collapse; 
                    }
                    
                    th { 
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white; 
                        padding: 15px 10px; 
                        text-align: left; 
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                        font-size: 0.9em;
                    }
                    
                    td { 
                        padding: 12px 10px; 
                        border-bottom: 1px solid #eee; 
                        vertical-align: top;
                    }
                    
                    tr:hover { background-color: #f8f9fa; }
                    
                    .image-id { 
                        font-family: 'Courier New', monospace; 
                        font-weight: bold; 
                        color: #e74c3c; 
                        font-size: 0.9em;
                    }
                    
                    .label { 
                        display: inline-block;
                        background: #d4edda; 
                        color: #155724;
                        padding: 3px 8px; 
                        margin: 2px; 
                        border-radius: 15px; 
                        font-size: 0.8em;
                        border: 1px solid #c3e6cb;
                    }
                    
                    .location { 
                        display: inline-block;
                        background: #fff3cd; 
                        color: #856404;
                        padding: 3px 8px; 
                        margin: 2px; 
                        border-radius: 15px; 
                        font-size: 0.8em;
                        border: 1px solid #ffeaa7;
                    }
                    
                    .report { 
                        max-width: 250px; 
                        word-wrap: break-word; 
                        font-size: 0.9em;
                        line-height: 1.4;
                    }
                    
                    .projection { 
                        font-weight: bold; 
                        color: #495057;
                    }
                    
                    .pediatric { 
                        color: #dc3545; 
                        font-weight: bold;
                    }
                    
                    .cui { 
                        color: #6c757d; 
                        font-size: 0.8em; 
                        font-family: 'Courier New', monospace;
                    }
                    
                    footer { 
                        text-align: center; 
                        margin-top: 40px; 
                        padding: 20px; 
                        color: #6c757d; 
                        border-top: 1px solid #dee2e6;
                    }
                    
                    @media (max-width: 768px) {
                        .container { padding: 10px; }
                        h1 { font-size: 2em; }
                        .stats { grid-template-columns: 1fr; }
                        table { font-size: 0.9em; }
                        .report { max-width: 150px; }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <header>
                        <h1>🏥 PadChest</h1>
                        <p class="subtitle">Base de Données d'Images Radiographiques Thoraciques</p>
                    </header>
                    
                    <!-- Statistiques améliorées -->
                    <div class="stats">
                        <div class="stat-item">
                            <span class="stat-number"><xsl:value-of select="count(//image)"/></span>
                            <span class="stat-label">Images Total</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number"><xsl:value-of select="count(//location[contains(text(), 'loc right')])"/></span>
                            <span class="stat-label">Localisations Droites</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number"><xsl:value-of select="count(//label)"/></span>
                            <span class="stat-label">Labels Total</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number"><xsl:value-of select="count(//location)"/></span>
                            <span class="stat-label">Localisations Total</span>
                        </div>
                    </div>

                    <!-- Tableau amélioré -->
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>🖼️ Image</th>
                                    <th>👤 Patient</th>
                                    <th>📅 Naissance</th>
                                    <th>📐 Projection</th>
                                    <th>🏷️ Labels</th>
                                    <th>📍 Localisations</th>
                                    <th>📝 Rapport</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//image">
                                    <tr>
                                        <!-- ID Image -->
                                        <td class="image-id">
                                            <xsl:value-of select="@id"/>
                                        </td>
                                        
                                        <!-- Patient ID -->
                                        <td>
                                            <xsl:value-of select="patient/id"/>
                                        </td>
                                        
                                        <!-- Année de naissance -->
                                        <td>
                                            <xsl:value-of select="patient/birth"/>
                                        </td>
                                        
                                        <!-- Projection -->
                                        <td class="projection">
                                            <xsl:value-of select="study/projection"/>
                                        </td>
                                        
                                        <!-- Labels -->
                                        <td>
                                            <xsl:for-each select="diagnosis/labels/label">
                                                <span class="label">
                                                    <xsl:value-of select="."/>
                                                    <xsl:if test="@cui">
                                                        <span class="cui"> (<xsl:value-of select="@cui"/>)</span>
                                                    </xsl:if>
                                                </span>
                                            </xsl:for-each>
                                            <xsl:if test="count(diagnosis/labels/label) = 0">
                                                <em style="color: #6c757d;">Aucun label</em>
                                            </xsl:if>
                                        </td>
                                        
                                        <!-- Localisations -->
                                        <td>
                                            <xsl:for-each select="diagnosis/localizations/location">
                                                <span class="location">
                                                    <xsl:value-of select="."/>
                                                    <xsl:if test="@cui">
                                                        <span class="cui"> (<xsl:value-of select="@cui"/>)</span>
                                                    </xsl:if>
                                                </span>
                                            </xsl:for-each>
                                            <xsl:if test="count(diagnosis/localizations/location) = 0">
                                                <em style="color: #6c757d;">Aucune localisation</em>
                                            </xsl:if>
                                        </td>
                                        
                                        <!-- Rapport -->
                                        <td class="report">
                                            <xsl:value-of select="report"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                    <footer>
                        <p><strong>Projet PadChest XML</strong> - HEPL 2024</p>
                        <p>Généré le <xsl:value-of select="//images/@created"/></p>
                    </footer>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
