#!/bin/sh

if [ "x${BASE}" == "x" ]; then
  BASE="/"
fi

if [ "x${REMOTE_SSH_SERVER}" == "x" ]; then
  # Login mode, no SSH_SERVER
  npm start -- -p ${WETTY_PORT}
else
  # SSH connect mode
  cmd="npm start -- -p ${WETTY_PORT} --sshhost ${REMOTE_SSH_SERVER} --sshport ${REMOTE_SSH_PORT} --base ${BASE}" 
  if ! [ "x${REMOTE_SSH_USER}" == "x" ]; then
    cmd="${cmd} --sshuser ${REMOTE_SSH_USER}"
  fi
  su -c "${cmd}" term
fi
