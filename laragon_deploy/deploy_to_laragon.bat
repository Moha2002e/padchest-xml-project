@echo off
echo ========================================
echo   Deploiement PadChest XML sur Laragon
echo ========================================
echo.

REM Vérifier si Laragon existe
if not exist "C:\laragon\www" (
    echo ERREUR: Laragon non trouve dans C:\laragon\www
    echo Veuillez installer Laragon ou modifier le chemin
    pause
    exit /b 1
)

echo 1. Creation du dossier padchest dans Laragon...
if not exist "C:\laragon\www\padchest" mkdir "C:\laragon\www\padchest"

echo 2. Copie des fichiers XSLT...
copy "xslt\minimum\view.xsl" "C:\laragon\www\padchest\minimum.xsl"
copy "xslt\pro\view.xsl" "C:\laragon\www\padchest\pro.xsl"
copy "xslt\expert\view.xsl" "C:\laragon\www\padchest\expert.xsl"
copy "xslt\test_data.xml" "C:\laragon\www\padchest\data.xml"

echo 3. Copie de la page d'accueil...
copy "index.html" "C:\laragon\www\padchest\index.html"

echo 4. Generation des fichiers HTML...

REM Générer le HTML minimum
echo    - Generation minimum.html...
xsltproc "C:\laragon\www\padchest\minimum.xsl" "C:\laragon\www\padchest\data.xml" > "C:\laragon\www\padchest\minimum.html"

REM Générer le HTML pro
echo    - Generation pro.html...
xsltproc "C:\laragon\www\padchest\pro.xsl" "C:\laragon\www\padchest\data.xml" > "C:\laragon\www\padchest\pro.html"

REM Générer le HTML expert
echo    - Generation expert.html...
xsltproc "C:\laragon\www\padchest\expert.xsl" "C:\laragon\www\padchest\data.xml" > "C:\laragon\www\padchest\expert.html"

echo.
echo ========================================
echo   Deploiement termine avec succes !
echo ========================================
echo.
echo URLs de test :
echo   - Page d'accueil : http://localhost/padchest/
echo   - Niveau minimum : http://localhost/padchest/minimum.html
echo   - Niveau pro     : http://localhost/padchest/pro.html
echo   - Niveau expert  : http://localhost/padchest/expert.html
echo.
echo Fichiers deployes dans : C:\laragon\www\padchest\
echo.

REM Ouvrir automatiquement le navigateur
echo Ouverture du navigateur...
start http://localhost/padchest/

echo.
echo Appuyez sur une touche pour fermer...
pause > nul
