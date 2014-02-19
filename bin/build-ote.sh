#!/bin/bash

# Enable tracing and exit on first failure
set -xe


# Define reasonable set of browsers in case we are running manually from commandline
if [[ -z "$BROWSERS" ]]
then
  # BROWSERS="Chrome,Firefox,/Users/jenkins/bin/safari.sh,/Users/jenkins/bin/ie8.sh,/Users/jenkins/bin/ie9.sh"
  BROWSERS="Chrome,Firefox,/Users/jenkins/bin/safari.sh,/Users/jenkins/bin/ie8.sh,/Users/jenkins/bin/ie9.sh"
fi


# BUILD #
npm install --color=false
bower install --no-color


# UNIT TESTS #
karma start --single-run --port=8888 --capture-timeout=60000 --browsers $BROWSERS --reporters=dots --no-colors --no-color
