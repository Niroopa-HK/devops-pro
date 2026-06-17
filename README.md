                                # Deploy your code on a Docker Container using Jenkins on AWS
<img width="1200" height="843" alt="cicd-pipeline-diagram-clean" src="https://github.com/user-attachments/assets/3c835414-74e0-4aa8-af12-ee61c2124151" />

In this project, I personally implemented a complete **CI/CD pipeline** to deploy a **Java Web Application** on a **Docker container running on an AWS EC2 instance** using **Jenkins automation**.

This project helped me understand real-world DevOps workflows involving build automation, containerization, and cloud deployment.

---

## 📌 Project Overview

In this project, I:

- Pulled source code from GitHub
- Built the application using Maven
- Automated the build process using Jenkins
- Created a Docker image for the application
- Deployed the container on AWS EC2 instance
- Verified the application in the browser

---

## 🛠️ Agenda / Workflow

- Setup Jenkins on AWS EC2
- Configure Maven and Git on Jenkins server
- Integrate GitHub with Jenkins
- Setup Docker on EC2 instance (Docker host)
- Integrate Docker with Jenkins
- Automate build and deployment process
- Test the deployed application

---

## ⚙️ Prerequisites

Before starting this project, I ensured I had the following:

- ☁️ AWS Account (EC2 instance setup)
- 🐙 GitHub account with source code repository
- 💻 CLI access to AWS EC2 instance
- 🐳 Basic understanding of Docker
- 🔧 Knowledge of Git, Jenkins, and Maven

Step 1: Setup Jenkins Server on AWS EC2 Instance
- Setup a Linux EC2 Instance
- Install Java
- Install Jenkins
- Start Jenkins
- Access Web UI on Port 8080

Log in to the Amazon management console, open EC2 Dashboard, click on the Launch Instance drop-down list, and click on Launch Instance as shown below:
Once the Launch an instance window opens, provide the name of your EC2 Instance:

<img width="1917" height="858" alt="Screenshot 2026-06-10 105004" src="https://github.com/user-attachments/assets/70f6aec2-a47c-4415-abc5-65b6b05b2086" />

For this demo, we will select an already existing key pair. You can create new key pair if you don’t have:
<img width="1918" height="866" alt="Screenshot 2026-06-10 105024" src="https://github.com/user-attachments/assets/626e6830-5e5b-4ccd-a086-34d10e2a86a2" />

Now under Network Settings, Choose the default VPC with Auto-assign public IP in enable mode. Create a new Security Group, provide a name for your security group, allow ssh traffic, and custom default TCP port of 8080 which is used by Jenkins.

<img width="1912" height="863" alt="Screenshot 2026-06-10 105057" src="https://github.com/user-attachments/assets/faf78b07-85d5-4146-8127-dc83fe4098c4" />


On the next screen you can see a success message after the successful creation of the EC2 instance, click on Connect to instance button:

<img width="1917" height="867" alt="Screenshot 2026-06-10 105214" src="https://github.com/user-attachments/assets/d7b41baf-3acb-41e3-a16c-4df0788b09a5" />


 let’s install java-openjdk21:
 
<img width="1917" height="866" alt="Screenshot 2026-06-10 105347" src="https://github.com/user-attachments/assets/7deb9775-01ce-4c52-ac97-bcc5be38ffc1" />


<img width="1918" height="870" alt="Screenshot 2026-06-10 105421" src="https://github.com/user-attachments/assets/f0d6a12e-e237-4cc0-9e98-23fa5c6074a0" />


### To use this repository, run the following command:

```
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
```

<img width="1918" height="872" alt="Screenshot 2026-06-10 105540" src="https://github.com/user-attachments/assets/33cb8220-3f04-4623-b858-d2347a81140d" />

_Now let’s install Jenkins with the below command as shown in the output:_

<img width="1918" height="868" alt="Screenshot 2026-06-10 105706" src="https://github.com/user-attachments/assets/12e9950a-19fe-4015-9a1c-014d42bfbd4f" />


_After successful installation Let’s enable and start Jenkins service in our EC2 Instance:_


<img width="1912" height="867" alt="Screenshot 2026-06-10 105816" src="https://github.com/user-attachments/assets/f6c7ab42-d6c1-46db-8985-20ab0a5a20fb" />

