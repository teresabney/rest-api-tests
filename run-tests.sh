#!/bin/bash

# This bit is only for environments that have their own env file.
if [ -f .env ]; then
    set -a
    source .env
    set +a
fi

# The command to run the tests.
newman run "collections/QA-Portfolio-Project.postman_collection.json" \
    -e "environments/QA-Portfolio-Project.postman_environment.json" \
    --env-var "owner=$owner" \
    --env-var "githubToken=$githubToken" \
    --reporters cli,junit,htmlextra \
    --reporter-junit-export reports/results.xml \
    --reporter-htmlextra-skipHeaders "Authorization" \
    --reporter-htmlextra-export reports/report.html
    