# Project Definition

This project uses Jenkins and Terraform to provision a target webserver according to given requirements.

- Use terraform to deploy a static content page
- Serve the request via Application Load Balancers
- Create a Jenkins pipeline to deploy it
- Tech stack to be used : GitHub/Jenkins/Terraform 
- Use AWS as preferred cloud provider
### Assumptions
- s3 bucket and DynamoDB table for setting up Terraform backend are manually created
- IAM role `tech_test_role` created and assigned to the Jenkins Server is in place
- Initial setup of Jenkins plugins and Job carried out manually on GUI

# Solution
## Steps to clone repo and run playbook

### Clone repo

Run the following commands to clone the repo and to change into the working directory respectively:

1. git clone https://github.com/iykmode/cicd_terraform.git
2. cd cicd_terraform

### Requirements

The static webpage should be accessible via the Application Load Balancers's DNS endpint.

### Steps to run playbook

cd into the base_infra directory to provision the base infrastruction and the Jenkins server, and to install Git and Terraform on the Jenkins server. 
1. `cd base-infa`
2. `terraform init`
3. `terraform plan`
4. `terraform apply`

Once the base infrastructure and the Jenkins Server has been provisioned, proceed to complete the installation of Jenkins on the GUI:
- install git, pipeline and terraform plugins
- create your first terraform pipeline job
- Note that this project is parameterized using a `choice parameter`
- Poll SCM is used as the build trigger; it polls every 5 mins

Then update your repo and see Jenkins and Terraform in action.

### URL to Access Static Webpage via the Application LB's DNS Name

Please not that the URL below is for this deployment:
http://jenkins-lb-352486350.eu-west-1.elb.amazonaws.com/
