# Use official Node.js base image
FROM node:20-slim

# Set working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Install Newman and HTML reporter globally
RUN npm install -g newman newman-reporter-htmlextra

# Run the tests
CMD ["newman", "run", "collections/QA-Portfolio-Project.postman_collection.json", \
     "-e", "environments/QA-Portfolio-Project.postman_environment.json", \
     "--env-var", "githubToken=$githubToken", \
     "--env-var", "owner=$owner", \
     "--reporters", "cli,junit,htmlextra", \
     "--reporter-junit-export", "reports/results.xml", \
     "--reporter-htmlextra-export", "reports/report.html"]