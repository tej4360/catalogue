FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        server.js .
COPY        package.json ./
RUN         npm install
# Copy the rest of the application code
COPY        . .
ENTRYPOINT  [ "node", "server.js" ]