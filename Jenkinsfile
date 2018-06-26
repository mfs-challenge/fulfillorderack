pipeline {
            agent { label 'master' }
            stages {
                        stage ('pull code')
                        {
                                    agent { label 'master' }
                                    steps
                                                {
                                                checkout([$class: 'GitSCM',
                                                branches: [[name: "master"]], 
                                                userRemoteConfigs: [[url: "https://github.com/mfs-challenge/fulfillorderack.git", credentialsId: '3f3274fa-9202-4f37-914f-91e9ae1bee06' ]]])
                                                }
                        }
            }
}
