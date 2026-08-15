# Use official Node.js base image
FROM node:20-slim

# Set working directory inside the container
WORKDIR /app

# Install Newman and HTML reporter globally
RUN npm install -g newman newman-reporter-htmlextra

# Copy project files into the container
COPY . .

# Ensure the test script is executable regardless of host permissions
RUN chmod +x run-tests.sh

# Run the tests -- This option supports both variable expansion and JSON array (exec) format.
CMD ["./run-tests.sh"]
