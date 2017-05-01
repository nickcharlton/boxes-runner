#!/bin/bash

export JENKINS_USERNAME=""
export JENKINS_PASSWORD=""
export NOTIFICATION_EMAIL=""

# setup the environment
source /usr/local/share/chruby/chruby.sh
chruby 2.4.0

bundle install
bundle exec bin/configure_jobs
