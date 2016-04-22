#!/bin/sh

tower-cli project create --name Demos --organization "Default" --scm-type git --scm-url https://github.com/phips/ansible-demos --scm-update-on-launch 0
tower-cli credential create --user admin --name vagrant-ssh --kind ssh --username vagrant --ssh-key-data=keys/vagrant_dsa
tower-cli inventory create --name VMware --organization "Default"

tower-cli group create --name Demo --inventory Local --source manual
tower-cli job_template create --name "VMware - Ping" --description "Ping all hosts in inventory" --job-type run --inventory VMware --project Demos --playbook plays/ping.yml --machine-credential vagrant-ssh --forks 10 --verbosity default
