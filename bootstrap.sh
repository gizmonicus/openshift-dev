#!/bin/bash

# Create ssh keys if they don't exist
if [ ! -f ./provisioning/files/sshkeys/id_rsa ] || [ ! -f ./provisioning/files/sshkeys/id_rsa.pub ]; then
    echo "One or more ssh keyfiles are missing. Recreating keys."
    mkdir -p ./provisioning/files/sshkeys
    rm -f ./provisioning/files/sshkeys/*
    echo -e "y\n" | ssh-keygen -t rsa -N "" -f ./provisioning/files/sshkeys/id_rsa || exit 1
fi

vagrant up
