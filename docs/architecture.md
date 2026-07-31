# System Architecture

## Overview

n8n AI Customer Support is an automation system that receives customer messages through a webhook, processes them with a local AI model using Ollama, stores conversation history in MySQL, and returns an AI-generated response.

The project is designed to be lightweight, self-hosted, and easy to extend to other communication channels such as websites, WhatsApp, Telegram, or Discord.

---

# Objectives

- Automate customer support responses.
- Run entirely on a local server.
- Avoid external AI API costs.
- Store conversation history.
- Provide a clean and scalable workflow.

---

# Components

## n8n

Responsibilities:

- Receive webhook requests.
- Validate incoming data.
- Send prompts to Ollama.
- Save conversations to MySQL.
- Return JSON responses.

---

## Ollama

Responsibilities:

- Run the local Large Language Model.
- Generate AI responses.
- Process prompts from n8n.

---

## MySQL

Stores:

- Session ID
- Customer message
- AI response
- Timestamp

---

## Docker

Responsibilities:

- Run every service in isolated containers.
- Simplify deployment.
- Ensure consistent environments.

---

# Data Flow

Client

↓

n8n Webhook

↓

Ollama

↓

MySQL

↓

JSON Response

---

# Future Integrations

The architecture is designed to support:

- Website Chat Widget
- WhatsApp
- Telegram
- Discord
- Email Automation
- CRM Systems

without major workflow changes.

---

# Project Status

Current Version:

MVP (Minimum Viable Product)

Current Phase:

Architecture & Infrastructure Design
