# 📊 XSLT - Transformations XML vers HTML

## 🎯 Vue d'ensemble

Ce dossier contient les transformations XSLT pour convertir les données XML PadChest en pages HTML interactives. Trois niveaux d'implémentation sont disponibles.

## 📁 Structure

```
xslt/
├── minimum/          # Niveau minimum requis
│   └── view.xsl     # Tableau simple et fonctionnel
├── pro/              # Niveau professionnel
│   └── view.xsl     # Document structuré et ergonomique
├── expert/           # Niveau expert
│   └── view.xsl     # Fonctionnalités CSS/JS avancées
├── test_data.xml     # Données de test
└── README.md         # Ce fichier
```

---

## 🎯 Niveaux d'implémentation

### **1. MINIMUM** - `minimum/view.xsl`
**Fonctionnalités :**
- ✅ **Tableau simple** et fonctionnel
- ✅ **Statistiques de base** (nombre d'images, "loc right")
- ✅ **Affichage de toutes les informations** dans un tableau
- ✅ **CSS basique** pour la lisibilité
- ✅ **Compatible** avec tous les navigateurs

**Usage :**
```bash
# Transformation avec xsltproc
xsltproc minimum/view.xsl test_data.xml > minimum/output.html
```

### **2. PRO** - `pro/view.xsl`
**Fonctionnalités :**
- ✅ **Design moderne** avec CSS avancé
- ✅ **Structure ergonomique** et jolie
- ✅ **Statistiques améliorées** avec cartes visuelles
- ✅ **Responsive design** (mobile-friendly)
- ✅ **Gradients et ombres** pour l'esthétique
- ✅ **Icônes** et mise en forme professionnelle

**Usage :**
```bash
# Transformation avec xsltproc
xsltproc pro/view.xsl test_data.xml > pro/output.html
```

### **3. EXPERT** - `expert/view.xsl`
**Fonctionnalités :**
- ✅ **Interface interactive** avec JavaScript
- ✅ **Recherche en temps réel** dans les données
- ✅ **Filtres dynamiques** (projection, labels)
- ✅ **Graphiques interactifs** avec Chart.js
- ✅ **Pagination** pour les grandes datasets
- ✅ **Animations CSS** et effets visuels
- ✅ **Design glassmorphism** moderne
- ✅ **Responsive design** avancé
- ✅ **Statistiques dynamiques** qui se mettent à jour

**Usage :**
```bash
# Transformation avec xsltproc
xsltproc expert/view.xsl test_data.xml > expert/output.html
```

---

## 🧪 Test des transformations

### **Fichier de test**
Le fichier `test_data.xml` contient 5 images de test avec différents scénarios :
- **Image 1** : Cas normal (PA, normal)
- **Image 2** : Multiples labels (LATERAL, pulmonary fibrosis, loc right)
- **Image 3** : Pneumonia (POSTEROANTERIOR, pneumonia, loc right)
- **Image 4** : Cas pédiatrique (AP, Yes, pneumonia, loc left)
- **Image 5** : Cas complexe (PA, 7 labels, 4 localisations)

### **Commandes de test**
```bash
# Test niveau minimum
xsltproc minimum/view.xsl test_data.xml > minimum/output.html

# Test niveau pro
xsltproc pro/view.xsl test_data.xml > pro/output.html

# Test niveau expert
xsltproc expert/view.xsl test_data.xml > expert/output.html
```

---

## 🎨 Fonctionnalités par niveau

| Fonctionnalité | Minimum | Pro | Expert |
|----------------|---------|-----|--------|
| **Tableau basique** | ✅ | ✅ | ✅ |
| **Statistiques** | ✅ Simple | ✅ Améliorées | ✅ Dynamiques |
| **CSS** | ✅ Basique | ✅ Avancé | ✅ Glassmorphism |
| **Responsive** | ❌ | ✅ | ✅ |
| **Recherche** | ❌ | ❌ | ✅ |
| **Filtres** | ❌ | ❌ | ✅ |
| **Graphiques** | ❌ | ❌ | ✅ Chart.js |
| **Pagination** | ❌ | ❌ | ✅ |
| **Animations** | ❌ | ❌ | ✅ |
| **JavaScript** | ❌ | ❌ | ✅ |

---

## 🚀 Déploiement

### **Serveur local (XAMPP)**
1. **Copier les fichiers** dans `htdocs/padchest/`
2. **Transformer le XML** avec le XSLT choisi
3. **Accéder via** `http://localhost/padchest/output.html`

### **Serveur web**
1. **Uploader** les fichiers HTML générés
2. **Vérifier** que Chart.js et Font Awesome sont accessibles
3. **Tester** sur différents navigateurs

---

## 📊 Exemples de sortie

### **Minimum**
- Tableau simple avec bordures
- Statistiques basiques
- Affichage de toutes les données

### **Pro**
- Design moderne avec gradients
- Cartes de statistiques
- Mise en forme professionnelle
- Responsive design

### **Expert**
- Interface interactive complète
- Recherche et filtres en temps réel
- Graphiques dynamiques
- Pagination automatique
- Animations et effets visuels

---

## 🔧 Personnalisation

### **Modifier les couleurs**
Éditer les variables CSS dans chaque fichier XSLT :
```css
/* Couleurs principales */
--primary-color: #667eea;
--secondary-color: #764ba2;
--success-color: #d4edda;
--warning-color: #fff3cd;
```

### **Ajouter des fonctionnalités**
- **Niveau minimum** : Ajouter des colonnes au tableau
- **Niveau pro** : Améliorer le CSS et la mise en forme
- **Niveau expert** : Ajouter des fonctionnalités JavaScript

---

## 📚 Ressources

### **Documentation XSLT**
- [W3C XSLT Tutorial](https://www.w3schools.com/xml/xsl_intro.asp)
- [XSLT Reference](https://www.w3schools.com/xml/xsl_reference.asp)

### **Outils de transformation**
- **xsltproc** (ligne de commande)
- **Oxygen XML Editor** (interface graphique)
- **XMLSpy** (commercial)

### **Bibliothèques utilisées**
- **Chart.js** : Graphiques interactifs
- **Font Awesome** : Icônes
- **CSS Grid/Flexbox** : Mise en page moderne

---

## 🎯 Conformité aux exigences

### **Niveau minimum** ✅
- ✅ Fonctionnel
- ✅ Toutes les informations visibles
- ✅ Tableau simple

### **Niveau pro** ✅
- ✅ Document structuré
- ✅ Joli et ergonomique
- ✅ Pas de technologies supplémentaires

### **Niveau expert** ✅
- ✅ Fonctionnalités CSS/JS
- ✅ Interactivité avancée
- ✅ Imagination et créativité

---

*XSLT créé pour le projet PadChest XML - HEPL 2024*