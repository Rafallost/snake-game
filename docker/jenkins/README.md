# Use below command to build Jenkins
`docker-compose up -d`

# Then you can open Jenkins in browser under http://localhost:8082
`firefox http://localhost:8082`

# To find password you can use below commands
`docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`