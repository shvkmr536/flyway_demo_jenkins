pipeline {
    agent any
     environment {
     DB_CREDS_DEV = credentials('db_cred_local')
     DB_CREDS_SIT = credentials('db_cred')
  }
    options {
    	buildDiscarder(logRotator(numToKeepStr:'2'))
    	timestamps()
    	timeout(time: 30, unit: 'MINUTES')
    }
    parameters {
        booleanParam(name: 'DEV', defaultValue: true,description: 'Deploying for DEV?');
        booleanParam(name: 'SIT', defaultValue: true,description: 'Deploying for SIT?');
	}
    stages {
     stage('Local DB: migrate') {
      when {
      	expression { return params.DEV;	}
       	}
      steps {
        script {
          sh 'sudo flyway --version'
          sh 'ls -lrt'
          sh 'sudo flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_DEV_PSW}" repair'
          sh 'sudo flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_DEV_PSW}" baseline'
          sh 'sudo flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_DEV_PSW}" migrate'
          //sh 'sudo flyway -placeholders.environment=dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_DEV_PSW}" migrate'
          sh 'sudo flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_DEV_PSW}" info'
      }
    }
  }
  stage('SIT DB: migrate') {
      when {
      	expression { return params.SIT;	}
       	}
      steps {
        script {
          sh 'sudo flyway --version'
          sh 'ls -lrt'
          //sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=sonaruser -password="${DB_CREDS_SIT_PSW}" repair'
          sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=sonaruser -password="${DB_CREDS_SIT_PSW}" baseline'
          sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=sonaruser -password="${DB_CREDS_SIT_PSW}" migrate'
          //sh 'sudo flyway -placeholders.environment=dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_SIT_PSW}" migrate'
          sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=sonaruser -password="${DB_CREDS_SIT_PSW}" info'
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