
***PROJECT INFO***
A mini project using the GitHub REST API, to demonstrate full stack QA knowledge of APIs, Postman, Automated API tests, and CI/CD integration. It covers a CRUD flow, includes using a token, and has negative cases for 404, 401, 400 and 422 status codes.


Note: Environment file is not included. 
Create your own environment file with the following variables:
- baseURL
- repo
- owner
- githubToken (ex: Fine-grained PAT generated in github)



***NEWMAN PROJECT COMMAND***
newman run C:\Users\user\Documents\QA_Project_2026\my_api_tests\collections\QA-Portfolio-Project.postman_collection.json -e C:\Users\user\Documents\QA_Project_2026\my_api_tests\environments\QA-Portfolio-Project.postman_environment.json


***ADDITIONAL NEWMAN NOTES***
NOTE: HTML report — readable in a browser
newman run "collection.json" -e "environment.json" --reporters html --reporter-html-export reports/report.html
NOTE: JUnit XML — used by CI/CD pipelines to display test results
newman run "collection.json" -e "environment.json" --reporters junit --reporter-junit-export reports/results.xml


