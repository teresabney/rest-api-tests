
# REST API Test Suite - GitHub REST API

[![Run Newman API Tests](https://github.com/teresabney/rest-api-tests/actions/workflows/run-tests.yml/badge.svg)](https://github.com/teresabney/rest-api-tests/actions/workflows/run-tests.yml)

## Project Info
A mini API test project using the GitHub REST API to demonstrate full stack QA knowledge of APIs, Postman, automated API testing, and CI/CD integration. It covers a CRUD flow, includes token-based authentication, and has negative test cases for 400, 401, 404, and 422 status codes.

## Environment Variables
| Variable | Description | Sensitive |
|---|---|---|
| baseURL | GitHub API base URL | No |
| repo | Repository name used in tests | No |
| owner | GitHub account owner | No |
| githubToken | Fine-grained personal access token | Yes |

## Running Locally
The environment file is included with non-sensitive variables. Before running locally, update the following values in the environment file:
- `owner` — replace with your GitHub username
- `repo` — optionally replace with your preferred test repository name

Then pass your personal access token at runtime:

```
newman run collections/QA-Portfolio-Project.postman_collection.json \
  -e environments/QA-Portfolio-Project.postman_environment.json \
  --env-var "githubToken=your-actual-token"
```

## CI/CD
This project uses GitHub Actions to automatically run tests on every push to main. The `githubToken` is stored as a GitHub Secret and injected at runtime.