# Description

It is example application intended to be run on AWS infrastructure. Ansible playbook is included to deploy application in AWS using CloudFormation. Playbook will create 2 stacks:

- TestApp
- TestAppPipeline

First stack is application itself and second one is CodeDeploy setup to deploy code from github. This README includes steps how to setup application update on every commit in GitHub. (There is no ansible modules to setup github integration using playbook).

Application itself has only 1 handler - /hello which returns AZ name where instance is located.

# Installation manual

Short manual how to install service in AWS across 3 AZ and setup autodeployment on every commit to repo.

It is done by AutoScaleGroup, CodeDeploy and github integration.

## Application in AWS

To use playbook AWS client should be configured by running `aws configure`.

```
ansible-playbook playbook.yaml
```

Playbook will install application in AWS EC2 in eu-west-1 region in 3 Availability Zones and create CodeDeploy configuration for manual run.

Save AWS credentials you get from playbook to setup github integration and deploy code on every commit.

## GitHub Trigger

### Add  AWS CodeDeploy integration on GitHub with following parameters

```
Application name: TestApp
Deployment group: Development
Aws access key: (Access key from playbook)
Aws region: eu-west-1
Aws secret access key: (Secret key from playbook)
GitHub token:
GitHub api url:
```

### Create GitHub access token

Open Your profile -> Settings -> Developer settings -> Personal access tokens

Generate new token with  repo deployment scope

### Add  GitHub Auto-Deployment integration on GitHub with following parameters

```
GitHub token: (your new github access token)
Environments: Development
```
