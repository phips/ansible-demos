#!/bin/bash
#
# Derived from request_tower_configuration.sh script, shipped with Ansible Tower
#
# This version can take server, host key and job ID as parameters, but can also look them up from DNS.
# See this blog post for more information: http://probably.co.uk/simple-service-discovery-using-ansible-tower-and-dns.html

usage() {
  echo -e "Requests server configuration from Ansible Tower\n"
  echo "Usage: $0 <server address>[:server port] <host config key> <job template id>"
  echo "Example: $0 example.towerhost.net 44d7507f2ead49af5fca80aa18fd24bc 38"
  exit 1
}

# my name
script=$0

if [ $(uname) != "Linux" ]; then
    logger -p user.err "Ansible: ${script} FAIL, only tested on Linux"
    exit 1
fi

if [ ! -x /usr/bin/dig ]; then
    logger -p user.err "Ansible: ${script} FAIL, no dig command. Try installing bind-utils"
    exit 1
fi

if [ ! -x /bin/dnsdomainname ]; then
    logger -p user.err "Ansible: ${script} FAIL, no dnsdomainname command. Try installing hostname"
    exit 1
fi

dnsdomain=$(/bin/dnsdomainname)
if [ -z $dnsdomain ]; then
    logger -p user.err "Ansible: ${script} FAIL, can't establish DNS domain name"
    exit 1
fi

towersvr=${1:-$(dig +short _cm._tcp.${dnsdomain} srv|awk '/^0/ {print $4}')}
configkey=${2:-$(dig +short ${dnsdomain} txt | tr -d '"' | cut -f1 -d" ")}
jtid=${3:-$(dig +short ${dnsdomain} txt | tr -d '"' | cut -f2 -d" ")}

if [[ -z $towersvr || -z $configkey || -z $jtid ]]; then
    logger -p user.err "Ansible: ${script} FAIL, no towersvr, configkey or jtid"
    exit 1
fi

retry_attempts=10
attempt=0
while [[ $attempt -lt $retry_attempts ]]
do
  status_code=$(curl -s -i --data "host_config_key=${configkey}" http://${towersvr}/api/v1/job_templates/${jtid}/callback/ | head -n 1 | awk '{print $2}')
  if [[ $status_code -ge 300 ]]; then
      logger -p user.err "Ansible: ${script} FAIL, ${status_code} received"
      exit 1
  else
    exit 0
  fi
  attempt=$(( attempt + 1 ))
  echo "${status_code} received... retrying in 1 minute. (Attempt ${attempt})"
  sleep 60
done
exit 1
