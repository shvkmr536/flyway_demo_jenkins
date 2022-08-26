pipeline {
    agent any
     environment {
     DB_CREDS = credentials('db_cred_local')
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
          //sh 'sudo flyway --version'
          //sh 'mv ./sql/dev/R__DATA_PURGING.sql ./sql/dev/R__DATA_PURGING_date +%F_%H-%M-%S.sql '
          sh 'ls -lrt'
          sh 'sudo flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" baseline'
          sh 'sudo flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" migrate'
          sh 'sudo flyway -locations=filesystem:./sql/dev -configFiles=./conf/env_dev.conf -user=sonaruser -password="${DB_CREDS_PSW}" info'
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
          sh 'mv ./sql/sit/R__DATA_PURGING.sql ./sql/sit/R__Purging_$(date +%F_%H-%M-%S).sql'
          sh 'ls -lrt ./sql/sit'
          sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=edu -password="${DB_CREDS_SIT_PSW}" repair'
          sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=edu -password="${DB_CREDS_SIT_PSW}" baseline'
          sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=edu -password="${DB_CREDS_SIT_PSW}" migrate'
          sh 'sudo flyway -locations=filesystem:./sql/sit -configFiles=./conf/env_sit.conf -user=edu -password="${DB_CREDS_SIT_PSW}" info'
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