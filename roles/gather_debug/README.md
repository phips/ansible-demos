gather_debug
============

A rather simplistic role to run some commands and dump output.

Requirements
------------

Role Variables
--------------

Dependencies
------------

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: gather_debug }

License
-------

BSD

Further thoughts
----------------

Lots of this could be turned into variables for flexiblity, and you could even
use regexs to 'search' the stdout of commands for particular values. Say,
higher than X%, or whatever.


Author Information
------------------

Mark Phillips <mark@probably.co.uk>
