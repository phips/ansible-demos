# Demo Infrastructure

My most popular demonstration utilises VMware, Jenkins, Git and Ansible Tower to show a software deployment. From a Linux workstation I make a change to some code, which is automatically updated in Jenkins via a trigger, and is subsequently tested, turned into an artifact (tgz file, basically) and deployed to N web server hosts by Ansible Tower.

Nginx also features as a Yum repository.

Ansible handles provisioning of virtual machines, installation and configuration of supporting applications (Nginx again, plus [WSGI](http://wsgi.readthedocs.org/en/latest/) and finally deploying our web application code.

This is how the infrastructure looks:

![](ansible_demo_infra.png?raw=true)

