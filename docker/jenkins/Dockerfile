FROM jenkins/jenkins:lts
USER root
# zainstaluj Docker CLI
RUN apt-get update && apt-get install -y docker.io && \
    curl -fsSL https://get.docker.com | sh
# plugin Docker Pipeline (opcjonalnie)
RUN jenkins-plugin-cli --plugins docker-workflow
# udostępnij socket
USER jenkins