_Now let’s try to access the Jenkins server through our browser. For that take the public IP of your EC2 instance and paste it into your favorite browser and should see something like this:_


<img width="1912" height="188" alt="Screenshot 2026-06-10 110117" src="https://github.com/user-attachments/assets/a500e84b-0f5c-4e72-99fc-c58a3f1f6850" />


<img width="1915" height="971" alt="Screenshot 2026-06-10 110149" src="https://github.com/user-attachments/assets/15757f4f-aada-4cc7-8ed4-aebc0ef5651d" />


<img width="1898" height="963" alt="Screenshot 2026-06-10 110211" src="https://github.com/user-attachments/assets/e2a4b9c7-74cf-479c-8258-9d29b00ab7d0" />


<img width="1915" height="967" alt="Screenshot 2026-06-10 110232" src="https://github.com/user-attachments/assets/ba0740b6-77f1-44df-8f0f-9835720922eb" />

_Now we can create our first Admin user, provide all the required data and proceed to save and continue._

<img width="1912" height="945" alt="Screenshot 2026-06-10 110521" src="https://github.com/user-attachments/assets/928dd1e8-1435-4b34-80a7-844494c9b9c9" />

_Now we are ready to use our Jenkins Server._


## Step 2: Integrate GitHub with Jenkins

* Install Git on Jenkins Instance
* Install Github Plugin on Jenkins GUI
* Configure Git on Jenkins GUI

_Let’s first install Git on our EC2 instance with the below command:_

  <img width="1918" height="461" alt="Screenshot 2026-06-10 111929" src="https://github.com/user-attachments/assets/cfd08c21-af23-4587-8294-a8835f14b841" />

_To install the GitHub plugin lets go to our Jenkins Dashboard and click on manage Jenkins as shown:_

_Now in order to install any plugin we need to select Available Plugins, search for Github Integration, select the plugin, and finally click on `Install without restart` as shown below:_


<img width="1918" height="437" alt="Screenshot 2026-06-10 112645" src="https://github.com/user-attachments/assets/4b19471b-0d99-4938-98ed-c78441c234b8" />

## Step 3: Integrate Maven with Jenkins

* Setup Maven on Jenkins Server
* Setup Environment Variables
JAVA_HOME,M2,M2_HOME
* Install Maven Plugin
* Configure Maven and Java

_To install Maven on our Jenkins Server we will switch to the /opt directory and download the Maven package:_


<img width="1918" height="808" alt="Screenshot 2026-06-10 120928" src="https://github.com/user-attachments/assets/151ff6be-e0bd-4f01-a404-1ba0d052dba7" />


<img width="1918" height="807" alt="Screenshot 2026-06-10 121052" src="https://github.com/user-attachments/assets/f679b9bc-03c8-4b1e-a2af-4c643dd4bf81" />


<img width="1917" height="821" alt="Screenshot 2026-06-10 121220" src="https://github.com/user-attachments/assets/c0f6d258-d1f4-4774-8897-09c9b3f94f2d" />


<img width="1912" height="812" alt="Screenshot 2026-06-10 121421" src="https://github.com/user-attachments/assets/19edf4d8-808f-4616-bd99-f6c89a72948b" />


<img width="1916" height="817" alt="Screenshot 2026-06-10 121637" src="https://github.com/user-attachments/assets/25378816-09b1-4ae2-b98d-60a94c150421" />


<img width="1918" height="467" alt="Screenshot 2026-06-10 121724" src="https://github.com/user-attachments/assets/f2c4efe3-8931-4a61-b83d-21658e3f87bf" />

_Now we need to update the paths where Java and Maven have been installed in the Jenkins UI. We will first install the Maven Integration Plugin as shown below:_

<img width="1912" height="845" alt="Screenshot 2026-06-10 122147" src="https://github.com/user-attachments/assets/6bf3eba9-00b2-47a9-9a64-9827271907ad" />

## Step 4: Setup a Docker Host

* Setup a Linux EC2 Instance
* Install Docker
* Start Docker Services
* Run Basic Docker Commands

_Let's first launch an EC2 Instance. We will skip the steps here as we have already shown earlier how to create an EC2 Instance._

