# System Architecture

## Overview

This project is an AI-powered customer support automation built with n8n, Ollama, Docker, PHP, and MySQL.

The system receives customer messages through a webhook, processes them using a local Large Language Model (LLM), stores conversation history in MySQL, and returns an AI-generated response.

---

## Components

### n8n

- Receives incoming webhook requests.
- Orchestrates the workflow.
- Sends prompts to Ollama.
- Stores chat history.
- Returns JSON responses.

### Ollama

- Runs the local AI model.
- Generates responses.
- No external API required.

### MySQL

Stores:

- User messages
- AI responses
- Timestamp
- Session ID

### Docker

Runs every service inside containers.

---

## Data Flow

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

## Project Goal

Create a production-ready AI customer support workflow that can be extended to websites, WhatsApp, Telegram, and other communication channel
