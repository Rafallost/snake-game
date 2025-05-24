# This project demonstrates an automated process for building, testing, and deploying a Snake application in Go using Jenkins and Docker containers.
#  Projekt ten demonstruje zautomatyzowany proces tworzenia, testowania i wdrażania aplikacji Snake w języku Go przy użyciu narzędzia Jenkins i kontenerów Docker.

# How to run
1. git clone https://github.com/Rafallost/snake-game.git
2. cd snake-game
3. docker compose build
4. docker compose up
5. docker run --rm -d \
    -p 8082:8080 -p 50002:50000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v jenkins_home:/var/jenkins_home \
    jenkins/jenkins:lts

# Configure Jenkins, create pipeline. Remember about credentials dockerhub-creds to dockerhub
6. firefox http://localhost:8082

# To run game docker
* docker run -ti rafal206/snake-game

# Project Structure
* Dockerfile.build – an image to build the application
* Dockerfile.test – an image to run tests
* Dockerfile.deploy – an image to deploy the application
* Dockerfile.smoke – an image to test smoke tests
* docker-compose.yml – a definition of Docker services
* Jenkinsfile.B – a CI/CD pipeline in Jenkins

# Requirements
* Docker
* Docker Compose
* Jenkins (e.g. locally at localhost:8082)
* A DockerHub account (for publishing artifacts)

# Pipeline in Jenkins
* Install Jenkins (e.g. as a Docker container).
* Make sure that Jenkins is running e.g. on http://localhost:8082.
* Configure a new pipeline:
* Source: https://github.com/Rafallost/snake-game.git
* Branch: master
* Pipeline file: Jenkinsfile.B
* Make sure that Jenkins has access to Docker (e.g. runs in a container with docker.sock).
* Add dockerhub-creds (credentials ID) in Jenkins to enable publishing.

# flow of pipeline
1. Clones repository
2. Builds a container with the application (Dockerfile.build)
3. Runs tests in the container (Dockerfile.test)
4. Builds a deploy image (Dockerfile.deploy)
5. Verifies operation via smoke_test.sh in a separate container (Dockerfile.smoke)
6. Pushes the finished image to DockerHub as an artifact

# Artifacts
* build.log – build log
* test_logs.log – test results
* smoke.log – (if configured) smoke test results

# publish
* docker pull rafal206/snake-game:v1.0.0

# License
* The application code comes from a public repository:
* https://github.com/DyegoCosta/snake-game
* License MIT – permitted use for educational purposes.
