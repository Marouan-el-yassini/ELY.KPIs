# ⚙️ ELY.KPI — Automated Industrial KPI Analysis Workflow

> Automated OEE calculation, AI-powered interpretation, and PDF report generation for manufacturing machines — built with n8n.

---

## 📌 Overview

**ELY.KPI** is an n8n automation workflow that reads raw production data from Google Sheets, calculates industrial KPIs (OEE, Availability, Performance, Quality), interprets each KPI using a Supabase vector knowledge base, saves results back to Google Sheets, generates a professional HTML report, converts it to PDF, and uploads it to Google Drive — all automatically.

---

## 🏗️ Architecture

```
Webhook (POST)
    │
    ▼
Google Sheets — KPI_Data (read raw production data)
    │
    ▼
Loop Over Items (batch size: 1)
    ├──► Google Sheets — KPI_Result (read existing results)
    │         └──► Aggregate all rows
    │                   └──► AI Agent 2 (HTML Report Generator)
    │                               └──► Convert HTML to PDF
    │                                         └──► Upload to Google Drive
    │                                                   └──► Respond to Webhook
    │
    └──► AI Agent 1 (KPI Calculator)
              ├── LLM: GPT-4.1-mini
              ├── Memory: Buffer Window (key: Machine_Date)
              ├── Tool: KPI_VectorBase (Supabase)
              │         └── Embeddings: Gemini gemini-embedding-001
              ├── Output Parser: Structured JSON
              └──► Append result row to Google Sheets — KPI_Result
```

---

## 🔄 Workflow Steps

### Step 1 — Trigger
The workflow is triggered via a **POST Webhook**. Send a POST request to your n8n webhook URL to start the analysis.

### Step 2 — Read Production Data
Reads all rows from the **KPI_Data** Google Sheet (Sheet2), which contains the raw production inputs per machine per day.

### Step 3 — Loop per row
Processes each row one by one using **Split In Batches** (batch size = 1).

### Step 4 — AI Agent 1: KPI Calculator
For each row, the agent:
- Calculates OEE, Availability, Performance, Quality using strict formulas
- Queries **KPI_VectorBase** (Supabase) for each KPI interpretation
- Returns a structured JSON result

### Step 5 — Save KPI Results
Appends the calculated KPI results to the **KPI_Result** Google Sheet.

### Step 6 — Aggregate all results
After all rows are processed, aggregates all KPI_Result rows into a single dataset.

### Step 7 — AI Agent 2: HTML Report Generator
Generates a complete, professional HTML report including:
- Global KPI summary cards
- Detailed machine table with color-coded status
- Per-machine visual gauges
- ELY.Automation branding and footer

### Step 8 — Convert HTML to PDF
Converts the generated HTML report to a PDF file using the HTML CSS to PDF node.

### Step 9 — Upload to Google Drive
Uploads the PDF report to a designated Google Drive folder.

### Step 10 — Respond to Webhook
Returns a confirmation response: `"the analysis is finished"`.

---

## 📊 KPI Formulas

| KPI | Formula |
|---|---|
| **Availability** | `(Temps_planifie - Temps_arret) / Temps_planifie × 100` |
| **Performance** | `Production_reelle / Production_theorique × 100` |
| **Quality** | `(Production_reelle - Quantite_defectueuse) / Production_reelle × 100` |
| **OEE** | `(Availability / 100) × (Performance / 100) × (Quality / 100) × 100` |

All KPIs are rounded to 2 decimal places and capped at 100%.

---

## 📋 Input Data Schema (KPI_Data Sheet)

| Column | Type | Description |
|---|---|---|
| `Date` | string | Production date |
| `Machine` | string | Machine identifier |
| `Temps_planifie_min` | number | Planned time (minutes) |
| `Temps_arret_min` | number | Downtime (minutes) |
| `Production_theorique` | number | Theoretical production target |
| `Production_reelle` | number | Actual production |
| `Quantite_defectueuse` | number | Defective units |

---

## 📋 Output Data Schema (KPI_Result Sheet)

