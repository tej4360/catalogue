FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        server.js .
COPY        node_modules node_modules
ADD         https://truststore.pki.rds.amazonaws.com/us-east-1/us-east-1-bundle.pem /app/rds-combined-ca-bundle.pem
COPY        run.sh .
ENTRYPOINT  [ "bash", "run.sh" ]