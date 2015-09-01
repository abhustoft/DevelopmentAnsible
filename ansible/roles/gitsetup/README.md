# Gitsetup

This will set up different Git configs like a global gitignore, and
a gitconfig. When using it you need to copy the credentials.yml.example
to credentials.yml and fill in the blanks. You normally use this role
for Vagrant VMs to make sure you can code in the VM and have the
correct name and email set in the git config.

Some people might not agree with forcing the gitconfig, change it if
you want. This is just a role to make sure it's set so you don't
commit stuff as 'Vagrant User'.

## Requirements

We assume you are using this to set up a development VM using Vagrant.
If you are not, please override the default git config location.

We also assume you have a group_vars/development folder for your repo
where you can override the necessary variables for git username and email.
Create a local.yml in group_vars/development where you override
git_username_local and git_email_local.

## Role Variables

### Vars

Variable to set you real name for development purposes. Override
git_username_local in your group_vars/development/local.yml. local.yml
should be in your .gitignore.

    git_username: "{{ git_username_local | mandatory }}"

Variable to set you email for development purposes. Override
git_email_local in your group_vars/development/local.yml. local.yml
should be in your .gitignore.

    git_email: "{{ git_email_local | mandatory }}"

### Defaults

We assume you are using this role with Vagrant, and assume you want
the generated .gitignore and .gitconfig at the Vagrant home directory.
Please override this if necessary.

    git_config_dir: "/home/vagrant"

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - gitsetup
