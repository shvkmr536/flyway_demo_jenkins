pipeline {
    agent any
     environment {
     DB_CREDS = credentials('db_cred_local')
  }
    options {
    	buildDiscarder(logRotator(numToKeepStr:'2'))
    	timestamps()
    	timeout(time: 30, unit: 'MINUTES')
    }
    stages {
      stage('Verify Version') {
          steps {
            script {
              sh 'id'
              sh 'sudo flyway --version'
          }
        }
      }
     stage('migrate') {
      steps {
        script {
        sh "sudo flyway -user=sonaruser -password=sonar info"
      }
    }
  }
	  /*stage('Verify Version') {
              steps {
                  sh 'docker run --rm flyway/flyway:8.5.11 version'
                }
            }
     stage('migrate') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/sql:/flyway/sql -v $WORKSPACE/conf:/flyway/conf flyway/flyway:8.5.11 -user=sonaruser -password=sonar migrate'
      }
    }
    stage('validate') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/sql:/flyway/sql -v $WORKSPACE/conf:/flyway/conf flyway/flyway:8.5.11 -user=sonaruser -password=sonar validate'
      }
    }
    stage('info') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/sql:/flyway/sql -v $WORKSPACE/conf:/flyway/conf flyway/flyway:8.5.11 -user=sonaruser -password=sonar info'
      }
    }*/
}
post {
    always {
      cleanWs()
    }
  }   
}