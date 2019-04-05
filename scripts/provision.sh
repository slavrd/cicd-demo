#!/usr/bin/env bash

# install inspec 3.7.11
which inspec || {
    wget -q -P /tmp https://packages.chef.io/files/stable/inspec/3.7.11/ubuntu/16.04/inspec_3.7.11-1_amd64.deb
    sudo dpkg -i /tmp/inspec_3.7.11-1_amd64.deb
}
