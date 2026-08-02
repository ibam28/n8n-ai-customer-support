# API Documentation

## Overview

The AI Customer Support Platform exposes a REST webhook endpoint that accepts customer messages, processes them using a local AI model, and returns AI-generated responses.

---

## Endpoint

**Method**

```http
POST
```

**URL**

```text
/webhook/customer-support
```

> Replace the URL with your actual n8n webhook endpoint when deploying.

---

## Request Headers

| Header | Value |
|---------|-------|
| Content-Type | application/json |

---

## Request Body

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "+628123456789",
  "message": "Hello, I need help with my order."
}
```

---

## Successful Response

**Status Code**

```text
200 OK
```

```json
{
  "reply": "Hello John! How can I help you today?"
}
```

---

## Error Response

```text
400 Bad Request
```

```json
{
  "error": "Missing required fields."
}
```

---

## Processing Flow

1. Receive customer request.
2. Validate request data.
3. Search customer information.
4. Retrieve conversation history.
5. Generate AI response using Ollama.
6. Save conversation to MySQL.
7. Return JSON response.

---

## Future Improvements

- JWT Authentication
- API Versioning
- Rate Limiting
- Request Validation
- OpenAPI (Swagger) Documentation
