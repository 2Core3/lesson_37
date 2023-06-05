pipeline {
    agent {
    label 'vagrant18'
    }
    parameters {
        string(name: 'SCRIPT_NAME', defaultValue: 'start1.sh', description: 'Имя запущенного скрпита')
    }

    stages {
        stage('Test syntax') {
            steps {
                sh "bash test.sh ${params.SCRIPT_NAME}"
            }
        }

        stage('Test output') {
            steps {
                sh "bash test.sh ${params.SCRIPT_NAME} output"
            }
        }

        stage('Build') {
            steps {
                sh "tar -cvf start-${env.BUILD_NUMBER}.tar.gz ${params.SCRIPT_NAME}"
                archiveArtifacts artifacts: "start-${env.BUILD_NUMBER}.tar.gz"
            }
        }

        stage('Delivery') {
            steps {
                sshagent(['vagrant18-22']) {
                    sh "scp -P 22 start-${env.BUILD_NUMBER}.tar.gz vagrant@192.168.56.3:/home/vagrant/37_lesson/"
                }
            }
        }
    }

    post {
        always {
            sh 'rm -f start*.tar.gz'
            cleanWs()
        }
    }
}

