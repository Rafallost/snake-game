pipeline {
    agent {
        docker {
            image 'golang:alpine'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Start Trigger') {
            steps {
                echo "Rozpoczęcie pipeline – Build #${env.BUILD_NUMBER}"
            }
        }

        stage('Prepare Env') {
            steps {
                sh '''
                    apk add --no-cache git make
                    mkdir -p output
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                    mkdir -p output
                    make build > output/build_log.txt 2>&1
                '''
            }
        }

        stage('Test') {
            steps {
                sh 'make test > output/test_log.txt 2>&1'
            }
        }

        stage('Save Logs') {
            steps {
                archiveArtifacts artifacts: 'output/*.log', fingerprint: true
            }
        }
    }

    post {
        always {
            echo "Build zakończony – logi dostępne jako artefakt"
        }
    }
}
