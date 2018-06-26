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
                        stage ('build')
                        {
                                    agent { label 'master' }
                                    steps
                                    {
                                            echo 'Building Docker Image'
                                            dockerfile 
                                            {
                                                        dir '.'
                                                        label 'fulfillorderack:${BUILD_NUMBER}"'
                                            }
                                             script{
                                                def customImage = docker.build("fulfillorderack:${BUILD_NUMBER}")
                                                sh 'docker build . --tag fulfillorderack:${BUILD_NUMBER}'
                                            }
                                    }
                        }
            }
}
