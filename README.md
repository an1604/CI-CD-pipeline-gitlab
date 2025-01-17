# DevSecOps CI/CD Pipeline with GitLab

## Project Overview

This project focuses on building a **DevSecOps pipeline** using GitLab, incorporating various security tools and methodologies to ensure comprehensive application security. The pipeline is designed to integrate **OWASP WebGoat** as the target application and leverage **OWASP DefectDojo** for vulnerability management and reporting.

## Pipeline Features

The pipeline includes the following security elements:

1. **Secret Detection**  
   Detects hardcoded secrets, such as API keys, passwords, or sensitive information, within the codebase.

2. **Software Composition Analysis (SCA)**  
   Identifies vulnerabilities in open-source dependencies by analyzing the software’s third-party components.

3. **Static Application Security Testing (SAST)**  
   Performs static analysis to identify vulnerabilities in the source code, such as SQL injection or XSS.

4. **Infrastructure as Code (IaC) Scanning**  
   Analyzes IaC files (e.g., Terraform, CloudFormation) to detect configuration issues and security misconfigurations.

5. **Container Scanning**  
   Scans Docker images for known vulnerabilities in the operating system and application libraries.

6. **Dynamic Application Security Testing (DAST)**  
   Uses OWASP ZAP to simulate real-world attacks and identify vulnerabilities in a running application.
