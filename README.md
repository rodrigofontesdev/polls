![cover](https://github.com/rodrigofontesdev/polls/assets/17281370/3bacf1f7-1753-43cd-a689-7de06f9b4f0f)

# Polls

A real-time voting system where users can create a poll and other users can cast their votes. The system generates a ranking among the options and updates the votes in real-time.

## Prerequisites

- Node.js
- Docker
- Git

## Getting Started

- Clone the repository (`git clone git@github.com:rodrigofontesdev/polls.git`)
- Install dependencies (`npm install`)
- Setup PostgreSQL and Redis (`docker compose up -d`)
- Check if PostgreSQL and Redis containers is running (`docker ps`)

![docker-ps](https://github.com/rodrigofontesdev/polls/assets/17281370/c079e484-e939-42f1-8de0-62d4f4616647)

- Copy .env.example file (`cp .env.example .env`)
- Install database migrations (`npx prisma migrate dev`)

![run-migrations](https://github.com/rodrigofontesdev/polls/assets/17281370/ca23c2bd-7b99-4e89-a716-0c5aba853398)

- Run application (`npm run dev`)

![run-application](https://github.com/rodrigofontesdev/polls/assets/17281370/98b24adc-d1f2-410a-9b00-be268b6bdcb0)

- Test it! (I personally recommend testing with [Hoppscotch](https://hoppscotch.io))

## Prisma Studio

Prisma Studio is a visual editor for the data in your database.

- Run in your terminal (`npx prisma studio`)
- Visit (`http://localhost:5555`)

## Hoppscotch

Hoppscotch is an open-source API development ecosystem that helps you create and test your API requests.

### Setup

- Install the **Hoppscotch Browser Extension** ([Read more here](https://docs.hoppscotch.io/documentation/getting-started/setup#locally-served-apis))
- Open two tabs on browser for Hoppscotch, select **REST** and **Realtime** options in each tab
- Authorization: No Auth

## How to use

### HTTP

### POST `/polls`

Create a new poll.

![create-poll](https://github.com/rodrigofontesdev/polls/assets/17281370/e29de468-f44b-4c56-a7c0-c9e07e32f9ff)

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
    "pollId": "4f111485-be0c-41d5-8f2a-cb9e8933cd2f"
}
```

### GET `/polls/:pollId`

Return data from a single poll.

![get-poll](https://github.com/rodrigofontesdev/polls/assets/17281370/b59535f5-f343-4b68-bd14-943cac39ff78)

**Request body**

`No request body`

**Response body**

```json
{
  "poll": {
    "id": "4f111485-be0c-41d5-8f2a-cb9e8933cd2f",
    "title": "What's the best programming language?",
    "options": [
      {
        "id": "3ef7ed4d-0064-4c95-9788-b96033fc1755",
        "title": "JavaScript",
        "score": 0
      },
      {
        "id": "bfc8a311-0c9a-4753-b1a3-eebfd1fd1480",
        "title": "PHP",
        "score": 0
      },
      {
        "id": "0ea30528-14be-4465-b810-b79eb8211ed8",
        "title": "Python",
        "score": 0
      },
      {
        "id": "337298a6-f7b7-4334-8b6b-9c8d17b697c2",
        "title": "C#",
        "score": 0
      }
    ]
  }
}
```

### POST `/polls/:pollId/votes`

Add a vote to specific poll.

![vote-on-poll](https://github.com/rodrigofontesdev/polls/assets/17281370/f3d4db47-99ae-4b6b-9482-a86306afe796)

**Request body**

```json
{
    "pollOptionId": "3ef7ed4d-0064-4c95-9788-b96033fc1755"
}
```

**Response body**

`No response body`

### WebSockets

### ws `/polls/:pollId/results`

Return votes in realtime on a specific poll.

![update-votes-in-real-time](https://github.com/rodrigofontesdev/polls/assets/17281370/8d3c4de8-31ef-41de-a6f2-5883a0a28bc3)

**Response body**

```json
{
    "pollOptionId": "3ef7ed4d-0064-4c95-9788-b96033fc1755",
    "votes": 1
}
```

## Built With

- Node.js
- Typescript
- Redis
- PostgreSQL
- WebSockets

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/rodrigofontesdev/polls/blob/main/LICENSE.md) file for details.
