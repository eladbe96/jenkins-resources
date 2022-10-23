crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
# curl -u "jenkins:1234" -H "$crumb" -X POST http://jenkins.local:8080/job/ENV/build?delay=0sec
curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.local:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-mysql-backup

WHAT DID WORK FOR ME:

########Getting the Crumb########
curl -v -X GET http://<jenkins-URL>:8080/crumbIssuer/api/json --user <user>:<pass>

########Running the job########
curl -X POST http://<jenkins-URL>:8080/job/ENV/build --user <user>:<pass> -H 'Jenkins-Crumb:crumb'
