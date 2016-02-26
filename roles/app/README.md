Role Name
=========

Quick n dirty deployment of an application artifact, straight from Jenkins build job.

Requirements
------------


Role Variables
--------------

    app_path: /srv/web_app
    app_jenkins_host: jenkins.box
    app_jenkins_port: 8080
    app_artifact_name: app.tgz

Dependencies
------------


Example Playbook
----------------

    - hosts: app
      roles:
         - { role: app, tags: app }

License
-------

BSD

Author Information
------------------

Mark Phillips <mark@ansible.com>  
http://github.com/phips/ansible-demos
