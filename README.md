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







