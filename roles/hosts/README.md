Role Name
========

Sets the hostname on a target machine, assigning the name as defined in inventory.

This may be expanded further at some point to do other 'host related' stuff.

Requirements
------------

Inventory name MUST be a valid hostname - if it is an IP address the role will
skip setting the name. Logic skips an IP address regex; effectively `|match` is
using python [re.match](https://docs.python.org/2/library/re.html).

When DNS is lacking, put the name you want to use in the inventory file, then
simply use ansible_ssh_host=IP.ADD.RES.SS

Role Variables
--------------


Dependencies
------------


Example Playbook
-------------------------

    - hosts: servers
      roles:
         - { role: hosts }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@probably.co.uk>