_Below is the screenshot of our newly created EC2 Instance on which we will install Docker:_

<img width="1917" height="862" alt="Screenshot 2026-06-10 124543" src="https://github.com/user-attachments/assets/af4de8d5-cc8a-4a46-aca6-a4353c8adeb9" />

<img width="1917" height="736" alt="Screenshot 2026-06-10 201836" src="https://github.com/user-attachments/assets/adb78db1-17a0-4098-b731-af012fe78709" />

<img width="1906" height="238" alt="Screenshot 2026-06-10 202109" src="https://github.com/user-attachments/assets/86f1608c-340a-42c6-b7d9-bac9f6c4a33a" />

### Create Tomcat Docker Container:

_We will first pull the official Tomcat docker image from the Docker Hub and then run the container out of the same image._

Let’s now create a Container from the same Image with the command:

```
docker run -d --name tomcat-container -p 8081:8080 tomcat
```

<img width="1917" height="817" alt="Screenshot 2026-06-11 211258" src="https://github.com/user-attachments/assets/8068957f-05dc-41e3-a743-44421efb2391" />


_The above command runs a docker container in detached mode with the name tomcat-container and we are exposing port 8081 of our host machine with port 8080 of our container and it's using the latest image of tomcat._

Let's verify the running container on our EC2 machine:

Now let’s take the public IP of our Docker-host EC2 machine and with port 8081 access it from our browser:

<img width="1906" height="968" alt="Screenshot 2026-06-17 215426" src="https://github.com/user-attachments/assets/7d66459e-233d-4160-9ed1-edae7b61ed93" />


**Create a Customized Dockerfile for Tomcat:**

_To create the Dockerfile we will use the official Image of Tomcat and with it will mention the step to copy the contents from the directory /webapps.dist to /webapps:_

```
FROM  tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
```
<img width="1918" height="820" alt="Screenshot 2026-06-11 214455" src="https://github.com/user-attachments/assets/5ac047c1-5a6c-4593-9497-3bd68a26856d" />



### Step 5: Integrate Docker with Jenkins


* Create a dockeradmin user
* Install the “Publish Over SSH” plugin
* Add Dockerhost to Jenkins “configure systems”

_Let's first create a dockeradmin user and create a password for it as well._

<img width="1902" height="842" alt="Screenshot 2026-06-12 103930" src="https://github.com/user-attachments/assets/5acf86d2-4246-4bf1-b056-50c17804144f" />

<img width="1660" height="666" alt="Screenshot 2026-06-12 111343" src="https://github.com/user-attachments/assets/0bc94978-86ff-4061-aafc-ce9da1c4aee3" />

<img width="1748" height="526" alt="Screenshot 2026-06-12 111351" src="https://github.com/user-attachments/assets/1902e7df-e28b-4c62-8af3-09670f87eb91" />

<img width="1217" height="840" alt="Screenshot 2026-06-12 144511" src="https://github.com/user-attachments/assets/042b8b5b-1aae-4b29-b10b-4512b4d86b7f" />


## Step 6: Update Dockerfile to copy Artifacts to launch New Container

_In this step, we will create a Dockerfile to include the webapp.war file to launch a new container using our Java web Application. For that, we need to copy our artifacts to the location where we have our Dockerfile._

We will create a separate directory named docker under the root user of our dockerhost inside /opt.

If the build is successful we can see the webapp.war file in the /opt/docker directory of our dockerhost:

_Let’s now build a new image using this updated Dockerfile with the command:_

```
docker build -t tomcat:v1 .
```

<img width="1918" height="862" alt="Screenshot 2026-06-16 213501" src="https://github.com/user-attachments/assets/f6426e59-59dd-4a3f-86df-448bf15b4d35" />


**Output:**
Now let’s access this application from our browser using URL http://[ip address]:8086/webapp/

<img width="1900" height="876" alt="Screenshot 2026-06-16 230339" src="https://github.com/user-attachments/assets/0e8396ef-155f-46b1-8815-1c76add452d2" />


# Hit the Star! ⭐
***If you are planning to use this repo for learning, please hit the star. Thanks!***

#### Author by [Niroopa HK](https://github.com/Niroopa-HK) 
