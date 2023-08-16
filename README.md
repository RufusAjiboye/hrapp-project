
# Techbleat DevOps Training Project 2!

The project is aimed at utilizing a number of tooling and technologies you have picked up over the classes. 

## Project Description
======================

The project is an HR application implemented in Flask (Python). 


AWS Services
============
RDS/ Postgres Database
Load balancer(s)
Route 53
TLS Certificate
SES ( potentially)
CloudWatch
EC2



# Objectives
===========

Help build and deploy a HR Management Portal into an Organisation Infrastructure

1.  We need to build the hardware infrastructure to host the application
2.  We need a CICD to manage infrastructure and application build
3.  Need to build resilence into the system
4.  Add Monitoring
5.  Make it easy to use


## Approach
======================

1. Watch the  2 videos that describe in details what is to be done and how
2. Find a group/supportign team ( reach out to the tutor if need be)
3. Try the project manually first, to get a hand of the components and services required
   

## Biilding and Using App
======================

1. git clone xxxxxxx
2. cd xxxx
3. docker build -t hrapp.v1  .
4. docker run docker run -p 80:5000 -e POSTGRES_HOST=project.xxxxxxxxx.amazonaws.com -e POSTGRES_USER=project -e POSTGRES_DATABASE_NAME=postgres -e POSTGRES_PASSWORD=xxxxxxxx -e TO_ADDRESS=xxxxxxx@yahoo.com -e SOURCE_ADDRESS=xxxxxx@gmail.com  -e AWS_REGION_NAME=eu-west-1 \
-e AWS_ACCESS_NAME=AKxxxxxxxxxxxxx \
-e AWS_KEY_NAME=xxxx/xxxx/xxx+qlHbY7g


## Architecture
============== 
1. high availability system
2. Fault Tolerant system


## Environment Setup
====================
1. Two or more instances of the application
2. CICD Pipeline to managment the Environment
3. Monitoring and Alerting  (Prometheus /Grafana)


## Possible tools/utilities to leverage   
==================================================
1. Terraform
2. Jenkins
3. Ansible
4. Docker 
5. Prometheus
6. Grafana


## Support Materials 
======================