FROM ubuntu:24.04

ARG ANSIBLE_VERSION=2.17.2
ARG DEBIAN_FRONTEND=noninteractive

ENV pip_packages "ansible"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       build-essential \
       locales \
       gcc \
       libffi-dev \
       libssl-dev \
       libyaml-dev \
       wget \
       sshpass \
       git \
       nano \
       python3-jmespath \
       python3-requests \
       python3-dev \
       python3-setuptools \
       python3-pip \
       python3-yaml \
       software-properties-common \
       rsyslog systemd systemd-cron sudo iproute2 \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf

RUN locale-gen en_US.UTF-8
RUN sudo rm -rf /usr/lib/python3.12/EXTERNALLY-MANAGED

RUN pip3 install ansible-core==$ANSIBLE_VERSION

# Remove unnecessary getty and udev targets that result in high CPU usage when using multiple containers with Molecule (https://github.com/ansible/molecule/issues/1104)
RUN rm -f /lib/systemd/system/systemd*udev* \
  && rm -f /lib/systemd/system/getty.target