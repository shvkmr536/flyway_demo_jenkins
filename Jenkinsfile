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
     stage('Local DB: migrate') {
      steps {
        script {
          sh 'sudo flyway --version'
          sh 'sudo flyway -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" info'
          sh 'sudo flyway -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" migrate'
      }
    }
  }
}  
post {
    always {
      cleanWs()
    }
  }   
}