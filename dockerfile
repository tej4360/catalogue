# # Use an official MongoDB image to run MongoDB schema initialization
# FROM        mongo:latest as mongo-init
#
# # Create app directory
# WORKDIR     /app
#
# # Copy the MongoDB schema initialization script
# COPY        init-mongo.sh /app/
# COPY        schema/catalogue.js /app/
#
# # Grant execution permission to the script
# RUN         chmod +x /app/init-mongo.sh
#
# # Run the MongoDB schema initialization script
# RUN         ./init-mongo.sh

####
FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        server.js .
COPY        package.json ./
# Set environment variable for MONGO
ENV         MONGO true
RUN         npm install
#RUN         npm install mongodb@2.2.33
COPY        schema/catalogue.js /usr/src/app/schema/
#RUN         mongo --host mongo-service < schema/catalogue.js
# Copy MongoDB schema (optional, depending on your application structure)
# COPY        --from=mongo-init /app/schema /app/schema
ENTRYPOINT  [ "node", "server.js" ]