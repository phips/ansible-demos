app
===

Deploys a [Python/Flask](http://flask.pocoo.org) [web application](https://github.com/phips/flask_app) from an artifact (supplied by Jenkins) and fronts it with nginx+WSGI.

This role forms a major part of my demonstrations, and has been tinkered with and expanded over time. A customer once asked me if [Ansible Tower](ansible.com/tower) provided an authorisation system for code deployments - it doesn't, but this role mimics behaviour that could be made to work like that. In short it does a check against a third party web service for permission - in the context of the demos this is simply a curl against an nginx server running on another host. If the curl fails then deployment will be set to True anyway, so you don't need to put this part of the puzzle into your own setups.

Requirements
------------

You need a working Jenkins machine to pull the artifact from, and if you want to mimic talking to a third party for 'deployment permission' then you need a web server hosting files in its root directory named after the hosts you're deploying to. The files should simply contain 'True' or 'False'.

Role Variables
--------------

    app_path: /srv/web_app
    app_remote_web: web.box
    app_jenkins_host: jenkins.box
    app_jenkins_port: 8080
    app_jenkins_job: webapp_dev


Dependencies
------------

Not strictly required, but I use [Benno Joy's nginx role](https://galaxy.ansible.com/bennojoy/nginx/) from [Galaxy](galaxy.ansible.com) to set up my standalone nginx server.

Example Playbook
----------------

    - hosts: appservers
      roles:
         - { role: app }

License
-------

BSD

Author Information
------------------

Mark Phillips  
<mark@ansible.com>

