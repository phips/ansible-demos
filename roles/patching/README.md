Patching
========

A role to patch hosts. The role permits selective patching, dependent on subscription to Yum repositories and variable setting to confirm action.

Requirements
------------


Role Variables
--------------

    defaults/main.yml
      patchme: False

Can be set on a group basis, host basis or even run basis.

Dependencies
------------


Example Playbook
-------------------------

    - hosts: servers
      roles:
         - { role: patching, patchme: True }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@ansible.com>