| Column | Type | Description |
|---|---|---|
| `Date` | string | Production date |
| `Machine` | string | Machine identifier |
| `OEE` | number | OEE percentage |
| `OEE_Result` | string | OEE status label |
| `Disponibilete` | number | Availability percentage |
| `Dispo_Result` | string | Availability status label |
| `Perforemence` | number | Performance percentage |
| `Perform_Result` | string | Performance status label |
| `Taux_Qualite` | number | Quality rate percentage |
| `T_Qualit_Result` | string | Quality status label |

**Status labels:** `CRITIQUE` · `MOYEN` · `BON` · `EXCELLENT`

---

## 🤖 AI Models Used

| Agent | Model | Role |
|---|---|---|
| AI Agent 1 (KPI Calculator) | `gpt-4.1-mini` | Calculate + interpret KPIs |
| AI Agent 2 (Report Generator) | `gpt-4.1-nano` | Generate HTML report |
| Vector Embeddings | `gemini-embedding-001` | Embed KPI queries for vector search |

---

## 🧠 KPI_VectorBase (Supabase)

The vector knowledge base stores KPI interpretation rules based on Lean Manufacturing and TPM standards. For each KPI, the agent queries the vector store with the KPI name, value, and machine context and receives:

- `Result` — status label (CRITIQUE / MOYEN / BON / EXCELLENT)
- `Facteur_Influ` — influencing factors
- `Facteur_Result` — recommended actions

---

## ⚙️ Prerequisites

Before importing this workflow, you need the following accounts and credentials configured in n8n:

- **OpenAI** API account (for GPT-4.1-mini and GPT-4.1-nano)
- **Google Sheets** OAuth2 (for KPI_Data and KPI_Result sheets)
- **Google Drive** OAuth2 (for PDF upload)
- **Google Gemini (PaLM)** API (for embeddings)
- **Supabase** API (for KPI vector knowledge base with `match_documents` function)
- **HTML CSS to PDF** API account

---

## 🚀 Setup Instructions

1. **Import** the workflow JSON into your n8n instance
2. **Create credentials** in n8n for each service listed above
3. **Replace all placeholders** in the JSON with your actual IDs:

| Placeholder | Replace with |
|---|---|
| `YOUR_KPI_DATA_SHEET_ID` | Your KPI_Data Google Sheet ID |
| `YOUR_KPI_RESULT_SHEET_ID` | Your KPI_Result Google Sheet ID |
| `YOUR_SHEET2_GID` | Sheet2 tab GID from KPI_Data |
| `YOUR_GOOGLE_DRIVE_FOLDER_ID` | Target folder ID in Google Drive |
| `YOUR_WEBHOOK_PATH_UUID` | A generated UUID for your webhook path |
| `YOUR_OPENAI_CREDENTIAL_ID` | Your n8n OpenAI credential ID |
| `YOUR_GOOGLE_SHEETS_CREDENTIAL_ID` | Your n8n Google Sheets credential ID |
| `YOUR_GOOGLE_DRIVE_CREDENTIAL_ID` | Your n8n Google Drive credential ID |
| `YOUR_GOOGLE_GEMINI_CREDENTIAL_ID` | Your n8n Gemini credential ID |
| `YOUR_SUPABASE_CREDENTIAL_ID` | Your n8n Supabase credential ID |
| `YOUR_HTML_TO_PDF_CREDENTIAL_ID` | Your n8n HTML to PDF credential ID |
| `YOUR_N8N_INSTANCE_ID` | Your n8n instance ID |

4. **Populate the Supabase vector store** with your KPI interpretation documents
5. **Activate the workflow** and trigger it via POST to your webhook URL

---

## 🛡️ Error Handling

| Case | Behavior |
|---|---|
| `Temps_planifie_min = 0` | OEE = 0, workflow continues |
| `Production_reelle = 0` | Performance = 0, Quality = 0 |
| `Quantite_defectueuse > Production_reelle` | Marked as `CRITIQUE` |
| Missing value | Returns 0 and `CRITIQUE` |



## 👤 Author

**ELY.Automation** 

*Built with n8n · OpenAI · Google Sheets · Supabase · Google Drive*