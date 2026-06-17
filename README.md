                                ## Deploy your code on a Docker Container using Jenkins on AWS

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


<img width="1911" height="967" alt="Screenshot 2026-06-10 110645" src="https://github.com/user-attachments/assets/f692d1e8-d83b-46ae-a8a5-
  9124f02394b3" />


_To install the GitHub plugin lets go to our Jenkins Dashboard and click on manage Jenkins as shown:_

_Now in order to install any plugin we need to select Available Plugins, search for Github Integration, select the plugin, and finally click on `Install without restart` as shown below:_

  <img width="1918" height="461" alt="Screenshot 2026-06-10 111929" src="https://github.com/user-attachments/assets/cfd08c21-af23-4587-8294-a8835f14b841" />


## Step 3: Integrate Maven with Jenkins

* Setup Maven on Jenkins Server
* Setup Environment Variables
JAVA_HOME,M2,M2_HOME
* Install Maven Plugin
* Configure Maven and Java

_To install Maven on our Jenkins Server we will switch to the /opt directory and download the Maven package:_

<img width="1918" height="437" alt="Screenshot 2026-06-10 112645" src="https://github.com/user-attachments/assets/4b19471b-0d99-4938-98ed-c78441c234b8" />

<img width="1918" height="808" alt="Screenshot 2026-06-10 120928" src="https://github.com/user-attachments/assets/151ff6be-e0bd-4f01-a404-1ba0d052dba7" />

<img width="1918" height="807" alt="Screenshot 2026-06-10 121052" src="https://github.com/user-attachments/assets/f679b9bc-03c8-4b1e-a2af-4c643dd4bf81" />


<img width="1917" height="821" alt="Screenshot 2026-06-10 121220" src="https://github.com/user-attachments/assets/c0f6d258-d1f4-4774-8897-09c9b3f94f2d" />


<img width="1912" height="812" alt="Screenshot 2026-06-10 121421" src="https://github.com/user-attachments/assets/19edf4d8-808f-4616-bd99-f6c89a72948b" />

<img width="1916" height="817" alt="Screenshot 2026-06-10 121637" src="https://github.com/user-attachments/assets/25378816-09b1-4ae2-b98d-60a94c150421" />

<img width="1918" height="467" alt="Screenshot 2026-06-10 121724" src="https://github.com/user-attachments/assets/f2c4efe3-8931-4a61-b83d-21658e3f87bf" />

<img width="1912" height="845" alt="Screenshot 2026-06-10 122147" src="https://github.com/user-attachments/assets/6bf3eba9-00b2-47a9-9a64-9827271907ad" />

<img width="1917" height="862" alt="Screenshot 2026-06-10 124543" src="https://github.com/user-attachments/assets/af4de8d5-cc8a-4a46-aca6-a4353c8adeb9" />

<img width="1917" height="736" alt="Screenshot 2026-06-10 201836" src="https://github.com/user-attachments/assets/adb78db1-17a0-4098-b731-af012fe78709" />

<img width="1906" height="238" alt="Screenshot 2026-06-10 202109" src="https://github.com/user-attachments/assets/86f1608c-340a-42c6-b7d9-bac9f6c4a33a" />

<img width="1917" height="862" alt="Screenshot 2026-06-11 205844" src="https://github.com/user-attachments/assets/24a7d8e1-c6f5-4273-b487-40969bd11d3b" />


<img width="1912" height="786" alt="Screenshot 2026-06-11 205903" src="https://github.com/user-attachments/assets/9d5288cb-e9f1-4eca-84be-0796c80f2ccb" />


<img width="1917" height="817" alt="Screenshot 2026-06-11 211258" src="https://github.com/user-attachments/assets/9a132893-7df5-4965-9968-bb1a38a7f928" />

<img width="1902" height="742" alt="Screenshot 2026-06-11 212045" src="https://github.com/user-attachments/assets/474f7f8b-d863-411d-bb03-7d5bea22a711" />

<img width="1913" height="822" alt="Screenshot 2026-06-11 213244" src="https://github.com/user-attachments/assets/ca03f0bf-2979-496a-80ca-d8d9653bc503" />


<img width="1918" height="821" alt="Screenshot 2026-06-11 213421" src="https://github.com/user-attachments/assets/1488c897-02fc-4d2c-81c2-0536707ea306" />


<img width="1918" height="820" alt="Screenshot 2026-06-11 214455" src="https://github.com/user-attachments/assets/99c289eb-bea2-4547-8c83-ee34d887d500" />

<img width="1917" height="820" alt="Screenshot 2026-06-11 214755" src="https://github.com/user-attachments/assets/a4a0c784-4099-4f53-8f66-84ac28d8481a" />

<img width="1913" height="282" alt="Screenshot 2026-06-11 214931" src="https://github.com/user-attachments/assets/57e28387-3e9b-482b-b9ba-de97aef54d09" />

<img width="1917" height="266" alt="Screenshot 2026-06-11 215028" src="https://github.com/user-attachments/assets/b6d39f65-1d8e-4935-9e49-7a89509d4e65" />


<img width="1912" height="826" alt="Screenshot 2026-06-12 091346" src="https://github.com/user-attachments/assets/1e01ece2-2efe-4afe-bd33-0aee12767023" />

<img width="1638" height="787" alt="Screenshot 2026-06-12 103410" src="https://github.com/user-attachments/assets/757e399c-fa47-4c26-b7ba-a33465b28b54" />

<img width="1868" height="712" alt="Screenshot 2026-06-12 103648" src="https://github.com/user-attachments/assets/83cc8e97-c172-4f45-b5c5-4e8a16d46ac4" />


<img width="1902" height="842" alt="Screenshot 2026-06-12 103930" src="https://github.com/user-attachments/assets/ddb968b9-42a9-4dda-ba14-08e90b947243" />

<img width="1655" height="811" alt="Screenshot 2026-06-12 105446" src="https://github.com/user-attachments/assets/c7a9ade8-672d-4df8-9a2c-34d9b90c1c65" />

<img width="1660" height="666" alt="Screenshot 2026-06-12 111343" src="https://github.com/user-attachments/assets/3d0654e1-3737-401b-9e29-ba57a81d760d" />

<img width="1748" height="526" alt="Screenshot 2026-06-12 111351" src="https://github.com/user-attachments/assets/ad160ac2-382a-49b2-9e52-0fbc093e585e" />


<img width="1217" height="840" alt="Screenshot 2026-06-12 144511" src="https://github.com/user-attachments/assets/67fd6349-d263-49fa-a3c5-c1b94290021f" />

<img width="1913" height="850" alt="Screenshot 2026-06-16 213303" src="https://github.com/user-attachments/assets/7ce0f2ae-eeb4-4b5d-a4c2-8abe202ea4b6" />

<img width="1918" height="862" alt="Screenshot 2026-06-16 213501" src="https://github.com/user-attachments/assets/79637ac7-fe61-4259-8019-896ba36f8325" />

<img width="1900" height="876" alt="Screenshot 2026-06-16 230339" src="https://github.com/user-attachments/assets/bd7bee2b-4887-4239-8d5d-563242e1ceb0" />
