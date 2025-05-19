
# DND explanation.

Below structure is only for DND
├── docker <br>
│   ├── dependencies<br>
│   │   ├── Dockerfile<br>
│   │   └── README.md<br>
│   ├── jenkins<br>
│   │   ├── docker-compose.yml<br>
│   │   ├── Dockerfile<br>
│   │   └── README.md<br>
│   └── tester<br>
│       ├── Dockerfile<br>
│       └── README.md<br>
├── Jenkinsfile-2<br>
└── README.md<br>

1. Prerequisites: Install Docker and Docker Compose.
2. Build Dependencies image:
    * cd docker/dependencies
    * docker build -t rafal206/dependencies:1.0 .
3. Start Jenkins + DIND:
    * cd docker/jenkins
    * docker-compose up -d
4. Retrieve Jenkins initial admin password:
    * docker exec -it jenkins sh -c 'echo "Initial Admin Password:"; cat /var/jenkins_home/secrets/initialAdminPassword'
5. Configure Jenkins:
    * Login to http://localhost:8082
    * Install suggested plugins and create admin user.
6. Run pipeline:
    * In Jenkins, create a new Pipeline job
    * Point SCM to your repository and set Jenkinsfile-2 as the pipeline script.
    * Run the job. it will build, test, and push Docker images.

For the more informaction, read rest of the READMEs

# ---------------------- Legacy part ----------------------
# Snake Game

[![Build Status](https://travis-ci.org/DyegoCosta/snake-game.svg?branch=master)](https://travis-ci.org/DyegoCosta/snake-game)

Terminal-based Snake game

![scrrenshot](http://i.imgur.com/pHf4fjt.gif)

## Play

### Locally

```
$ go get github.com/DyegoCosta/snake-game
$ $GOPATH/bin/snake-game
```

### On Docker

```
$ docker run -ti dyego/snake-game
```

## Testing

```
$ cd $GOPATH/src/github.com/DyegoCosta/snake-game
$ make
```
