# Use official Node.js base image
FROM node:20-slim

# Set working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Ensure the test script is executable regardless of host permissions
RUN chmod +x run-tests.sh

# Install Newman and HTML reporter globally
RUN npm install -g newman newman-reporter-htmlextra

# Run the tests - This JSON array (exec) format doesn't expand environment variables
# CMD ["newman", "run", "collections/QA-Portfolio-Project.postman_collection.json", \
#     "-e", "environments/QA-Portfolio-Project.postman_environment.json", \
#     "--env-var", "githubToken=$githubToken", \
#     "--env-var", "owner=$owner", \
#     "--reporters", "cli,junit,htmlextra", \
#     "--reporter-junit-export", "reports/results.xml", \
#     "--reporter-htmlextra-export", "reports/report.html"]


# Run the tests -- This shell form runs through /bin/sh which expands environment variables
# CMD newman run "collections/QA-Portfolio-Project.postman_collection.json" \
#    -e "environments/QA-Portfolio-Project.postman_environment.json" \
#    --env-var "githubToken=$githubToken" \
#    --env-var "owner=$owner" \
#    --reporters cli,junit,htmlextra \
#    --reporter-junit-export reports/results.xml \
#    --reporter-htmlextra-skipHeaders "Authorization" \
#    --reporter-htmlextra-export reports/report.html

# Run the tests -- This option supports both variable expansion and JSON array (exec) format.
CMD ["./run-tests.sh"]

    