pipelineJob("test_pipeline") {

    description("Test Declarative Pipeline")

    //parameters {
    //    stringParam('app', 'test-service', 'application name')
    //}

    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github("ranjithruban/infra-test", 'https')
                        branch('master')
                    }
                }
            }
            scriptPath('Jenkinsfile')
        }
    }
}
