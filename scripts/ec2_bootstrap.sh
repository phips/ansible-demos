#!/bin/bash
# Inserted into ec2 instance user-data - so is executed on boot.
# Nice way to bootstrap a vanilla ec2 AMI by talking to Ansible Tower.
# To understand Tower callbacks see http://docs.ansible.com/ansible-tower/latest/html/userguide/job_templates.html#provisioning-callbacks

# Enabled pipelining for Ansible
/usr/bin/perl -ni -e 'print unless /^Defaults \s+ requiretty/x' /etc/sudoers

# Tower callback
domain=${DOMAIN:-bovine.cow}
tower=$(dig +short _cm._tcp.${domain} srv | awk '/^0/ {print $4}')
request=($(dig +short ${domain} txt | tr -d '"'))
template_key=${request[0]}
template_id=${request[1]}

if [[ -z ${tower} ]]; then
    logger 'ansible: could not find tower host'
    exit 1
fi

retry_attempts=10
attempt=0
while [[ $attempt -lt $retry_attempts ]]
do
  status_code=`curl -s -i --data "host_config_key=$template_key" http://$tower/api/v1/job_templates/$template_id/callback/ | head -n 1 | awk '{print $2}'`
  if [[ $status_code == 202 ]]
    then
    exit 0
  fi
  attempt=$(( attempt + 1 ))
  logger "bootstrap: ${status_code} received... retrying in 30 seconds (Attempt ${attempt})"
  sleep 30
done
exit 1
