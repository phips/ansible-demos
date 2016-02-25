packages
========

Install some packages. Can be used to install random packages that specific
roles don't really cover.

Requirements
------------


Role Variables
--------------

    group_vars:
        packages:
            (array)

Dependencies
------------


Example Playbook
-------------------------

    - hosts: servers
      roles:
         - packages

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@probably.co.uk>
