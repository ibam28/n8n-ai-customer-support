# AI Customer Support Architecture

## Overview

AI Customer Support is a self-hosted automation platform built with Docker, n8n, MySQL, Ollama, and PHP.

The system receives customer messages, stores conversation history, processes requests using a local Large Language Model (LLM), and returns AI-generated responses.

The architecture is designed to be modular, scalable, and independent from external AI providers.

---

# Design Principles

- Self-hosted first
- Local AI by default
- Docker-based deployment
- Database normalization
- Modular workflow design
- Multi-channel ready
- Easy to extend

---

# System Components

## PHP

Responsibilities

- Customer web interface
- Send requests to n8n
- Display AI responses

---

## n8n

Responsibilities

- Receive webhook requests
- Execute automation workflows
- Connect MySQL and Ollama
- Return JSON responses

---

## MySQL

Responsibilities

- Store customer data
- Store conversations
- Store messages
- Store AI logs

---

## Ollama

Responsibilities

- Run local LLM
- Generate AI responses
- Process prompts

---

# Project Structure

```
n8n-ai-customer-support/

├── assets/
├── database/
│   └── init.sql
├── docs/
│   └── architecture.md
├── php/
├── workflows/
├── docker-compose.yml
├── .env
├── README.md
└── LICENSE
```

---

# Database Architecture

```
customers
    │
    │ 1:N
    ▼
conversations
    │
    │ 1:N
    ▼
messages
    │
    │ 1:1
    ▼
ai_logs
```

## customers

Stores customer profile information.

## conversations

Stores customer chat sessions.

## messages

Stores every message from customer and AI.

## ai_logs

Stores AI processing information including model, prompt, response, latency, and errors.

---

# Request Flow

```
Customer

↓

Website (PHP)

↓

n8n Webhook

↓

Find Customer

↓

Create Conversation

↓

Store User Message

↓

Ollama

↓

Store AI Log

↓

Store Assistant Message

↓

Return Response

↓

Customer
```

---

# Data Flow

```
Customer Message
        │
        ▼
      n8n
        │
        ├──────────────► MySQL
        │
        └──────────────► Ollama
                              │
                              ▼
                        AI Response
                              │
                              ▼
                           MySQL
                              │
                              ▼
                         JSON Response
```

---

# Current Project Status

Current Version

MVP v1.0

Completed

- Docker Environment
- MySQL
- Database Schema
- Customer Model
- Conversation Model
- Message Model
- AI Log Model

In Progress

- Adminer
- n8n Workflow
- Ollama Integration

Planned

- WhatsApp Integration
- Telegram Integration
- Discord Integration
- Knowledge Base (RAG)
- Human Agent Handover
- CRM Integration

---

# Future Goals

The project aims to become a production-ready AI Customer Support platform capable of serving multiple communication channels using a single workflow architecture.
