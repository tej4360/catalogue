FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        server.js .
COPY        package.json ./
RUN         npm install
COPY        node_modules node_modules
ENTRYPOINT  [ "node", "server.js" ]