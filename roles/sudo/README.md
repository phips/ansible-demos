sudo
====

Manage user sudo entitlements – with a time based 'cleanup'.

Requirements
------------


Role Variables
--------------

sudo_user: (set on play)
sudo_cleanup: true
sudo_count: 10
sudo_units: minutes


Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: sudo sudo_user: bob }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@probably.co.uk>

