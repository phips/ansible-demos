# Ansible Demos

Here are all the [plays](plays) and [roles](roles) I use in my many varieties of Ansible demo.

There aren't any instructions, per se, as this is all simply reference material. There will be a link to a demo recording here very soon. That demo will also reference these plays and roles.

**NOTE**: You should, however, assume that you need [Ansible Core 2.0](https://github.com/ansible/ansible) - a lot of the plays and roles here now feature [blocks](http://docs.ansible.com/ansible/playbooks_blocks.html), and so will fail on Core 1.9 and less.

Quite often I am working with [dynamic inventory](http://docs.ansible.com/ansible/intro_dynamic_inventory.html) sources. Those scripts are not here, as they change. The best place to get them is from [the Ansible source](https://github.com/ansible/ansible/tree/devel/contrib/inventory) itself.

The main demo I give, [deploying code](roles/app), makes use of [this other repository](https://github.com/phips/flask_app) of mine.

One of the things I would like to expand this with is alternate hypervisors - using [RHEV](http://www.redhat.com/en/technologies/virtualization/enterprise-virtualization), for example, is a logical next step. If you get time to work on plays for that before I do, I welcome pull requests!
