Arch Chef Boilerplate
===============
A minimalist, yet sane configuration for bootstrapping a basic configuration onto Arch Linux hosts for a new project in minutes.


Features
--------

Defines a base role that includes all of the following:

Dependent cookbooks:

    - [users]              Creates sysadmin group with users as defined in users databag
    - [sudo]               Basic sudoers config including sysadmin sudo rights

Bundled base cookbook:

    - [base:users]         Disables root password login
    - [base:ssh]           Disables ssh password login, and ssh as root
    - [base:firewall]      Configures a basic iptables firewall
    - [base:pacman]        Refreshes package cache - but throttled to once-per-day
    - [base:developer]     A place to add dev-friendly standard configuration across nodes


Basic Setup
-----------

    # clone this repo and wipe out .git/
    # install knifee.rb and pem keys (user and org) to .chef/
    $ echo "chef_client_path	'/root/.gem/ruby/2.0.0/bin/chef-client'" >> .chef/knife.rb
    $ knife cookbook site install users
    $ knife cookbook site install sudo
    $ knife cookbook upload base users sudo
    $ knife role from file roles/base.json
    $ knife data bag create users
    $ knife data bag create users <username> # see README in user cookbook to configure including SSH public key*
    # start bootstrapping nodes with role[base]

Don't neglect to add at least one user and SSH public key or you may not be able to SSH into your node.
