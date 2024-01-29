FROM node

# Set environment variable for conditional execution
ARG SCHEMA_SETUP

# Create the app directory
RUN mkdir /app
WORKDIR /app

# Copy the application files
COPY server.js .
COPY package.json ./

# Install Node.js dependencies
RUN npm install
RUN npm install mongodb@2.2.33

RUN apt-get update && apt-get install -y mongodb-org-shell \

# Download DocDB PEM File
ADD https://truststore.pki.rds.amazonaws.com/us-east-1/us-east-1-bundle.pem /app/rds-combined-ca-bundle.pem

# Execute the MongoDB
RUN echo "mongo" > /app/load-schema.sh \
    && chmod +x /app/load-schema.sh

# Set the default command to run when the container starts
ENTRYPOINT ["node", "server.js"]