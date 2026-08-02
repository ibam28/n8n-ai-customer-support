# Setup Guide

## Requirements

Before running this project, make sure the following software is installed:

- Docker
- Docker Compose
- Ollama
- Git

---

## Clone Repository

```bash
git clone https://github.com/ibam28/n8n-ai-customer-support.git
cd n8n-ai-customer-support
```

---

## Start Docker

```bash
docker compose up -d
```

---

## Pull AI Model

```bash
ollama pull qwen2.5:3b
```

---

## Open n8n

```
http://localhost:5678
```

Import:

```
workflow/customer-support.json
```

---

## Configure Database

Update your MySQL credentials inside the n8n workflow before running the project.

---

## Test API

Example request:

```bash
curl -X POST http://localhost:5678/webhook/customer-support \
-H "Content-Type: application/json" \
-d '{
  "name":"John Doe",
  "email":"john@example.com",
  "phone":"+628123456789",
  "message":"Hello"
}'
```

---

## Expected Response

```json
{
  "reply": "Hello John! How can I help you today?"
}
```

