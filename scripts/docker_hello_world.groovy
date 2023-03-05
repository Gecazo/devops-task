node {
  stage('Pull and Run Docker Image') {
    // Pull Docker image
    docker.image('hello-world').pull()
    // Run Docker image
    docker.image('hello-world').run()
  }
  stage('Deploy Docker Image') {
    // Deploy Docker image
    docker.image('my-docker-image').run('-p 8080:80')
  }
}
