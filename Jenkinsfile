pipeline {
    agent any
     environment {
     DB_CREDS = credentials('db_cred')
  }
    options {
    	buildDiscarder(logRotator(numToKeepStr:'2'))
    	timestamps()
    	timeout(time: 30, unit: 'MINUTES')
    }
    stages {
	  stage('Verify Version') {
              steps {
                  sh 'docker run --rm flyway/flyway:8.5.11 version'
                }
            }
        }
    post {
       always {
          cleanWs()
       }
    }   
}