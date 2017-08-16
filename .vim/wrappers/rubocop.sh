#!/bin/bash --login
#
# Wrapper script to use the correct rubocop executable if using RVM to manage
# Ruby installations.

(source $HOME/.rvm/scripts/rvm ||
  source /usr/bin/rvm) >/dev/null 2>&1

if [[ $? == 0 ]]; then
  rvm use default >/dev/null 2>&1
fi

RUBOCOP=$(which rubocop)

if [[ ! $(basename $RUBOCOP) == 'rubocop' ]]; then
  echo 'Could not find rubocop executable!'
  exit 1
else
  $RUBOCOP "$@"
fi
