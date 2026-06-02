
***PROJECT INFO***
A mini API test case project using the GitHub REST API, to demonstrate full stack QA knowledge of APIs, Postman, Automated API tests, and CI/CD integration. It covers a CRUD flow, includes using a token, and has negative cases for 404, 401, 400 and 422 status codes.

***Environment Variables***
- baseURL
- repo
- owner
- githubToken or secrets.PAT_TOKEN (ex: Fine-grained PAT generated in github)

***Newman Command***
newman run collections\QA-Portfolio-Project.postman_collection.json -e environments\QA-Portfolio-Project.postman_environment.json --env-var "github_token=${{ secrets.PAT_TOKEN }}"


***Aditional Notes***
x
