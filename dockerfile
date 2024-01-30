FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        server.js .
COPY        package.json ./
# Set environment variable for MONGO
ENV         MONGO true
RUN         npm install
#RUN         npm install mongodb@2.2.33
#COPY        schema/catalogue.js /usr/src/app/schema/
#RUN         mongo --host mongo-service < schema/catalogue.js
# Copy the MongoDB schema initialization script
COPY        init-mongo.sh /app/

# Grant execution permission to the script
RUN         chmod +x /app/init-mongo.sh

# Run the MongoDB schema initialization script during the build
RUN ./init-mongo.sh
ENTRYPOINT  [ "node", "server.js" ]