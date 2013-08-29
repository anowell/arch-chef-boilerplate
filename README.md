Arch Chef Boilerplate
===============
A minimalist, yet sane configuration for bootstrapping a basic configuration onto Arch Linux hosts for a new project in minutes.


Features
-------------
  
- Users:
  - Creates sysadmin group with users as defined in users databag
  - Disables root password login
- SSH:
  - Disables ssh password login
  - Disables ssh as root
- Firewall:
  - Configures a basic iptables firewall
- Pacman: Refreshes package cache - but throttled to once-per-day
- Developer: A starting point for configuratin dev-friendly environment


Basic Setup
-----------

    # clone this repo and wipe out .git/
    # install knife.rb and pem keys (user and org) to .chef/
    $ echo "chef_client_path	'/root/.gem/ruby/2.0.0/bin/chef-client'" >> .chef/knife.rb
    $ knife cookbook site install users
    $ knife cookbook site install sudo
    $ knife cookbook upload base users sudo
    $ knife role from file roles/base.json
    $ knife data bag create users
    $ knife data bag create users <username> # see users cookbook for how to add ssh pub key
    # start bootstrapping nodes with role[base]
