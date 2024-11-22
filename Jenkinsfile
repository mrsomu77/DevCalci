pipeline {
    agent any  // This will use any available agent, Windows preferred if set up in the environment

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning the repository using git...'
                // Use the git step to clone the repository
                git url: 'https://github.com/mrsomu77/DevCalci.git'
            }
        }

        stage('Build WAR') {
            steps {
                echo 'Building the WAR file...'
                // Use Windows batch commands to create the WAR file
                bat script: '''
                    echo Cleaning up target directory
                    rmdir /s /q target
                    mkdir target
                    echo Creating WAR file
                    jar -cvf target/quizApp.war *
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the WAR file to Tomcat...'
                script {
                    deploy adapters: [
                        tomcat9(
                            credentialsId: '4df8a575-2b0b-4d52-bafb-dccdc77831e4', 
                            path: '', 
                            url: 'http://localhost:8090/'
                        )
                    ], contextPath: '', war: 'target/quizApp.war'
                }
            }
        }
    }
}
