FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        server.js .
COPY        package.json ./
RUN         npm install
ENTRYPOINT  [ "node", "server.js" ]