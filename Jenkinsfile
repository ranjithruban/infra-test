pipeline {

    agent {
        node {
            label "lappy"
        }
    }

    // Pipeline global options
    options {
        timestamps()
        ansiColor('xterm')
        timeout(time: 60, unit: 'MINUTES')
    }

    stages {
        stage('Get git commit') {
            steps {
        script {
            env['GIT_COMMIT'] = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
            env ['SHORT_COMMIT'] = GIT_COMMIT.take(7)
        }
           }
        }
//        stage('Add m2 folder to slave') {
//           steps {
//                sh("deploy/m2.sh")
//            }
//        }
        stage("Build and deploy") {
            steps {
                sh("deploy/deploy.sh")
            }
        }
    }

    post {
        failure {
            emailext (
                subject: "FAILURE: ${currentBuild.fullDisplayName}",
                body: """FAILED: Job ${env.JOB_NAME} [${env.BUILD_NUMBER}]':
Check console output at ${env.BUILD_URL}console""",
                to: 'ranjithruban@gmail.com'
            )
        }
    }
}
