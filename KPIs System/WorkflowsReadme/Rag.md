# 🧠 ELY.KPI — VectorBase Ingestion Workflow

> Automatic PDF ingestion pipeline that populates the KPI knowledge base — watches a Google Drive folder, extracts text from PDFs, splits it into chunks, embeds it with Gemini, and stores it in Supabase Vector Store.

---

## 📌 Overview

This n8n workflow is the **knowledge base builder** of the ELY.KPI system. It feeds the **KPI_VectorBase** — the Supabase vector store that the RAG AI Agent queries to interpret each KPI result.

Every time a new PDF is dropped into the designated Google Drive folder, this workflow automatically:

1. Detects the new file (polling every minute)
2. Downloads it from Google Drive
3. Extracts the raw text from the PDF
4. Splits the text into token chunks (300 tokens, 100 overlap)
5. Embeds each chunk using Google Gemini embeddings
6. Inserts the embedded vectors into the Supabase `documents` table

---

## 🏗️ Architecture

```
Google Drive Folder (watched)
        │
        │ new PDF detected (every minute)
        ▼
Google Drive Trigger
        │
        ▼
Edit Fields (extract file ID)
        │
        ▼
Download File (Google Drive)
        │
        ▼
Extract from File (PDF → raw text)
        │
        ▼
Vector_Base_Kpis (Supabase Vector Store — insert mode)
        ├── Default Data Loader
        │         └── Token Splitter (chunk: 300, overlap: 100)
        └── Embeddings Google Gemini (gemini-embedding-001)
```

---

## 🔄 Workflow Steps

### Step 1 — Google Drive Trigger
Polls the designated Google Drive folder **every minute** for newly created files. When a new PDF appears, it triggers the workflow automatically.

### Step 2 — Edit Fields
Extracts the `id` field from the Drive trigger output to use as the file reference for download.

### Step 3 — Download File
Downloads the detected PDF file from Google Drive as binary data.

### Step 4 — Extract from File
Parses the downloaded PDF and extracts its raw text content.

### Step 5 — Token Splitter
Splits the extracted text into overlapping chunks for optimal vector search:
- **Chunk size:** 300 tokens
- **Chunk overlap:** 100 tokens

### Step 6 — Default Data Loader
Wraps the chunks into document format compatible with the LangChain vector store node.

### Step 7 — Embeddings Google Gemini
Converts each text chunk into a vector embedding using `gemini-embedding-001`.

### Step 8 — Vector_Base_Kpis (Supabase Insert)
Inserts all embedded chunks into the Supabase `documents` table using the `match_documents` query function. The data is now searchable by the RAG AI Agent.

---

## 📚 What Documents to Add?

The KPI_VectorBase should contain reference documents about industrial performance standards. Recommended content:

| Document Type | Examples |
|---|---|
| Lean Manufacturing standards | OEE methodology, TPM guides |
| KPI interpretation guides | Benchmark values by sector |
| Maintenance best practices | Preventive maintenance plans |
| Quality standards | ISO 9001, Six Sigma references |
| Industry benchmarks | OEE by sector (Automotive, Textile, etc.) |
| Corrective action guides | Root cause analysis, 5-Why, Ishikawa |

> 💡 The richer the VectorBase, the more precise and actionable the AI Agent's KPI interpretations will be.

---

## ⚙️ Prerequisites

Before importing this workflow, configure the following credentials in n8n:

- **Google Drive OAuth2** — access to the watched folder
- **Google Gemini (PaLM) API** — for generating embeddings
- **Supabase API** — access to your project with the `documents` table and `match_documents` function

---

## 🗄️ Required Supabase Setup

The `documents` table must exist in your Supabase project with pgvector enabled. Run this SQL to set it up:

```sql
-- Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Create documents table
CREATE TABLE documents (
  id BIGSERIAL PRIMARY KEY,
  content TEXT,
  metadata JSONB,
  embedding VECTOR(768)
);

-- Create similarity search function
CREATE OR REPLACE FUNCTION match_documents (
  query_embedding VECTOR(768),
  match_count INT DEFAULT 5,
  filter JSONB DEFAULT '{}'
)
RETURNS TABLE (
  id BIGINT,
  content TEXT,
  metadata JSONB,
  similarity FLOAT
)
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN QUERY
  SELECT
    documents.id,
    documents.content,
    documents.metadata,
    1 - (documents.embedding <=> query_embedding) AS similarity
  FROM documents
  WHERE metadata @> filter
  ORDER BY documents.embedding <=> query_embedding
  LIMIT match_count;
END;
$$;
```

> ⚠️ The vector dimension `768` matches `gemini-embedding-001`. If you use a different model, adjust accordingly.

---

## 🚀 Setup Instructions

1. **Import** the workflow JSON into your n8n instance
2. **Configure credentials** for Google Drive, Gemini, and Supabase
3. **Replace all placeholders:**

| Placeholder | Replace with |
|---|---|
| `YOUR_GOOGLE_DRIVE_FOLDER_ID` | ID of your Google Drive folder to watch |
| `YOUR_FOLDER_NAME` | Display name of the folder |
| `YOUR_GOOGLE_DRIVE_CREDENTIAL_ID` | Your n8n Google Drive credential ID |
| `YOUR_GOOGLE_DRIVE_CREDENTIAL_NAME` | Your n8n Google Drive credential name |
| `YOUR_GOOGLE_GEMINI_CREDENTIAL_ID` | Your n8n Gemini API credential ID |
| `YOUR_GOOGLE_GEMINI_CREDENTIAL_NAME` | Your n8n Gemini API credential name |
| `YOUR_SUPABASE_CREDENTIAL_ID` | Your n8n Supabase credential ID |
| `YOUR_SUPABASE_CREDENTIAL_NAME` | Your n8n Supabase credential name |
| `YOUR_N8N_INSTANCE_ID` | Your n8n instance ID |

4. **Create the `documents` table** in Supabase using the SQL above
5. **Activate the workflow** in n8n
6. **Drop a PDF** into the watched Google Drive folder
7. **Verify** the vectors appear in the Supabase `documents` table

---

## 🔗 Role in the ELY.KPI System

```
┌─────────────────────────────────────────────────────┐
│               ELY.KPI SYSTEM                        │
│                                                     │
│  This Workflow ──► KPI_VectorBase (Supabase)        │
│                          │                          │
│                          │ queried by               │
│                          ▼                          │
│               RAG AI Agent (Workflow 2)             │
│               interprets each KPI result            │
└─────────────────────────────────────────────────────┘
```

This workflow runs **independently** and only needs to be triggered when new knowledge documents are added. The RAG agent in Workflow 2 will automatically benefit from any new content inserted into the VectorBase.

## 👤 Author

**ELY.Automation**

---

*Built with n8n · Google Drive · Google Gemini · Supabase pgvector*