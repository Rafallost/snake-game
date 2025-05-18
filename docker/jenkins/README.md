docker network create jenkins-net

# DIND (jeśli chcesz dedykowany daemon)
docker run -d --name jenkins-dind \
  --network jenkins-net \
  --privileged \
  docker:24-dind

# Jenkins
docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  --network jenkins-net \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker/jenkins:custom
