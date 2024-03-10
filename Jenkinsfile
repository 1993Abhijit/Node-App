pipeline {
    agent any

    tools{
        nodejs 'nodejs-21.4.0'
    }
    

    stages {
        stage('Checkout código desde GitHub') {
            steps {
                script {
                    // Clonar el repositorio desde GitHub
                    checkout scm
                }
            }
        }

        stage('Instalar Dependencias') {
            steps {
                script {
                    // Navegar al directorio del proyecto y ejecutar npm install
                    sh 'npm version'
                    sh 'npm install'
                }
            }
        }

         stage('Approval') {
        steps {
            script {
                  def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'admin', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                  sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
            }
        }
    }

        stage('Iniciar Aplicación') {
            steps {
                script {
                    // Navegar al directorio del proyecto y ejecutar node app.js
                    sh 'NODE_DEBUG=* node app.js'
                }
            }
        }
    }
}
