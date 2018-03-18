pipelineJob("test_pipeline_infra") {

    description("Test Pipeline infra")

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
