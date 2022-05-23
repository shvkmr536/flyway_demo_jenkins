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
                  sh 'docker run --rm flyway/flyway:8.5.11 version'
                }
            }
     stage('migrate') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/sql:/flyway/sql -v $WORKSPACE/conf:/flyway/conf flyway/flyway:8.5.11 -user=$DB_CREDS_USR -password=$DB_CREDS_PSW migrate'
      }
    }
    stage('validate') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/sql:/flyway/sql -v $WORKSPACE/conf:/flyway/conf flyway/flyway:8.5.11 -user=$DB_CREDS_USR -password=$DB_CREDS_PSW validate'
      }
    }
    stage('info') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/sql:/flyway/sql -v $WORKSPACE/conf:/flyway/conf flyway/flyway:8.5.11 -user=$DB_CREDS_USR -password=$DB_CREDS_PSW info'
      }
    }
}
    post {
       always {
          cleanWs()
       }
    }   
}