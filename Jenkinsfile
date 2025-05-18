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
                    echo "=== BUILD START ===" > output/build_log.log
                    make build >> output/build_log.log 2>&1
                    echo "=== BUILD END ===" >> output/build_log.log
                    cat output/build_log.log || true
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    echo "=== TEST START ===" > output/test_log.log
                    make test >> output/test_log.log 2>&1
                    echo "=== TEST END ===" >> output/test_log.log
                    ls -lh output/
                    
                    cat output/test_log.log || true
                '''
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
