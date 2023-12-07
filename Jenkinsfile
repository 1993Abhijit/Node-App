pipeline {
    agent any
    
    stages {
        stage('Instalar Node.js y npm') {
            steps {
                script {
                    // Instalar Node.js y npm
                    sh 'sudo apt update && sudo apt install -y nodejs npm'
                }
            }
        }

        stage('Instalar Dependencias') {
            steps {
                script {
                    // Instalar las dependencias del proyecto
                    sh 'npm install'
                }
            }
        }

        stage('Iniciar la Aplicación') {
            steps {
                script {
                    // Iniciar la aplicación Node.js
                    sh 'node app.js &'
                }
            }
        }

        // Puedes agregar más etapas según sea necesario, como pruebas, construcción de artefactos, etc.

        stage('Despliegue') {
            steps {
                script {
                    // Agrega aquí los comandos de despliegue si es necesario
                    // Pueden incluir la transferencia de archivos, reinicio de servicios, etc.
                }
            }
        }
    }

    
}

