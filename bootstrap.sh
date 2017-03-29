#!/bin/bash

# Create ssh keys if they don't exist
if [ ! -f ./sshkeys/id_rsa ] || [ ! -f ./sshkeys/id_rsa.pub ]; then
    echo "One or more ssh keyfiles are missing. Recreating keys."
    rm -f ./sshkeys/*
    echo -e "y\n" | ssh-keygen -t rsa -N "" -f ./sshkeys/id_rsa || exit 1
fi
