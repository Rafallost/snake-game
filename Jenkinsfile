pipeline {
    agent {
        docker {
            image 'golang:alpine'
            args '-u root:root'
        }
    }
    environment {
        OUTPUT_DIR = "output"
    }
    stages {
        stage('Prepare') {
            steps {
                sh '''
                    apk update && apk add --no-cache git make
                    mkdir -p ${OUTPUT_DIR}
                '''
            }
        }
        stage('Checkout Code') {
            steps {
                // UWAGA: tutaj JENKINS automatycznie pobierze repo, NIE wklejamy git clone tutaj
                echo "Code checked out from GitHub by Jenkins SCM config."
            }
        }
        stage('Build') {
            steps {
                sh '''
                    make > ${OUTPUT_DIR}/build_log.txt 2>&1
                    go build -o snake
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    make test > ${OUTPUT_DIR}/test_log.txt 2>&1 || true
                '''
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: "${OUTPUT_DIR}/*.txt", fingerprint: true
        }
    }
}
