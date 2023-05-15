# Ansible

Docker image with [ansible-core](https://docs.ansible.com/ansible-core/devel/index.html) installed. It can be used as base image for containers providing Ansible automations.

Docker Image: [ghcr.io/eclipse-slm/ansible](https://github.com/eclipse-slm/ansible/pkgs/container/ansible)

An example can be found in the `example` directory:

```
docker build -t ansible-example .
docker run ansible-example
```
