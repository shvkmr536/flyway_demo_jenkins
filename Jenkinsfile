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
          sh 'flyway --version'
          sh 'flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" repair'
          sh 'flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" baseline'
          sh 'flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" migrate'
          //sh 'sudo flyway -placeholders.environment=dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" migrate'
          sh 'flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" info'
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