<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    XSLT EXPERT pour le projet PadChest XML
    Niveau : Expert
    Fonctionnalités : CSS/JS avancés, interactivité, recherche, filtres, graphiques
-->

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template racine -->
    <xsl:template match="/">
        <html>
            <head>
                <title>PadChest - Images Radiographiques (Expert)</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                
                <!-- Chart.js pour les graphiques -->
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                
                <!-- Font Awesome pour les icônes -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
                
                <style>
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    
                    body { 
                        font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
                        line-height: 1.6; 
                        color: #2c3e50; 
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        min-height: 100vh;
                    }
                    
                    .container { max-width: 1400px; margin: 0 auto; padding: 20px; }
                    
                    header { 
                        background: rgba(255,255,255,0.95);
                        backdrop-filter: blur(10px);
                        color: #2c3e50; 
                        padding: 30px 0; 
                        text-align: center; 
                        margin-bottom: 30px;
                        border-radius: 20px;
                        box-shadow: 0 8px 32px rgba(0,0,0,0.1);
                        border: 1px solid rgba(255,255,255,0.2);
                    }
                    
                    h1 { font-size: 3em; margin-bottom: 10px; background: linear-gradient(135deg, #667eea, #764ba2); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
                    .subtitle { font-size: 1.3em; color: #7f8c8d; }
                    
                    .controls { 
                        background: rgba(255,255,255,0.95);
                        backdrop-filter: blur(10px);
                        padding: 25px; 
                        border-radius: 15px; 
                        margin-bottom: 30px;
                        box-shadow: 0 8px 32px rgba(0,0,0,0.1);
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                        gap: 20px;
                        align-items: center;
                    }
                    
                    .search-box { 
                        position: relative;
                    }
                    
                    .search-box input { 
                        width: 100%; 
                        padding: 12px 45px 12px 15px; 
                        border: 2px solid #e9ecef; 
                        border-radius: 25px; 
                        font-size: 1em;
                        transition: all 0.3s ease;
                    }
                    
                    .search-box input:focus { 
                        outline: none; 
                        border-color: #667eea; 
                        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                    }
                    
                    .search-box i { 
                        position: absolute; 
                        right: 15px; 
                        top: 50%; 
                        transform: translateY(-50%); 
                        color: #6c757d; 
                    }
                    
                    .filter-select { 
                        padding: 12px 15px; 
                        border: 2px solid #e9ecef; 
                        border-radius: 25px; 
                        font-size: 1em;
                        background: white;
                        transition: all 0.3s ease;
                    }
                    
                    .filter-select:focus { 
                        outline: none; 
                        border-color: #667eea; 
                        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                    }
                    
                    .stats-grid { 
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 20px;
                        margin-bottom: 30px;
                    }
                    
                    .stat-card { 
                        background: rgba(255,255,255,0.95);
                        backdrop-filter: blur(10px);
                        padding: 25px; 
                        border-radius: 15px;
                        text-align: center;
                        box-shadow: 0 8px 32px rgba(0,0,0,0.1);
                        border: 1px solid rgba(255,255,255,0.2);
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }
                    
                    .stat-card:hover { 
                        transform: translateY(-5px); 
                        box-shadow: 0 12px 40px rgba(0,0,0,0.15);
                    }
                    
                    .stat-number { 
                        font-size: 2.5em; 
                        font-weight: bold; 
                        background: linear-gradient(135deg, #667eea, #764ba2);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        display: block; 
                    }
                    
                    .stat-label { 
                        color: #7f8c8d; 
                        font-size: 0.9em; 
                        text-transform: uppercase; 
                        letter-spacing: 1px;
                        margin-top: 5px;
                    }
                    
                    .charts-container { 
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
                        gap: 30px;
                        margin-bottom: 30px;
                    }
                    
                    .chart-card { 
                        background: rgba(255,255,255,0.95);
                        backdrop-filter: blur(10px);
                        padding: 25px; 
                        border-radius: 15px;
                        box-shadow: 0 8px 32px rgba(0,0,0,0.1);
                        border: 1px solid rgba(255,255,255,0.2);
                    }
                    
                    .chart-title { 
                        font-size: 1.2em; 
                        font-weight: bold; 
                        margin-bottom: 20px; 
                        color: #2c3e50;
                        text-align: center;
                    }
                    
                    .table-container { 
                        background: rgba(255,255,255,0.95);
                        backdrop-filter: blur(10px);
                        border-radius: 15px; 
                        overflow: hidden;
                        box-shadow: 0 8px 32px rgba(0,0,0,0.1);
                        border: 1px solid rgba(255,255,255,0.2);
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
                        position: sticky;
                        top: 0;
                        z-index: 10;
                    }
                    
                    td { 
                        padding: 12px 10px; 
                        border-bottom: 1px solid #f1f3f4; 
                        vertical-align: top;
                        transition: background-color 0.2s ease;
                    }
                    
                    tr:hover { background-color: rgba(102, 126, 234, 0.05); }
                    
                    .image-id { 
                        font-family: 'JetBrains Mono', 'Courier New', monospace; 
                        font-weight: bold; 
                        color: #e74c3c; 
                        font-size: 0.85em;
                        background: rgba(231, 76, 60, 0.1);
                        padding: 4px 8px;
                        border-radius: 6px;
                    }
                    
                    .label { 
                        display: inline-block;
                        background: linear-gradient(135deg, #d4edda, #c3e6cb); 
                        color: #155724;
                        padding: 4px 10px; 
                        margin: 2px; 
                        border-radius: 20px; 
                        font-size: 0.8em;
                        border: 1px solid #c3e6cb;
                        transition: transform 0.2s ease;
                    }
                    
                    .label:hover { transform: scale(1.05); }
                    
                    .location { 
                        display: inline-block;
                        background: linear-gradient(135deg, #fff3cd, #ffeaa7); 
                        color: #856404;
                        padding: 4px 10px; 
                        margin: 2px; 
                        border-radius: 20px; 
                        font-size: 0.8em;
                        border: 1px solid #ffeaa7;
                        transition: transform 0.2s ease;
                    }
                    
                    .location:hover { transform: scale(1.05); }
                    
                    .report { 
                        max-width: 300px; 
                        word-wrap: break-word; 
                        font-size: 0.9em;
                        line-height: 1.4;
                        background: rgba(108, 117, 125, 0.05);
                        padding: 8px;
                        border-radius: 6px;
                    }
                    
                    .projection { 
                        font-weight: bold; 
                        color: #495057;
                        background: rgba(73, 80, 87, 0.1);
                        padding: 4px 8px;
                        border-radius: 6px;
                    }
                    
                    .cui { 
                        color: #6c757d; 
                        font-size: 0.75em; 
                        font-family: 'JetBrains Mono', 'Courier New', monospace;
                        background: rgba(108, 117, 125, 0.1);
                        padding: 2px 4px;
                        border-radius: 4px;
                    }
                    
                    .loading { 
                        text-align: center; 
                        padding: 50px; 
                        color: #6c757d;
                        font-size: 1.2em;
                    }
                    
                    .no-results { 
                        text-align: center; 
                        padding: 50px; 
                        color: #6c757d;
                        font-size: 1.2em;
                        display: none;
                    }
                    
                    .pagination { 
                        display: flex; 
                        justify-content: center; 
                        align-items: center; 
                        gap: 10px; 
                        margin-top: 20px; 
                        padding: 20px;
                    }
                    
                    .pagination button { 
                        padding: 8px 12px; 
                        border: 2px solid #e9ecef; 
                        background: white; 
                        border-radius: 6px; 
                        cursor: pointer;
                        transition: all 0.3s ease;
                    }
                    
                    .pagination button:hover:not(:disabled) { 
                        border-color: #667eea; 
                        background: #667eea; 
                        color: white;
                    }
                    
                    .pagination button:disabled { 
                        opacity: 0.5; 
                        cursor: not-allowed;
                    }
                    
                    .pagination .active { 
                        background: #667eea; 
                        color: white; 
                        border-color: #667eea;
                    }
                    
                    footer { 
                        text-align: center; 
                        margin-top: 40px; 
                        padding: 30px; 
                        color: rgba(255,255,255,0.8);
                        background: rgba(255,255,255,0.1);
                        backdrop-filter: blur(10px);
                        border-radius: 15px;
                    }
                    
                    @media (max-width: 768px) {
                        .container { padding: 10px; }
                        h1 { font-size: 2em; }
                        .controls { grid-template-columns: 1fr; }
                        .charts-container { grid-template-columns: 1fr; }
                        .stats-grid { grid-template-columns: repeat(2, 1fr); }
                        table { font-size: 0.85em; }
                        .report { max-width: 200px; }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <header>
                        <h1><i class="fas fa-x-ray"></i> PadChest Expert</h1>
                        <p class="subtitle">Base de Données d'Images Radiographiques Thoraciques - Version Interactive</p>
                    </header>
                    
                    <!-- Contrôles de recherche et filtres -->
                    <div class="controls">
                        <div class="search-box">
                            <input type="text" id="searchInput" placeholder="Rechercher dans les images..."/>
                            <i class="fas fa-search"></i>
                        </div>
                        <select class="filter-select" id="projectionFilter">
                            <option value="">Toutes les projections</option>
                            <option value="PA">PA</option>
                            <option value="AP">AP</option>
                            <option value="LATERAL">LATERAL</option>
                            <option value="POSTEROANTERIOR">POSTEROANTERIOR</option>
                        </select>
                        <select class="filter-select" id="labelFilter">
                            <option value="">Tous les labels</option>
                            <option value="normal">Normal</option>
                            <option value="pneumonia">Pneumonia</option>
                            <option value="chronic changes">Chronic Changes</option>
                            <option value="pulmonary fibrosis">Pulmonary Fibrosis</option>
                        </select>
                        <button onclick="resetFilters()" style="padding: 12px 20px; background: #dc3545; color: white; border: none; border-radius: 25px; cursor: pointer;">
                            <i class="fas fa-refresh"></i> Reset
                        </button>
                    </div>
                    
                    <!-- Statistiques avec animations -->
                    <div class="stats-grid">
                        <div class="stat-card">
                            <span class="stat-number" id="totalImages"><xsl:value-of select="count(//image)"/></span>
                            <span class="stat-label"><i class="fas fa-images"></i> Images Total</span>
                        </div>
                        <div class="stat-card">
                            <span class="stat-number" id="locRightCount"><xsl:value-of select="count(//location[contains(text(), 'loc right')])"/></span>
                            <span class="stat-label"><i class="fas fa-map-marker-alt"></i> Localisations Droites</span>
                        </div>
                        <div class="stat-card">
                            <span class="stat-number" id="totalLabels"><xsl:value-of select="count(//label)"/></span>
                            <span class="stat-label"><i class="fas fa-tags"></i> Labels Total</span>
                        </div>
                        <div class="stat-card">
                            <span class="stat-number" id="totalLocations"><xsl:value-of select="count(//location)"/></span>
                            <span class="stat-label"><i class="fas fa-crosshairs"></i> Localisations Total</span>
                        </div>
                    </div>

                    <!-- Graphiques interactifs -->
                    <div class="charts-container">
                        <div class="chart-card">
                            <div class="chart-title"><i class="fas fa-chart-pie"></i> Répartition des Projections</div>
                            <canvas id="projectionChart" width="400" height="200"></canvas>
                        </div>
                        <div class="chart-card">
                            <div class="chart-title"><i class="fas fa-chart-bar"></i> Top 10 Labels</div>
                            <canvas id="labelsChart" width="400" height="200"></canvas>
                        </div>
                    </div>

                    <!-- Tableau interactif -->
                    <div class="table-container">
                        <div class="loading" id="loadingIndicator">Chargement des données...</div>
                        <div class="no-results" id="noResults">Aucun résultat trouvé</div>
                        
                        <table id="dataTable" style="display: none;">
                            <thead>
                                <tr>
                                    <th><i class="fas fa-image"></i> Image</th>
                                    <th><i class="fas fa-user"></i> Patient</th>
                                    <th><i class="fas fa-calendar"></i> Naissance</th>
                                    <th><i class="fas fa-project-diagram"></i> Projection</th>
                                    <th><i class="fas fa-tags"></i> Labels</th>
                                    <th><i class="fas fa-map-marker-alt"></i> Localisations</th>
                                    <th><i class="fas fa-file-medical"></i> Rapport</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
                                <xsl:for-each select="//image">
                                    <tr class="data-row">
                                        <td class="image-id">
                                            <xsl:value-of select="@id"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="patient/id"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="patient/birth"/>
                                        </td>
                                        <td class="projection">
                                            <xsl:value-of select="study/projection"/>
                                        </td>
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
                                        <td class="report">
                                            <xsl:value-of select="report"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                        
                        <!-- Pagination -->
                        <div class="pagination" id="pagination" style="display: none;">
                            <button id="prevBtn" onclick="changePage(-1)"><i class="fas fa-chevron-left"></i></button>
                            <span id="pageInfo">Page 1 sur 1</span>
                            <button id="nextBtn" onclick="changePage(1)"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>
                    
                    <footer>
                        <p><strong><i class="fas fa-graduation-cap"></i> Projet PadChest XML</strong> - HEPL 2024</p>
                        <p>Généré le <xsl:value-of select="//images/@created"/> | Version Expert avec fonctionnalités interactives</p>
                    </footer>
                </div>

                <!-- JavaScript pour l'interactivité -->
                <script>
                    // Variables globales
                    let allRows = [];
                    let filteredRows = [];
                    let currentPage = 1;
                    const rowsPerPage = 10;
                    
                    // Initialisation
                    document.addEventListener('DOMContentLoaded', function() {
                        initializeData();
                        setupEventListeners();
                        initializeCharts();
                        showTable();
                    });
                    
                    function initializeData() {
                        allRows = Array.from(document.querySelectorAll('.data-row'));
                        filteredRows = [...allRows];
                    }
                    
                    function setupEventListeners() {
                        document.getElementById('searchInput').addEventListener('input', filterData);
                        document.getElementById('projectionFilter').addEventListener('change', filterData);
                        document.getElementById('labelFilter').addEventListener('change', filterData);
                    }
                    
                    function filterData() {
                        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
                        const projectionFilter = document.getElementById('projectionFilter').value;
                        const labelFilter = document.getElementById('labelFilter').value;
                        
                        filteredRows = allRows.filter(row => {
                            const text = row.textContent.toLowerCase();
                            const projection = row.querySelector('.projection').textContent;
                            const labels = row.querySelectorAll('.label');
                            const labelTexts = Array.from(labels).map(label => label.textContent.toLowerCase());
                            
                            return text.includes(searchTerm) &&
                                   (projectionFilter === '' || projection === projectionFilter) &&
                                   (labelFilter === '' || labelTexts.some(label => label.includes(labelFilter)));
                        });
                        
                        currentPage = 1;
                        updateTable();
                        updateStats();
                    }
                    
                    function updateTable() {
                        const tableBody = document.getElementById('tableBody');
                        const noResults = document.getElementById('noResults');
                        const dataTable = document.getElementById('dataTable');
                        const pagination = document.getElementById('pagination');
                        
                        // Masquer toutes les lignes
                        allRows.forEach(row => row.style.display = 'none');
                        
                        if (filteredRows.length === 0) {
                            noResults.style.display = 'block';
                            dataTable.style.display = 'none';
                            pagination.style.display = 'none';
                            return;
                        }
                        
                        noResults.style.display = 'none';
                        dataTable.style.display = 'table';
                        
                        // Calculer la pagination
                        const startIndex = (currentPage - 1) * rowsPerPage;
                        const endIndex = startIndex + rowsPerPage;
                        const pageRows = filteredRows.slice(startIndex, endIndex);
                        
                        // Afficher les lignes de la page courante
                        pageRows.forEach(row => row.style.display = 'table-row');
                        
                        // Mettre à jour la pagination
                        updatePagination();
                    }
                    
                    function updatePagination() {
                        const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
                        const pageInfo = document.getElementById('pageInfo');
                        const prevBtn = document.getElementById('prevBtn');
                        const nextBtn = document.getElementById('nextBtn');
                        const pagination = document.getElementById('pagination');
                        
                        if (totalPages <= 1) {
                            pagination.style.display = 'none';
                            return;
                        }
                        
                        pagination.style.display = 'flex';
                        pageInfo.textContent = `Page ${currentPage} sur ${totalPages}`;
                        prevBtn.disabled = currentPage === 1;
                        nextBtn.disabled = currentPage === totalPages;
                    }
                    
                    function changePage(direction) {
                        const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
                        const newPage = currentPage + direction;
                        
                        if (newPage >= 1 && newPage <= totalPages) {
                            currentPage = newPage;
                            updateTable();
                        }
                    }
                    
                    function updateStats() {
                        document.getElementById('totalImages').textContent = filteredRows.length;
                        
                        const locRightCount = filteredRows.filter(row => 
                            row.textContent.includes('loc right')
                        ).length;
                        document.getElementById('locRightCount').textContent = locRightCount;
                        
                        const totalLabels = filteredRows.reduce((count, row) => 
                            count + row.querySelectorAll('.label').length, 0);
                        document.getElementById('totalLabels').textContent = totalLabels;
                        
                        const totalLocations = filteredRows.reduce((count, row) => 
                            count + row.querySelectorAll('.location').length, 0);
                        document.getElementById('totalLocations').textContent = totalLocations;
                    }
                    
                    function resetFilters() {
                        document.getElementById('searchInput').value = '';
                        document.getElementById('projectionFilter').value = '';
                        document.getElementById('labelFilter').value = '';
                        filterData();
                    }
                    
                    function initializeCharts() {
                        // Graphique des projections
                        const projectionCtx = document.getElementById('projectionChart').getContext('2d');
                        const projectionData = {};
                        
                        allRows.forEach(row => {
                            const projection = row.querySelector('.projection').textContent;
                            projectionData[projection] = (projectionData[projection] || 0) + 1;
                        });
                        
                        new Chart(projectionCtx, {
                            type: 'doughnut',
                            data: {
                                labels: Object.keys(projectionData),
                                datasets: [{
                                    data: Object.values(projectionData),
                                    backgroundColor: [
                                        '#667eea', '#764ba2', '#f093fb', '#f5576c',
                                        '#4facfe', '#00f2fe', '#43e97b', '#38f9d7'
                                    ]
                                }]
                            },
                            options: {
                                responsive: true,
                                plugins: {
                                    legend: {
                                        position: 'bottom'
                                    }
                                }
                            }
                        });
                        
                        // Graphique des labels
                        const labelsCtx = document.getElementById('labelsChart').getContext('2d');
                        const labelData = {};
                        
                        allRows.forEach(row => {
                            const labels = row.querySelectorAll('.label');
                            labels.forEach(label => {
                                const labelText = label.textContent.split(' (')[0]; // Enlever le CUI
                                labelData[labelText] = (labelData[labelText] || 0) + 1;
                            });
                        });
                        
                        const sortedLabels = Object.entries(labelData)
                            .sort(([,a], [,b]) => b - a)
                            .slice(0, 10);
                        
                        new Chart(labelsCtx, {
                            type: 'bar',
                            data: {
                                labels: sortedLabels.map(([label]) => label),
                                datasets: [{
                                    label: 'Fréquence',
                                    data: sortedLabels.map(([,count]) => count),
                                    backgroundColor: 'rgba(102, 126, 234, 0.8)',
                                    borderColor: 'rgba(102, 126, 234, 1)',
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                responsive: true,
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                },
                                plugins: {
                                    legend: {
                                        display: false
                                    }
                                }
                            }
                        });
                    }
                    
                    function showTable() {
                        document.getElementById('loadingIndicator').style.display = 'none';
                        updateTable();
                    }
                </script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
