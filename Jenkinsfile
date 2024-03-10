pipeline {
    agent any

    environment {
        // Telegram configuration
        TOKEN = credentials('telegram_api')
        CHAT_ID = credentials('telegram_chatid')
    }

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
            timeout(time: 15, unit: "MINUTES") {
                        input message: 'Do you want to approve the deployment?', ok: 'Yes'
                    }

                    echo "Initiating deployment"
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

    post {
        success {
            script {
                sh 'curl -X POST -H "Content-Type: application/json" -d "{\"chat_id\": ${telegram_chatid}, \"text\": \"Pipeline succeeded!\", \"disable_notification\": false}" "https://api.telegram.org/bot${telegram_api}/sendMessage''
            }
        }
        failure {
            script {
                sh 'curl -X POST -H "Content-Type: application/json" -d "{\"chat_id\": ${telegram_chatid}, \"text\": \"Pipeline succeeded!\", \"disable_notification\": false}" "https://api.telegram.org/bot${telegram_api}/sendMessage''
            }
        }
    }


}
