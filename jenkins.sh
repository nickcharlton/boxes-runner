#!/bin/bash

export ATLAS_TOKEN=''

# setup the environment
source /usr/local/share/chruby/chruby.sh
chruby 2.2.2

bundle install

# run
bundle exec bin/bootstrap
bundle exec bin/run trusty64-standard

# exit cleanly
exit 0
