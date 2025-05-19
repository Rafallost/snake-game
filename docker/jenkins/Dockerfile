FROM jenkins/jenkins:lts
USER root

RUN apt-get update && apt-get install -y docker.io && \
    curl -fsSL https://get.docker.com | sh

RUN jenkins-plugin-cli --plugins docker-workflow

# share socket
USER jenkins