Arch Chef Boilerplate
===============
A minimalist, yet sane configuration for bootstrapping a basic configuration onto Arch Linux hosts for a new project in minutes.


Features
--------

Defines a base role that includes all of the following:


Bundled base cookbook:

    - [base:chef]           Configures chef to run from cron
    - [base:developer]      A place to add dev-friendly standard configuration across nodes
    - [base:docker]         Configures a basic docker installation
    - [base:firewall]       Configures a basic iptables firewall
    - [base:pacman]         Refreshes package cache - but throttled to once-per-day
    - [base:ssh]            Disables ssh password login, and ssh as root
    - [base:users]          Disables root password login

Dependent cookbooks:

    - [cron]                Used to schedule chef-client
    - [logrotate]           Used to rotate chef logs
    - [sudo]                Used to configure sudo and enable sysadmin sudoers
    - [users]               Used to creates sysadmin group with users as defined in users databag

Basic Setup
-----------

    # clone this repo and wipe out .git/
    # install knife.rb and pem keys (user and org) to ~/.chef/
    $ echo "chef_client_path	'/root/.gem/ruby/2.0.0/bin/chef-client'" >> .chef/knife.rb
    $ berks install
    $ berks upload
    $ knife cookbook upload base
    $ knife data bag create users
    $ knife data bag create users <username> # see README in user cookbook to configure with SSH public key*
    $ knife bootstrap <host> -x root -d archlinux-gems -r 'recipe[base]'

Don't neglect to add at least one user and SSH public key or you may not be able to SSH into your node.
