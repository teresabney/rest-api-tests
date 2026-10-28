# REST API Test Suite — GitHub REST API

[![API Tests - Newman](https://github.com/teresabney/rest-api-tests/actions/workflows/ci.yml/badge.svg)](https://github.com/teresabney/rest-api-tests/actions/workflows/ci.yml)

## Project Info
A mini API test project using the GitHub REST API api.github.com to demonstrate full stack QA knowledge 
of APIs, Postman, automated API testing, and CI/CD integration. It covers a CRUD flow, 
token-based authentication, and negative test cases for 400, 401, 404, and 422 status codes.

## Environment Variables

**Shell variables (what you provide)**

| Variable | Maps to Postman variable | Description | Sensitive |
|---|---|---|---|
| `REPO_OWNER` | `owner` | GitHub account owner (username) | Yes |
| `PAT_TOKEN` | `githubToken` | Fine-grained personal access token | Yes |

**Postman variables (used inside the collection)**

| Variable | Description | Sensitive |
|---|---|---|
| baseURL | GitHub API base URL | No |
| repo | Repository name used in tests | No |
| owner | GitHub account owner (set from `REPO_OWNER`) | Yes |
| githubToken | Fine-grained personal access token (set from `PAT_TOKEN`) | Yes |

## Prerequisites

**Option 1 — Run with Docker (recommended)**
- Docker Desktop installed and running

**Option 2 — Run locally without Docker**
- Node.js 20+
- Newman: `npm install -g newman`
- HTML reporter: `npm install -g newman-reporter-htmlextra`

## Running Locally
Optional: You can create a .env file in the project root with the 2 required values for REPO_OWNER and PAT_TOKEN.

**With Docker:**
```
docker build -t rest-api-tests .

docker run --rm \
  -e PAT_TOKEN=<github-personal-access-token> \
  -e REPO_OWNER=<github-username> \
  -v "$(pwd)/reports:/app/reports" \
  rest-api-tests
```

**Without Docker:**
```
newman run "collections/QA-Portfolio-Project.postman_collection.json" \
  -e "environments/QA-Portfolio-Project.postman_environment.json" \
  --env-var "owner=<github-username>" \
  --env-var "githubToken=<github-personal-access-token>" \
  --reporters cli,junit,htmlextra \
  --reporter-junit-export reports/results.xml \
  --reporter-htmlextra-skipHeaders "Authorization" \
  --reporter-htmlextra-export reports/report.html
```

**With Docker (using local .env file):**
```
docker build -t rest-api-tests .

docker run --rm \
  --env-file .env \
  -v "$(pwd)/reports:/app/reports" \
  rest-api-tests
```

**Without Docker (using local .env file):**
```
./run-tests.sh
```

## CI/CD
This project uses GitHub Actions to automatically run tests on every push to main.
Tests run inside a Docker container for a consistent, isolated environment.

`PAT_TOKEN` and `REPO_OWNER` are stored as GitHub Secrets. The workflow injects them into the container as environment variables of the same names, and `run-tests.sh` passes them to Newman as `githubToken` and `owner`.

Reports are generated inside the container and uploaded as pipeline artifacts after each run.