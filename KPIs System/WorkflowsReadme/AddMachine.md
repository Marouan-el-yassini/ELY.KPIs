# ⚙️ ELY.KPI — Data Ingestion Workflow

> Webhook-based production data ingestion pipeline — writes raw machine data to Google Sheets and Supabase simultaneously.

---

## 📌 Overview

This n8n workflow acts as the **data entry point** of the ELY.KPI system. It exposes a POST webhook that receives production data for a given machine and date, then:

1. Appends or updates the row in the **KPI_Data Google Sheet**
2. Inserts the same record into a **Supabase `machine_sessions` table**
3. Returns a confirmation response

It is designed to be called by any external system (dashboard, IoT device, form, frontend app, etc.) that collects production data on the shop floor.

---

## 🏗️ Architecture

```
POST /webhook
      │
      ▼
Google Sheets — KPI_Data (append or update by Machine)
      │
      ▼
Supabase — machine_sessions (insert row)
      │
      ▼
Respond to Webhook → "Element Added Successfully"
```

---

## 🔄 Workflow Steps

### Step 1 — Webhook Trigger

Listens for a **POST** request on the configured webhook path.  
The request body must contain the production data fields (see Input Schema below).

### Step 2 — Google Sheets: Append or Update

Writes the received data into the **KPI_Data sheet (Sheet2)**.  
Uses `Machine` as the matching key — if a row with the same machine already exists it updates it, otherwise it appends a new row.

### Step 3 — Supabase: Insert Row

Inserts the same data into the `machine_sessions` table in Supabase.  
Also stores the `company_id` field from the webhook body, enabling multi-tenant support.

### Step 4 — Respond to Webhook

Returns a plain text confirmation:

```
Element Added Successfully
```

---

## 📋 Input Schema (POST body)

Send a JSON body with the following fields:

```json
{
  "Machine": "string",
  "Date": "string",
  "Temps_planifie_min": number,
  "Temps_arret_min": number,
  "Production_theorique": number,
  "Production_reelle": number,
  "Quantite_defectueuse": number,
  "company_id": "string"
}
```

| Field                  | Type   | Description                               |
| ---------------------- | ------ | ----------------------------------------- |
| `Machine`              | string | Machine identifier (used as matching key) |
| `Date`                 | string | Production date (e.g. `2024-01-15`)       |
| `Temps_planifie_min`   | number | Planned production time in minutes        |
| `Temps_arret_min`      | number | Total downtime in minutes                 |
| `Production_theorique` | number | Theoretical target production             |
| `Production_reelle`    | number | Actual production count                   |
| `Quantite_defectueuse` | number | Number of defective units                 |
| `company_id`           | string | Company identifier (for multi-tenant use) |

---

## 🗄️ Supabase Table Schema

Table name: `machine_sessions`

| Column                 | Type    | Description             |
| ---------------------- | ------- | ----------------------- |
| `machine`              | text    | Machine identifier      |
| `date`                 | text    | Production date         |
| `temps_planifie_min`   | numeric | Planned time in minutes |
| `temps_arret_min`      | numeric | Downtime in minutes     |
| `production_theorique` | numeric | Theoretical production  |
| `production_reelle`    | numeric | Actual production       |
| `quantite_defectueuse` | numeric | Defective units         |
| `company_id`           | text    | Company identifier      |

---

## ⚙️ Prerequisites

configure the following credentials in n8n:

- **Google Sheets OAuth2** — access to the KPI_Data spreadsheet
- **Supabase API** — access to your Supabase project with the `machine_sessions` table created

---

## 👤 Author

**ELY.Automation**
--Marouan EL Yassini

_Built with n8n · Google Sheets · Supabase_
