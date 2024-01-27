FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        server.js .
COPY        package.json ./
RUN         npm install
RUN         npm install mongodb@2.2.33
ENTRYPOINT  [ "node", "server.js" ]