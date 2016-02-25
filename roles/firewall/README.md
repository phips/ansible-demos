Firewall
=========

Only for CentOS 7 - set default zone

Requirements
------------


Role Variables
--------------

    firewall_default_zone

Dependencies
------------


Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: firewall, firewall_default_zone: trusted }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@probably.co.uk>
http://probably.co.uk
