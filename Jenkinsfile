pipeline {
    agent any

    stages {
        stage('Checkout código desde GitHub') {
            steps {
                script {
                    // Clonar el repositorio desde GitHub
                    checkout scm
                }
            }
        }

        stage('Instalar Node.js y npm') {
            steps {
                script {
                    // Instalar Node.js y npm
                   //sh 'sudo apt update'
                   /// sh 'sudo apt install -y nodejs'
                   // sh 'sudo apt install -y npm'
                }
            }
        }

        stage('Instalar Dependencias') {
            steps {
                script {
                    // Navegar al directorio del proyecto y ejecutar npm install
                    dir('/ruta/al/proyecto') {
                        sh 'npm install'
                    }
                }
            }
        }

        stage('Iniciar Aplicación') {
            steps {
                script {
                    // Navegar al directorio del proyecto y ejecutar node app.js
                    dir('/ruta/al/proyecto') {
                        sh 'node app.js &'
                    }
                }
            }
        }
    }

    post {
        always {
            // Puedes agregar pasos adicionales o notificaciones aquí
        }
    }
}


    
}

