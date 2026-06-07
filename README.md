# REST API Test Suite — GitHub REST API

[![Run Newman API Tests](https://github.com/teresabney/rest-api-tests/actions/workflows/run-tests.yml/badge.svg)](https://github.com/teresabney/rest-api-tests/actions/workflows/run-tests.yml)

## Project Info
A mini API test project using the GitHub REST API to demonstrate full stack QA knowledge 
of APIs, Postman, automated API testing, and CI/CD integration. It covers a CRUD flow, 
token-based authentication, and negative test cases for 400, 401, 404, and 422 status codes.

## Environment Variables
| Variable | Description | Sensitive |
|---|---|---|
| baseURL | GitHub API base URL | No |
| repo | Repository name used in tests | No |
| owner | GitHub account owner | Yes |
| githubToken | Fine-grained personal access token | Yes |

## Prerequisites

**Option 1 — Run with Docker (recommended)**
- Docker Desktop installed and running

**Option 2 — Run locally without Docker**
- Node.js 20+
- Newman: `npm install -g newman`
- HTML reporter: `npm install -g newman-reporter-htmlextra`

## Running Locally
The environment file is included with non-sensitive variables. Before running locally:
- `owner` — replace with your GitHub username in the environment file
- `repo` — optionally replace with your preferred test repository name

**With Docker:**
docker run --rm 
-e githubToken=your-actual-token 
-e owner=your-actual-ownername 
api-tests

**Without Docker:**
newman run collections/QA-Portfolio-Project.postman_collection.json 
-e environments/QA-Portfolio-Project.postman_environment.json 
--env-var "githubToken=your-actual-token" 
--env-var "owner=your-actual-ownername"

## CI/CD
This project uses GitHub Actions to automatically run tests on every push to main.
Tests run inside a Docker container for a consistent, isolated environment.
`githubToken` and `owner` are stored as GitHub Secrets and injected at runtime.

Reports are generated inside the container and uploaded as pipeline artifacts after each run.