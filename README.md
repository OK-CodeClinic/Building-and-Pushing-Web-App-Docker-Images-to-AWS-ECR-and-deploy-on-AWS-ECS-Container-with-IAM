# How to push docker image to AWS Elastic Cointainer Registry and Deploy on Elastic Container Services.

Docker has become a widely used tool for packaging and deploying applications in containers. Amazon Web Services(AWS) provides a fully managed private Docker registry called Elatic Container Registry (ECR) that allows you to store and manage your Docker images in the cloud. Here, i will show you how i build and push Docker images to ECR and Deployed it to ECS.

## 
![dockker-archi](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/f90fe775-9745-4eb2-8b4d-a06d94a1f4ec)


### Prerequisite
- AWS Account

### AWS Services used;
- IAM User
- Elastic Cointainer Services
- Elastic Cointainer Registry
- Application Load balancer


### .
In this example i use this dockerfile https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/blob/main/Dockerfile to create a docker image


#### IAM
- Create an IAM user with adminstrative acess. 
- On thee terminal,install the AWSCLi and make configuration using the IAM user access keys

#### ECS
- Create an ECS cluster on AWS console
![Screenshot (169)](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/dd0f32ee-0366-4a88-8e84-a69995a00a80)
		

#### ECR
- Create an ECR repository
![ECR-cluster](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/ae74d7a8-cad2-4c58-adc3-70db99735fe5)



#### Build Image
Go to terminal and Build your docker image from the docker file in te directory
	```docker build -t waso:latest .```
 ![build](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/e64ab63c-5419-4396-abe2-6314fb727a26)


#### Push image to ECR
- Login to ECR
```aws ecr get-login-password --region <your_region> | docker login --username AWS --password-stdin <your_account_id>.dkr.ecr.<your_region>.amazonaws.com```

- Push image with this command
 ```docker push <your_account_id>.dkr.ecr.<your_region>.amazonaws.com/my-ecr-repo:latest```

![build-push](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/34ed3e5b-91b2-4066-b3ca-921523d34b32)


Then watch how the magic happens and image will appear on your ECR repository


- Image is now on ECR Repo with the tag latest
  ![docker-image](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/c4e55523-26a3-493c-baf8-83fb22bde4ce)




#### Create Task Definition
- Assign memory
- Addn container from the ECR image
- Port Mapping
- Create
- 
  ![container=task](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/1f773b34-1886-4381-a4ae-be026c35ebea)


#### Create Service
Do you wonder why we need to create service? Let me answer that;
- Desired State Management
- Load Balancing and High Availability
- Auto Scaling
- Service Discovery (So, it can be registered with Route 53 or AWS Map)
- Rolling Updates and Deployments
- Integration with either EC2 or AWS Fargate (your choice)
- So, let's create one

 ![service showing 2 instance](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/4561ced9-2459-4a3c-aa00-0ba8856d6986)



#### Modify Security Group to allow traffic port 80 from anywhere
### Attach Load balancer


#### Boom!
Here, check your local host with the map port for validation

![Screenshot (173)](https://github.com/OK-CodeClinic/Building-and-Pushing-Web-App-Docker-Images-to-AWS-ECR-and-deploy-on-AWS-ECS-Container-with-IAM/assets/100064229/c3a27e7f-5b62-4cd3-aa9d-0b195b915aef)


### CONCLUSION
 ECS services provide a powerful way to manage the deployment, scaling, and availability of containerized applications in AWS. They simplify the process of running and maintaining container workloads, making it easier to manage complex and highly available applications in a scalable manner.

## Author

- [Kehinde Omokungbe](https://www.github.com/OK-CodeClinic)


