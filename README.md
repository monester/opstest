# Description

It is example application intended to be run on AWS infrastructure. Ansible playbook is included to deploy application in AWS using CloudFormation. Playbook will create CodePipeline with github integration for repo https://github.com/monester/opstest. Application will be deployed on every commit to the repo.

# Installation manual

How to install service application in AWS across 3 AZ and setup autodeployment on every commit to repo.

It is done by AutoScaleGroup, CodeDeploy, CodePipeline and CodeBuild.

## GitHub token

Navigate on https://github.com

`Your profile -> Settings -> Developer settings -> Personal access tokens`

Generate new token with 'repo:status' and 'public_repo' scope.

## AWS configuration

To use playbook AWS client should be configured by running `aws configure`.

## Deploy CodePipeline

To deploy application simply run

```
pip install -r requirements.txt
GITHUB_TOKEN=TOKEN ansible-playbook playbook.yaml
```

or if you have tox installed

```
GITHUB_TOKEN=TOKEN tox
```

Playbook will create CodePipeline stack and then CodePipeline will install application in AWS EC2 in eu-west-1 region in 3 Availability Zones.

URL of applications can be found in CloudFormation output or in EC2-ELB.

# Todo

- increase security for Role 'CodePipelineCloudFormationRole' in InfrastructureDeploy step
- increase security for Instances in LauchConfiguration
- check CodeStar as UI for CodePipeline
