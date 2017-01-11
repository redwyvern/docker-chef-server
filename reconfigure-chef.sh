#!/bin/bash

/opt/opscode/embedded/bin/runsvdir-start &

chef-server-ctl reconfigure |tee /root/out.txt

chef-server-ctl user-create nickw Nick Weedon nick@weedon.org.au 'myPassword' --filename nick-key
chef-server-ctl org-create short_name 'Red Wyvern' --association_user nickw --filename REDWYVERN-validator.pem

tail -F /opt/opscode/embedded/service/*/log/current
