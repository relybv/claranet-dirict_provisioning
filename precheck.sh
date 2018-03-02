#!/bin/bash
REPO='https://github.com/relybv/claranet-dirict_provisioning.git'
SSHKEY='id_rsa'
# SERVERS=( "192.168.86.39" "192.168.86.39" )

### code start ###

# functions
function pre_flight_check {
   if [ "$USER" != "root" ]; then
      echo "This script must be run as root."
      exit 1
   fi

   if which ansible-playbook > /dev/null 2>&1; then
      echo "Ansible already installed"
   else
      echo "Installing ansible"
      apt-get update > /dev/null 2>&1
      apt-get install -y ansible > /dev/null 2>&1
   fi

   if which ansible-playbook > /dev/null 2>&1; then
      echo "Ansible already installed"
   else
      echo "Installing ansible"
      apt-get update > /dev/null 2>&1
      apt-get install -y ansible > /dev/null 2>&1
   fi

   echo "Pre flight check ok."
}

# ssh keys

pre_flight_check



if [ -f $HOME/.ssh/$SSHKEY ]; then
   echo 'Skip ssh-keygen'
else
   echo "Generating ssh keysi, please save the private key: $HOME/.ssh/$SSHKEY in a safe place."
   mkdir -p $HOME/.ssh
   chmod 700 ~/.ssh
   ssh-keygen -f $HOME/.ssh/$SSHKEY -t rsa -N ''
fi


# for i in "${SERVERS[@]}"
# do
#    echo "Installing ssh keys on host " $i
   # enable passwordless login
#    ssh-copy-id -f -i ~/.ssh/id_rsa.pub  $i > /dev/null
#    echo "Testing passwordless login on host " $i
   # test login
#    if ssh -t $USER@$i "true" > /dev/null 2>&1 ; then
#       echo "Login succeeded"
#    else
#       echo "Login on server $i unsuccesfull, aborting script"
#       exit 1
#    fi
# done
