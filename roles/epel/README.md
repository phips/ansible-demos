epel
====

Enable EPEL - Extra Packages for Enterprise Linux.

Requirements
------------


Role Variables
--------------

epel_rpm: the full URL to epel-release.

Set in in vars/{{ ansible_distribution }}-{{ ansible_distribution_major_version }}.yml to enable different OS release versions.

Dependencies
------------


Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: epel }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@probably.co.uk>
[Probably](http://probably.co.uk)
