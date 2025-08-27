# Ansible
Ansible playbooks to automate setup of my home environment

NOTE: This playbook is highly customized for my setup and is not intended to be run on other machines.
      Please read the playbooks carefully before proceeding

Requirements:
ansible
git
NetworkManager

STEPS :
1. Create ansible vault password file under user's home directory
   echo "<ANSIBLE_VAULT_PASS>" > ~/.ansible_vault_pass

2. Run ansible-playbook site.yml

