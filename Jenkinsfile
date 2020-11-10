env.DOCKER_REGISTRY = 'rizaleko'
env.DOCKER_IMAGE_NAME = 'wordpress'
pipeline {
    agent any
    stages {
        //stage('build') {
           // steps {
                //sh('sed -i "s/tag/$BUILD_NUMBER/g" index.html')
                //}
            //}
        stage('docker build') {
            steps {
                sh "docker build --build-arg APP_NAME=$DOCKER_IMAGE_NAME -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER ."
                }
           }
        stage('Docker push') {
            steps {                
                sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER"
                }
           }
        stage('tagging') {
            steps {
                sh('sed -i "s/tag/$BUILD_NUMBER/g" deployment-wp.yml')
                }
           }
        stage('locate namespace') {
            steps {
                sh('sed -i "s/default/production/g" deployment-wp.yml')
                }
           }
        stage('add domain') {
            steps {
                sh('sed -i "s/blog.ridjal.com/blog.ridjal.com/g" deployment-wp.yml')
                }
           }
        stage('deploy') {
            steps {
                sh('kubectl apply -f deployment-wp.yml')
                }
           }
        stage('remove image docker') {
            steps {
                sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER"
                }
           }
         stage('show ingress') {
            steps {
                sh('kubectl get ingress')
                }
           }        
      }
}
