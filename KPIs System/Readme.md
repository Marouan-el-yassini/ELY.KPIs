# ⚙️ ELY.KPI — Industrial Performance Intelligence System

> An AI-powered OEE monitoring platform built for Moroccan manufacturing SMEs — combining Lean Manufacturing methodology, n8n automation workflows, a RAG AI agent, and a real-time
> dashboard.

---

## 📑 Table of Contents

1. [Introduction Métier — La Notion d'Entreprise](#1-introduction-métier--la-notion-dentreprise)
2. [Stratégie d'Entreprise & Pilotage de la Performance](#2-stratégie-dentreprise--pilotage-de-la-performance)
3. [Décomposition des Objectifs Stratégiques](#3-décomposition-des-objectifs-stratégiques)
4. [Indicateurs de Performance (KPI)](#4-indicateurs-de-performance-kpi)
5. [KPIs Utilisés dans ELY.KPI](#5-kpis-utilisés-dans-elykpi)
6. [Plan d'Action & Comparaison des Résultats](#6-plan-daction--comparaison-des-résultats)
7. [Architecture Système](#7-architecture-système)
8. [Workflows n8n](#8-workflows-n8n)
9. [Web Application](#9-web-application)
10. [RAG Agent & Intelligence Artificielle](#10-rag-agent--intelligence-artificielle)
11. [Technologies Used](#11-technologies-used)
12. [Screenshots](#12-screenshots)
13. [Setup & Deployment](#13-setup--deployment)
14. [Author](#14-author)

---

## 1. Introduction Métier — La Notion d'Entreprise

Une **entreprise** est une organisation qui combine des ressources humaines, financières, matérielles et informationnelles pour produire des biens ou des services destinés à un marché. Dans un contexte industriel manufacturier, l'entreprise doit en permanence s'assurer qu'elle est à la fois :

- **Efficace** _(effective)_ — elle atteint ses objectifs fixés : les machines produisent les quantités prévues, les délais sont respectés, la qualité est au rendez-vous.
- **Efficiente** _(efficient)_ — elle atteint ces objectifs en utilisant le minimum de ressources : temps machine, matières premières, énergie, main-d'œuvre.

> 📌 Une entreprise peut être efficace sans être efficiente (atteindre ses objectifs en gaspillant des ressources), ou efficiente sans être efficace (optimiser ses ressources mais rater ses cibles). L'idéal est d'être les deux simultanément.

Dans l'industrie manufacturière marocaine, cette dualité est particulièrement critique : la compétitivité face aux marchés internationaux exige une production **sans gaspillage**, **sans défauts**, et **sans temps morts**. C'est précisément l'objectif du système ELY.KPI.

---

## 2. Stratégie d'Entreprise & Pilotage de la Performance

### 2.1 Définition

La **stratégie d'entreprise** est l'ensemble des décisions et orientations à long terme qui permettent à l'organisation d'atteindre un avantage concurrentiel durable. Elle répond à la question : _"Où voulons-nous aller, et comment ?"_

Le **pilotage de la performance** est le processus continu qui consiste à :

1. Définir des objectifs clairs et mesurables
2. Mesurer les résultats réels en cours d'exécution
3. Comparer les résultats aux objectifs
4. Identifier les écarts et leurs causes
5. Mettre en place des actions correctives

Sans pilotage structuré, une stratégie reste un vœu pieux. ELY.KPI matérialise ce pilotage en temps réel sur les machines de production.

### 2.2 Le Cycle de Pilotage

```
Définir la Stratégie
        │
        ▼
Traduire en Objectifs Stratégiques
        │
        ▼
Décliner en Objectifs Opérationnels (SMART)
        │
        ▼
Sélectionner les KPIs associés
        │
        ▼
Collecter les données de terrain (ELY.KPI)
        │
        ▼
Calculer et Interpréter les KPIs (AI Agent)
        │
        ▼
Comparer avec les cibles fixées(ELY.KPI)
        │
        ▼
Générer le Rapport PDF (AI Agent)(EKY.KPI)
        │
        ▼
Définir le Plan d'Action Correctif
        │
        └──► Boucle de rétroaction → Objectifs
```

---

## 3. Décomposition des Objectifs Stratégiques

Le système ELY.KPI s'appuie sur une cascade d'objectifs structurée en trois niveaux :

### Niveau 1 — Objectif Stratégique

> _"Devenir le fabricant le plus compétitif de notre secteur au Maroc d'ici 3 ans en maximisant notre productivité et en réduisant notre taux de rebut."_

C'est la vision de direction. Large, orientée long terme, non encore mesurable directement.

### Niveau 2 — Objectifs Stratégiques Déclinés

| Axe Stratégique     | Objectif                                            |
| ------------------- | --------------------------------------------------- |
| Productivité        | Augmenter le taux d'utilisation des machines à 85%+ |
| Qualité             | Réduire le taux de défauts sous 2% de la production |
| Disponibilité       | Atteindre un taux de disponibilité machine > 90%    |
| Performance globale | Atteindre un OEE > 70% sur toutes les lignes        |

### Niveau 3 — Objectifs Opérationnels SMART

Les objectifs opérationnels doivent être **SMART** :

| Critère         | Signification                              | Exemple                                         |
| --------------- | ------------------------------------------ | ----------------------------------------------- |
| **S**pécifique  | Clairement défini, sans ambiguïté          | "Réduire le temps d'arrêt de la machine CNC-01" |
| **M**esurable   | Quantifiable avec un indicateur précis     | "de 90 min/jour à 45 min/jour"                  |
| **A**tteignable | Réaliste compte tenu des ressources        | Faisable avec maintenance préventive renforcée  |
| **R**elevant    | En lien direct avec l'objectif stratégique | Améliore directement la Disponibilité           |
| **T**emporel    | Avec une échéance définie                  | "d'ici le 31 décembre 2025"                     |

**Exemple complet :**

> _"Réduire le temps d'arrêt non planifié de la machine PRESSE-A1 de 90 à 45 minutes par jour, en mettant en place un plan de maintenance préventive hebdomadaire, d'ici le 31/12/2025."_

---

## 4. Indicateurs de Performance (KPI)

### 4.1 Définition

Un **KPI** _(Key Performance Indicator)_ est un indicateur quantifiable qui mesure l'avancement vers un objectif défini. Un bon KPI doit être :

- Directement lié à un objectif opérationnel
- Calculable à partir de données collectées sur le terrain
- Comparable dans le temps (tendances)
- Comparable à une cible fixée par l'entreprise

### 4.2 Processus de gestion par KPI

```
Objectif Opérationnel SMART
        │
        ▼
Sélection du KPI associé
        │
        ▼
Collecte des données terrain (formulaire ELY.KPI)
        │
        ▼
Calcul automatique du KPI (AI Agent n8n)
        │
        ▼
Interprétation via RAG (KPI_VectorBase)
        │
        ▼
Comparaison avec la cible de l'entreprise
        │
        ├── Résultat ≥ Cible → ✅ Objectif atteint
        └── Résultat < Cible → ⚠️ Écart détecté → Plan d'Action
```

### 4.3 Plan d'Action

Quand un KPI est en dessous de sa cible, le système déclenche un cycle d'amélioration :

| Étape          | Action                                   |
| -------------- | ---------------------------------------- |
| 1. Identifier  | Quelle machine ? Quel KPI ? Quel écart ? |
| 2. Analyser    | Cause racine (5 Pourquoi, Ishikawa)      |
| 3. Planifier   | Actions correctives assignées avec délai |
| 4. Exécuter    | Mise en œuvre sur le terrain             |
| 5. Vérifier    | Re-mesure du KPI après correction        |
| 6. Capitaliser | Intégrer dans les standards si succès    |

---

## 5. KPIs Utilisés dans ELY.KPI

Le système est construit autour du modèle **OEE (Overall Equipment Effectiveness)** — standard mondial Lean Manufacturing / TPM.

### 5.1 OEE — Efficacité Globale des Équipements

> L'OEE est le KPI synthétique qui combine les trois dimensions de la performance industrielle. C'est le KPI principal du système.

```
OEE = Disponibilité × Performance × Qualité
```

| Niveau OEE | Interprétation                   | Status ELY.KPI |
| ---------- | -------------------------------- | -------------- |
| ≥ 85%      | World Class                      | 🏆 EXCELLENT   |
| 70% – 84%  | Bonne performance                | ✅ BON         |
| 50% – 69%  | Performance moyenne, améliorable | ⚠️ MOYEN       |
| < 50%      | Performance critique             | ❌ CRITIQUE    |

---

### 5.2 Disponibilité

> _"La machine est-elle disponible quand on en a besoin ?"_

**Formule :**

```
Disponibilité = (Temps_planifié - Temps_arrêt) / Temps_planifié × 100
```

| Variable         | Description                                          |
| ---------------- | ---------------------------------------------------- |
| `Temps_planifié` | Durée totale prévue pour la production (min)         |
| `Temps_arrêt`    | Pannes + changements de série + manque matière (min) |

**Pertes adressées :** Pannes, maintenance corrective, réglages, manque d'approvisionnement.

---

### 5.3 Performance

> _"Quand la machine tourne, tourne-t-elle à la cadence prévue ?"_

**Formule :**

```
Performance = Production_réelle / Production_théorique × 100
```

| Variable               | Description                                  |
| ---------------------- | -------------------------------------------- |
| `Production_théorique` | Quantité cible si la machine tournait à 100% |
| `Production_réelle`    | Quantité effectivement produite              |

**Pertes adressées :** Micro-arrêts, ralentissements, sous-cadence opérateur.

---

### 5.4 Taux de Qualité

> _"Des pièces produites, combien sont conformes ?"_

**Formule :**

```
Qualité = (Production_réelle - Quantité_défectueuse) / Production_réelle × 100
```

| Variable               | Description                 |
| ---------------------- | --------------------------- |
| `Quantité_défectueuse` | Pièces rebutées + retouches |

**Pertes adressées :** Rebuts, retouches, non-conformités.

---

### 5.5 Règles de calcul appliquées

- Tous les KPIs sont arrondis à **2 décimales**
- Aucun KPI ne peut **dépasser 100%** ni être **négatif**
- Si `Temps_planifié = 0` → OEE = 0
- Si `Production_réelle = 0` → Performance = 0, Qualité = 0
- Si `Quantité_défectueuse > Production_réelle` → état **CRITIQUE**

---

## 6. Plan d'Action & Comparaison des Résultats

### 6.1 Grille de comparaison KPI vs Objectif

L'entreprise fixe ses cibles dans ses objectifs opérationnels SMART. ELY.KPI calcule les valeurs réelles. La comparaison donne :

| KPI           | Cible Entreprise | Résultat ELY.KPI | Écart  | Action                     |
| ------------- | ---------------- | ---------------- | ------ | -------------------------- |
| OEE           | ≥ 70%            | 58.3%            | -11.7% | Plan maintenance + qualité |
| Disponibilité | ≥ 90%            | 84.2%            | -5.8%  | Réduire temps d'arrêt      |
| Performance   | ≥ 85%            | 78.5%            | -6.5%  | Optimiser cadence          |
| Qualité       | ≥ 97%            | 93.1%            | -3.9%  | Contrôle qualité renforcé  |

_Ce tableau est un exemple illustratif. Les valeurs réelles sont calculées par le système._

### 6.2 Interprétation par le RAG Agent

Pour chaque KPI calculé, l'agent AI interroge la **KPI_VectorBase** (base de connaissances Supabase vectorielle) pour obtenir :

- **Result** — Label d'état : CRITIQUE / MOYEN / BON / EXCELLENT
- **Facteur_Influ** — Facteurs influençant ce KPI dans ce contexte
- **Facteur_Result** — Recommandations d'actions concrètes

Cette interprétation contextuelle va au-delà du simple seuil — elle tient compte de la machine, du secteur, et de la combinaison des autres KPIs.

---

## 7. Architecture Système

```
┌─────────────────────────────────────────────────────────────────┐
│                        ELY.KPI SYSTEM                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  COUCHE COLLECTE                                                │
│  ┌─────────────────┐    ┌──────────────────┐                   │
│  │  Web App        │    │  Direct API Call │                   │
│  │                │───►│  POST Webhook    │                   │
│  └─────────────────┘    └────────┬─────────┘                   │
│                                  │                             │
│  COUCHE STOCKAGE                 ▼                             │
│  ┌──────────────────────────────────────────┐                  │
│  │  n8n Workflow 1 — Data Ingestion         │                  │
│  │  ┌─────────────────┐  ┌───────────────┐  │                  │
│  │  │  Google Sheets  │  │  Supabase DB  │  │                  │
│  │  │  (KPI_Data)     │  │  (machine_    │  │                  │
│  │  │                 │  │   sessions)   │  │                  │
│  │  └─────────────────┘  └───────────────┘  │                  │
│  └──────────────────────────────────────────┘                  │
│                                                                 │
│  COUCHE ANALYSE AI                                              │
│  ┌──────────────────────────────────────────┐                  │
│  │  n8n Workflow 2 — KPI Analysis           │                  │
│  │  ┌──────────┐  ┌──────────────────────┐  │                  │
│  │  │ GPT-4.1  │  │  RAG Agent           │  │                  │
│  │  │ -mini    │  │  KPI_VectorBase       │  │                  │
│  │  │          │  │  (Supabase Vector)   │  │                  │
│  │  └──────────┘  │  Gemini Embeddings   │  │                  │
│  │                └──────────────────────┘  │                  │
│  └──────────────────────────────────────────┘                  │
│                                                                 │
│  COUCHE RAPPORT                                                 │
│  ┌──────────────────────────────────────────┐                  │
│  │  n8n Workflow 2 (suite)                  │                  │
│  │  GPT-4.1-nano → HTML → PDF → Google Drive│                  │
│  └──────────────────────────────────────────┘                  │
│                                                                 │
│  COUCHE PRÉSENTATION                                            │
│  ┌──────────────────────────────────────────┐                  │
│  │  Web App Dashboard (HTML/CSS/JS)         │                  │
│  │  Auth · Dashboard · Data Push ·          │                  │
│  │  Historique · Profil · Charts            │                  │
│  └──────────────────────────────────────────┘                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 8. Workflows n8n

### Workflow 1 — Data Ingestion

**Déclencheur :** POST Webhook  
**Rôle :** Recevoir les données de production brutes et les persister dans deux destinations.

```
POST Webhook
    │
    ▼
Google Sheets (KPI_Data — append/update par Machine)
    │
    ▼
Supabase (machine_sessions — insert avec company_id)
    │
    ▼
Respond: "Element Added Successfully"
```

**Particularité multi-tenant :** Chaque enregistrement est tagué avec le `company_id` de l'utilisateur connecté. Les données de deux entreprises différentes ne se mélangent jamais.

---

### Workflow 2 — KPI Analysis & Report Generation

**Déclencheur :** POST Webhook (bouton "Generate AI Report" dans la webapp)  
**Rôle :** Lire toutes les données, calculer les KPIs, les interpréter via RAG, générer un rapport PDF professionnel.

```
POST Webhook
    │
    ▼
Google Sheets (KPI_Data — lecture de toutes les lignes)
    │
    ▼
Loop Over Items (batch = 1, machine par machine)
    │
    ├──► AI Agent 1 (GPT-4.1-mini)
    │         ├── Calcul OEE / Disponibilité / Performance / Qualité
    │         ├── Interrogation KPI_VectorBase × 4 (un appel par KPI)
    │         │         └── Gemini Embeddings → Supabase Vector Search
    │         └── Output: JSON structuré + labels d'état
    │
    ├──► Google Sheets (KPI_Result — append résultats calculés)
    │
    └──► [Fin de boucle]
              │
              ▼
         Aggregate (toutes les lignes de KPI_Result)
              │
              ▼
         AI Agent 2 (GPT-4.1-nano)
              │  Génère rapport HTML complet :
              │  Header · KPI Cards · Tableau · Jauges · Footer
              ▼
         HTML CSS to PDF
              │
              ▼
         Google Drive (upload PDF)
              │
              ▼
         Respond to Webhook → "the analysis is finished"
```

---

## 9. Web Application

La webapp **ELY.KPI Dashboard** est une interface industrielle temps réel construite en JS .

### 9.1 Fonctionnalités

| Page           | Description                                                                                                                                           |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Auth**       | Login / Register avec Supabase Auth. Création de profil entreprise au signup.                                                                         |
| **Dashboard**  | KPI cards globaux (OEE, Dispo, Perf, Qualité), graphiques Chart.js, sessions récentes, filtre par machine, bouton génération rapport AI.              |
| **Data Push**  | Formulaire de saisie de session machine. Envoi vers n8n Webhook + Supabase simultanément. Calcul local instantané et affichage dans la Session Queue. |
| **Historique** | Tableau complet de toutes les sessions avec calcul OEE, filtres, recherche, statistiques globales.                                                    |
| **Profil**     | Informations entreprise (nom, secteur, téléphone), statistiques globales de la société.                                                               |

### 9.2 Architecture Frontend

```
index.html
├── Auth Screen (Supabase Auth)
├── App Shell
│   ├── Header (company name, sys status, logout)
│   ├── Sidebar (navigation)
│   └── Main Content
│       ├── Page: Dashboard
│       │   ├── KPI Cards (OEE, Dispo, Perf, Qualité, Sessions)
│       │   ├── Chart OEE par machine (Chart.js bar)
│       │   ├── Chart Tendance production (Chart.js line)
│       │   └── Table sessions récentes
│       ├── Page: Data Push
│       │   ├── Form (7 champs machine)
│       │   └── Session Queue (cartes live)
│       ├── Page: Historique
│       │   ├── Stats row (total, machines, OEE moyen)
│       │   └── Table complète avec filtres
│       └── Page: Profil
│           ├── Edit form
│           └── Company stats
├── AI Loader (overlay pendant analyse)
└── Toast Notifications
```

### 9.3 Flux de données temps réel

Quand l'opérateur soumet un formulaire :

1. Le KPI est **calculé localement en JS** et affiché instantanément dans le dashboard
2. L'enregistrement est envoyé à **n8n** (Google Sheets) en arrière-plan
3. L'enregistrement est inséré dans **Supabase** en arrière-plan
4. L'UI est mise à jour sans rechargement de page

---

## 10. RAG Agent & Intelligence Artificielle

### 10.1 Qu'est-ce qu'un RAG Agent ?

**RAG** _(Retrieval-Augmented Generation)_ est une architecture AI qui combine :

- La puissance générative d'un LLM (GPT-4.1-mini)
- La précision d'une base de connaissances vectorielle spécialisée (Supabase + Gemini Embeddings)

Au lieu de se fier uniquement à sa mémoire d'entraînement, le modèle **récupère dynamiquement** les informations pertinentes de la KPI_VectorBase avant de répondre.

### 10.2 Utilisation dans ELY.KPI

La KPI_VectorBase contient des **documents de référence industriels** .

Pour chaque KPI calculé (OEE, Disponibilité, Performance, Qualité), l'agent :

1. Formule une **requête vectorielle** avec le nom du KPI, sa valeur, la machine et le contexte des autres KPIs
2. Interroge la **KPI_VectorBase** via Supabase `match_documents`
3. Reçoit les documents les plus pertinents (similarity search)
4. **Génère l'interprétation** en combinant les données et les documents récupérés

**Résultat :** L'agent ne dit pas juste "OEE = 58.3% → MOYEN". Il explique _pourquoi_ c'est moyen dans ce contexte, quels facteurs l'influencent, et quelles actions correctives sont recommandées selon les standards industriels.

### 10.3 Avantage par rapport à un système de seuils statiques

| Approche classique                      | ELY.KPI RAG Agent                                    |
| --------------------------------------- | ---------------------------------------------------- |
| Seuils fixes (ex: OEE < 50% = CRITIQUE) | Interprétation contextuelle selon machine + secteur  |
| Aucune explication                      | Facteurs d'influence identifiés                      |
| Aucune recommandation                   | Plan d'action suggéré basé sur standards industriels |
| Statique                                | Extensible : ajouter des docs dans la VectorBase     |

---

## 11. Technologies Used

| Catégorie            | Technologie                                        | Rôle dans ELY.KPI                                 |
| -------------------- | -------------------------------------------------- | ------------------------------------------------- |
| **Automation**       | n8n (self-hosted)                                  | Orchestration des 2 workflows principaux          |
| **LLM — Calcul KPI** | OpenAI GPT-4.1-mini                                | Agent calcul OEE + interprétation RAG             |
| **LLM — Rapport**    | OpenAI GPT-4.1-nano                                | Génération du rapport HTML                        |
| **Embeddings**       | Google Gemini gemini-embedding-001                 | Vectorisation des requêtes KPI                    |
| **Vector Store**     | Supabase (pgvector)                                | Base de connaissances KPI / standards industriels |
| **Base de données**  | Supabase (PostgreSQL)                              | Stockage des sessions machine (multi-tenant)      |
| **Auth**             | Supabase Auth                                      | Authentification utilisateurs, RLS                |
| **Spreadsheet**      | Google Sheets                                      | Source de données pour l'analyse n8n              |
| **Storage**          | Google Drive                                       | Stockage des rapports PDF générés                 |
| **PDF Generation**   | HTML CSS to PDF                                    | Conversion rapport HTML → PDF                     |
| **Frontend**         | HTML5 / CSS3 / Vanilla JS                          | Dashboard web (aucun framework)                   |
| **Charts**           | Chart.js                                           | Graphiques OEE par machine, tendance production   |
| **UI Icons**         | Lucide Icons                                       | Iconographie de l'interface                       |
| **Fonts**            | Google Fonts (Orbitron, Rajdhani, Share Tech Mono) | Typographie industrielle                          |
| **CSS Framework**    | Tailwind CSS (CDN)                                 | Utilitaires de style                              |
| **Hosting**          | Vercel                                             | Déploiement de la webapp                          |

---

## 12. Screenshots

> Les captures d'écran ci-dessous illustrent les différentes vues du système ELY.KPI.

---

### 🔐 Auth Screen — Login / Register

```
┌────────────────────────────────────────┐
│          ⚙️ ELY.AUTOMATION             │
│       Industrial KPI Platform v2.0    │
│                                        │
│   [ LOGIN ]  [ REGISTER ]              │
│                                        │
│   Email    [____________________]      │
│   Password [____________________]      │
│                                        │
│         [ ACCESS_SYSTEM ]              │
└────────────────────────────────────────┘
```

_Interface d'authentification avec Supabase Auth. Formulaire de register avec champs : prénom, nom, entreprise, secteur industriel, téléphone._

---

### 📊 Dashboard — Vue Principale

```
┌──────────────────────────────────────────────────────────┐
│  PRODUCTION DASHBOARD                                    │
│  ELY.Automation SARL · 25 sessions · OEE moyen: 67.4%   │
├──────────────────────────────────────────────────────────┤
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐   │
│  │ OEE      │ │ Dispo    │ │ Perf     │ │ Qualité  │   │
│  │ 67.4%    │ │ 84.2%    │ │ 78.5%    │ │ 93.1%    │   │
│  │ ▓▓▓▓▓▓░░ │ │ ▓▓▓▓▓▓▓░ │ │ ▓▓▓▓▓▓░░ │ │ ▓▓▓▓▓▓▓▓ │   │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘   │
├──────────────────────────────────────────────────────────┤
│  [OEE par Machine - Bar Chart] [Tendance - Line Chart]   │
├──────────────────────────────────────────────────────────┤
│  Sessions Récentes                                       │
│  Machine    Date        OEE    Status                    │
│  PRESSE-A1  2025-01-15  72.3%  ✅ BON                    │
│  CNC-02     2025-01-15  48.1%  ❌ CRITIQUE               │
│  ROBOT-B3   2025-01-14  81.5%  ✅ BON                    │
└──────────────────────────────────────────────────────────┘
```

_KPI cards avec barres de progression animées, deux graphiques Chart.js, tableau des sessions récentes avec badges de statut colorés._

---

### 🖥️ Data Push — Saisie de Session

```
┌──────────────────────────────────────────────────────────┐
│  DATA_PUSH_TERMINAL              SESSION_QUEUE: 3 items  │
├─────────────────────┬────────────────────────────────────┤
│ Identification      │  ┌─────────────────────────────┐  │
│ [PRESSE-A1_______]  │  │ PRESSE-A1          ✅ BON    │  │
│ Date                │  │ OEE: 72.3%  Dispo: 84.2%   │  │
│ [2025-01-15______]  │  │ Perf: 78.5% Qual: 93.1%    │  │
│ Temps Planifié      │  │ 2025-01-15                  │  │
│ [480_____________]  │  └─────────────────────────────┘  │
│ Temps Arrêt         │  ┌─────────────────────────────┐  │
│ [60______________]  │  │ CNC-02             ❌ CRIT.  │  │
│ Prod. Théo / Réelle │  │ OEE: 48.1%  Dispo: 75.0%   │  │
│ [1000] [820______]  │  └─────────────────────────────┘  │
│ Défauts             │                                    │
│ [15______________]  │                                    │
│                     │                                    │
│ [SYNC_TO_G_SHEETS]  │                                    │
└─────────────────────┴────────────────────────────────────┘
```

_Formulaire de saisie à gauche avec calcul instantané. Session queue à droite montrant les machines saisies avec leurs KPIs calculés en temps réel._

---

### 📋 Historique — Table Complète

```
┌────────────────────────────────────────────────────────────────┐
│  MACHINE HISTORY                                               │
│  Toutes les sessions de votre entreprise                       │
├────────────────────────────────────────────────────────────────┤
│  [Rechercher machine...]  [Tout afficher ▼]  [REFRESH]        │
├─────────────────┬─────────────────┬─────────────────┐         │
│ 25 Sessions     │ 5 Machines       │ OEE Moyen 67.4% │         │
├─────────────────┴─────────────────┴─────────────────┘         │
│  #  Machine    Date        OEE    Dispo  Perf   Qual  Status   │
│  1  PRESSE-A1  2025-01-15  72.3%  84.2%  78.5%  93.1%  ✅     │
│  2  CNC-02     2025-01-15  48.1%  75.0%  66.7%  91.4%  ❌     │
│  3  ROBOT-B3   2025-01-14  81.5%  90.6%  87.5%  97.2%  🏆     │
│  ...                                                           │
└────────────────────────────────────────────────────────────────┘
```

_Table complète avec tous les KPIs calculés, badges de statut colorés, filtres de recherche et filtre OEE._

---

### 🤖 AI Loader — Génération Rapport

```
┌────────────────────────────────────────┐
│                                        │
│              ◌ (spinner)               │
│                                        │
│       ELY_AI_COMPUTING                 │
│  CALCULATING OEE · ANALYZING VECTORS  │
│       · GENERATING PDF                 │
│                                        │
│  ████████████████░░░░░░░░ (progress)  │
│                                        │
└────────────────────────────────────────┘
```

_Overlay de chargement pendant que les 2 agents AI traitent les données, interrogent la VectorBase et génèrent le rapport PDF._

---

### 📄 Rapport PDF Généré

Structure du rapport PDF produit automatiquement par AI Agent 2 :

```
┌────────────────────────────────────────────────────────┐
│  ⚙️ ELY.Automation          Généré automatiquement    │
│  RAPPORT DE PERFORMANCE INDUSTRIELLE — KPI OEE        │
│  Date: 2025-01-15                                      │
├────────────────────────────────────────────────────────┤
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐  │
│  │ OEE      │ │ Dispo    │ │ Perf     │ │ Qualité  │  │
│  │ 67.4%    │ │ 84.2%    │ │ 78.5%    │ │ 93.1%    │  │
│  │ ⚠️ MOYEN │ │ ✅ BON   │ │ ⚠️ MOYEN │ │ ✅ BON   │  │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘  │
├────────────────────────────────────────────────────────┤
│  TABLEAU DÉTAILLÉ PAR MACHINE                          │
│  Machine    OEE    État    Dispo   Perf   Qualité      │
│  PRESSE-A1  72.3%  ✅ BON  84.2%  78.5%  93.1%        │
│  CNC-02     48.1%  ❌ CRIT 75.0%  66.7%  91.4%        │
├────────────────────────────────────────────────────────┤
│  ANALYSE PAR MACHINE (jauges visuelles)                │
│  🏭 PRESSE-A1                                          │
│  OEE  ▓▓▓▓▓▓▓░░░ 72.3%                                │
│  Dispo ▓▓▓▓▓▓▓▓░░ 84.2%                               │
├────────────────────────────────────────────────────────┤
│  Rapport généré par ELY.Automation — Agent KPI        │
└────────────────────────────────────────────────────────┘
```

---

## 13. Setup & Deployment

### Prérequis

- Compte [Supabase](https://supabase.com) (gratuit)
- Compte [n8n](https://n8n.io) (self-hosted ou cloud)
- Compte [OpenAI](https://platform.openai.com) (API key)
- Compte Google (Sheets + Drive OAuth)
- Compte Google Cloud (Gemini API key)
- Compte [HTML CSS to PDF](https://htmlcsstoimage.com)

### Étapes

```
1. Supabase
   └── Créer un projet
   └── Exécuter schema.sql (profiles + machine_sessions + RLS)
   └── Activer pgvector → créer table documents pour KPI_VectorBase
   └── Récupérer URL + anon key

2. n8n
   └── Importer ELY_KPI_ingestion_public.json
   └── Importer ELY_KPI_workflow_public.json
   └── Configurer toutes les credentials
   └── Remplacer tous les placeholders
   └── Activer les deux workflows

3. Webapp
   └── Ouvrir index.html
   └── Remplacer SUPABASE_URL et SUPABASE_ANON_KEY
   └── Remplacer N8N_SAVE et N8N_ANALYZE avec vos webhook URLs


4. Test End-to-End
   └── S'enregistrer sur la webapp
   └── Saisir une session machine
   └── Vérifier apparition dans Supabase + Google Sheets
   └── Cliquer GENERATE_AI_REPORT
   └── Vérifier le PDF dans Google Drive
```

---

## 14. Author

**ELY.Automation**
💼 [LinkedIn](https://linkedin.com/in/marouan-el-yassini)  
💻 [GitHub](https://github.com/Marouan-el-yassini)

---

_Built with ❤️ for Moroccan Industry — n8n · OpenAI · Supabase · Google Workspace · Chart.js_
