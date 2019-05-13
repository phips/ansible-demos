phone_home
==========

Configures a script to run under the special cron situation, 'reboot'. In other words, only run when the machine boots. This script does a call to an Ansible Tower server to run a given Job Template (i.e. an Ansible play). The script uses DNS records to look up the Job Template ID, and the Tower server.

Further Reading
---------------

https://linux.die.net/man/5/crontab
https://docs.ansible.com/ansible-tower/latest/html/userguide/job_templates.html#provisioning-callbacks
http://probably.co.uk/simple-service-discovery-using-ansible-tower-and-dns.html

Role Variables
--------------

You can set these, rather than have them looked up in DNS, if you choose...
```
phone_home_tower
phone_home_key
phone_home_id
```

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: phone_home }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@probably.co.uk>

