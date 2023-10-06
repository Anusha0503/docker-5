node {
          stage ('checkout'){
           git branch: 'master', credentialsId: 'gitcredentials', url: 'https://github.com/Anusha0503/docker-5.git'
 
         }
   stage ('build'){ 
        withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
        sh 'mvn clean package'
                  }
              }
    stage ('docker build image'){
      sh " docker build -t docker-3:v1 ."
    }
    stage (' docker image push to ECR'){
      sh " aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 045193383710.dkr.ecr.us-east-1.amazonaws.com "
      sh " docker tag docker-3:v1 045193383710.dkr.ecr.us-east-1.amazonaws.com/docker-5:v1"
      sh " docker push 045193383710.dkr.ecr.us-east-1.amazonaws.com/docker-5:v1"        
    }
    stage (' deploy to EKS'){
    withKubeConfig(caCertificate: '', clusterName: 'new-eks-cluster', contextName: '', credentialsId: 'EKS-kube-config', namespace: '', restrictKubeConfigAccess: false, serverUrl: 'https://5A9D5DB5734E7751B34DDDB3A2B098DC.gr7.us-east-1.eks.amazonaws.com') {
    sh " aws eks --region us-east-1 update-kubeconfig --name new-eks-cluster"
}
}
    }
          
