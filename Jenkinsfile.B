pipeline {
    agent any

    environment {
        IMAGE_NAME = 'rafal206/snake-game'
        IMAGE_TAG = 'v1.0.0'
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'master', url: 'https://github.com/Rafallost/snake-game.git'
            }
        }

        stage('Build container') {
            steps {
                sh 'docker build -t snake-build -f Dockerfile.build .'
                sh 'docker logs $(docker create snake-build) > build_logs.log || true'
                sh 'docker cp $(docker create snake-build):/app/build.log ./build.log'
                archiveArtifacts artifacts: 'build.log', fingerprint: true
            }
        }

        stage('Test container') {
            steps {
                sh 'docker build -t snake-test -f Dockerfile.test .'
                sh 'docker run --rm snake-test > test_logs.log || true'
                archiveArtifacts artifacts: 'test_logs.log'
            }
        }

        stage('Build deploy image') {
            steps {
                sh 'docker build -t snake-deploy -f Dockerfile.deploy .'
                sh 'docker tag snake-deploy ${IMAGE_NAME}:${IMAGE_TAG}'
            }
        }

        stage('Smoke test') {
            steps {
                sh 'docker run --rm ${IMAGE_NAME}:${IMAGE_TAG} > smoke_test.log || true'
                archiveArtifacts artifacts: 'smoke_test.log'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push ${IMAGE_NAME}:${IMAGE_TAG}'
                }
            }
        }
    }
}
