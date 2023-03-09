#!/bin/bash
yum -y update
sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install -y amazon-efs-utils
sudo mkdir /home/ec2-user/.gitbucket

cd /home/ec2-user
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz
sudo mkdir /opt/tomcat
sudo tar -xzvf apache-tomcat-9.0.68.tar.gz -C /opt/tomcat --strip-components=1
chmod 775 /opt/tomcat/webapps
echo "gitbucket.home=/home/ec2-user/.gitbucket" >> /opt/tomcat/conf/catalina.properties
cd /opt/tomcat/webapps
wget https://github.com/gitbucket/gitbucket/releases/download/4.38.2/gitbucket.war

sudo chown -R ec2-user:ec2-user /opt/tomcat/

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${efs_ip}:/ /home/ec2-user/.gitbucket

sudo chown -R ec2-user:ec2-user /home/ec2-user/.gitbucket

cat <<EOF > /home/ec2-user/.gitbucket/database.conf
db {
  url = "jdbc:mysql://${db_url}/${db_name}?useUnicode=true&characterEncoding=utf8"
  user = "${db_user}"
  password = "${db_passwd}"
}
EOF

/opt/tomcat/bin/startup.sh
sudo chown -R ec2-user:ec2-user /home/ec2-user/.gitbucket