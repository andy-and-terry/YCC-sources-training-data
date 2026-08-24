# YCC AI Backend API

A val.town HTTP endpoint that proxies chat requests to Ollama's cloud API, with per-ID byte-usage tracking and rate limiting.

## Endpoint

```
POST https://andyandterry--3993b1649f9e11f19dda1607ee4eb77e.web.val.run
```

## Request

```json
{
  "id": "user123",
  "model": "gpt-oss:20b",
  "message": "hello"
}
```

| Field     | Type   | Description                                  |
|-----------|--------|-----------------------------------------------|
| `id`      | string | Registered client ID (must exist in `usage` table) |
| `model`   | string | Ollama model name (e.g. `gpt-oss:20b`, `YCC-2-chat`) |
| `message` | string | User prompt/message text                     |

## Response

```json
{
  "id": "user123",
  "reply": "Hello! How can I help you today?"
}
```

## Errors

| Status | Body                          | Meaning                          |
|--------|-------------------------------|-----------------------------------|
| 405    | `{"error":"POST only"}`       | Wrong HTTP method                |
| 403    | `{"error":"Unknown id"}`      | `id` not found in `usage` table  |
| 403    | `{"error":"Banned"}`          | `BYTES_SENT` >= `MAX_BYTES`      |

## Usage

### JavaScript (fetch)

```javascript
const res = await fetch("https://andyandterry--3993b1649f9e11f19dda1607ee4eb77e.web.val.run", {
  method: "POST",
  headers: { "content-type": "application/json" },
  body: JSON.stringify({
    id: "user123",
    model: "gpt-oss:20b",
    message: "hello"
  })
});

const data = await res.json();
console.log(data.reply);
```

### curl

```bash
curl -X POST https://andyandterry--3993b1649f9e11f19dda1607ee4eb77e.web.val.run \
  -H "content-type: application/json" \
  -d '{"id":"user123","model":"gpt-oss:20b","message":"hello"}'
```

### PowerShell

```powershell
(Invoke-WebRequest -Uri "https://andyandterry--3993b1649f9e11f19dda1607ee4eb77e.web.val.run" `
  -Method POST -ContentType "application/json" `
  -Body '{"id":"user123","model":"gpt-oss:20b","message":"hello"}' `
  -UseBasicParsing).Content
```

## Usage Tracking

Every request updates a SQLite table (`usage`) that tracks bytes sent/received per ID:

| Column           | Type    | Description                          |
|------------------|---------|----------------------------------------|
| `id`             | TEXT    | Primary key, client identifier        |
| `BYTES_SENT`     | INTEGER | Cumulative bytes sent by this ID      |
| `BYTES_RETURNED` | INTEGER | Cumulative bytes returned to this ID  |
| `MAX_BYTES`      | INTEGER | Byte cap before ID is banned          |

Once `BYTES_SENT >= MAX_BYTES`, the ID is permanently banned until manually reset.

### Registering a new ID

New IDs are **not** auto-created. Add via `/seed` route or direct SQL insert:

```sql
INSERT OR REPLACE INTO usage (id, BYTES_SENT, BYTES_RETURNED, MAX_BYTES)
VALUES ('newuser', 0, 0, 100000);
```

### Debug endpoint

```
GET /debug
```

Returns the full `usage` table as JSON — useful for verifying registered IDs and current byte counts.

## Environment Variables

| Variable    | Description                        |
|-------------|-------------------------------------|
| `ollamaapi` | Bearer token for `ollama.com` API  |

## Notes

- Model calls are routed through `https://ollama.com/api/chat` (cloud Ollama, non-streaming).
- SQL queries use inline-escaped string interpolation rather than parameterized `?` placeholders, due to a binding issue observed in val.town's SQLite client.
