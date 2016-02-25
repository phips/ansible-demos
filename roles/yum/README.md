Role Name
=========

Set up Yum repositories.


Requirements
------------

None. Other than the repositories must be defined in the yum_repos array.

Role Variables
--------------

By default nothing is defined, you need to define yum_repos. This is an array of hashes, which go to populate /etc/yum.repos.d/* files. Here's an example of setting up EPEL:

    yum_repos:
      - label: epel
        name: "Extra Packages for Enterprise Linux 6"
        mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
        enabled: True
        gpgcheck: True
        gpgkey: https://fedoraproject.org/static/0608B895.txt

Take a look at the template.repo.j2 file to understand how this works.

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: yum }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@probably.co.uk>
