![cover](https://github.com/rodrigofontesdev/polls/assets/17281370/a6e68a10-b918-4740-beca-d640e6e61416)

# Polls

A real-time voting system where users can create a poll and other users can cast their votes. The system generates a ranking among the options and updates the votes in real-time.

## Prerequisites

- Node.js
- Docker

## Getting Started

- Clone the repository (`git clone git@github.com:rodrigofontesdev/polls.git`)
- Install dependencies (`npm install`)
- Setup PostgreSQL and Redis (`docker compose up -d`)
- Check if PostgreSQL and Redis containers is running (`docker ps`)
- Copy .env.example file (`cp .env.example .env`)
- Install database migrations (`npx prisma migrate dev`)
- Run application (`npm run dev`);

![run-application](https://github.com/rodrigofontesdev/polls/assets/17281370/f889a4bc-a4d8-4c5f-8bf1-d323d63aa019)

- Test it! (I personally recommend testing with [Postman](https://www.postman.com/downloads/).

## Postman

Postman is an API platform for building and using APIs.

### Setup

- Auth: No Auth
- BASE_URL: `http://localhost:3333`

## HTTP

### POST `/polls`

Create a new poll.

**Request body**

```json
{
    "title": "What's the best programming language?",
    "options": [
        "JavaScript",
        "PHP",
        "Python",
        "C#"
    ]
}
```

**Response body**

```json
{
    "pollId": "63da756d-fa3e-490f-9ae4-f84ca7e1382a"
}
```

### GET `/polls/:pollId`

Return data from a single poll.

**Response body**

```json
{
    "poll": {
        "id": "63da756d-fa3e-490f-9ae4-f84ca7e1382a",
        "title": "What's the best programming language?",
        "options": [
            {
                "id": "fa041e69-e9da-43e8-aeb5-924e90ed2c47",
                "title": "JavaScript",
                "score": 0
            },
            {
                "id": "c5f59631-e453-4a31-9328-70fe0fbce65a",
                "title": "PHP",
                "score": 0
            },
            {
                "id": "3c6ab025-8fff-442d-beba-dc985024d0fa",
                "title": "Python",
                "score": 0
            },
            {
                "id": "fc909c07-70f6-4eb6-bb45-38d16ebba998",
                "title": "C#",
                "score": 0
            }
        ]
    }
}
```

### POST `/polls/:pollId/votes`

Add a vote to specific poll.

**Request body**

```json
{
    "pollOptionId": "fa041e69-e9da-43e8-aeb5-924e90ed2c47"
}
```

## WebSockets

### ws `/polls/:pollId/results`

```json
{
    "pollOptionId": "fa041e69-e9da-43e8-aeb5-924e90ed2c47",
    "votes": 1
}
```
