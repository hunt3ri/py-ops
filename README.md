# py-ops
A docker container running the latest version of Python and a set of useful DevOps tools, namely:

* Terraform
* Packer
* Ansible
* AWSCLI

## Build 
To build

```commandline
docker build -t hunteri/py-ops:latest .
docker tag imageID hunteri/py-ops:0.1
docker push hunteri/py-ops:latest
```

## Running
```commandline
docker run -dit hunteri/py-ops:latest bash
docker attach <CONTAINER_NAME>
```
