# Create docker container with Terraform installed, and suite of tools to ease working with AWS
FROM python:3.10-bullseye

ENV TERRAFORM_VERSION 1.0.10
ENV TERRAFORM_URL https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ENV PACKER_VERSION 1.7.8
ENV PACKER_URL https://releases.hashicorp.com/packer/$PACKER_VERSION/packer_${PACKER_VERSION}_linux_amd64.zip

ENV AWSCLI_URL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

RUN apt-get update && apt-get install -y \
    dos2unix \
    figlet \
    vim

# Install Python Tools
RUN python -m pip install --upgrade pip
RUN pip install ansible

# Install AWSCLI
RUN curl -o /opt/awscliv2.zip $AWSCLI_URL && \
    unzip /opt/awscliv2.zip && \
    ./aws/install && \
    rm /opt/awscliv2.zip && \
    rm -Rf /opt/aws

# Install Terraform
RUN curl -o /tmp/terraform.zip $TERRAFORM_URL && \
    unzip /tmp/terraform.zip -d /usr/local/bin/

# Install Packer
RUN curl -o /tmp/packer.zip $PACKER_URL && \
    unzip /tmp/packer.zip -d /usr/local/bin/
