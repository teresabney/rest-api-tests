#!/bin/sh
newman run "collections/QA-Portfolio-Project.postman_collection.json" \
    -e "environments/QA-Portfolio-Project.postman_environment.json" \
    --env-var "githubToken=$githubToken" \
    --env-var "owner=$owner" \
    --reporters cli,junit,htmlextra \
    --reporter-junit-export reports/results.xml \
    --reporter-htmlextra-skipHeaders "Authorization" \
    --reporter-htmlextra-export reports/report.html
