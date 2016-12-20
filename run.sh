#!/bin/sh

if [ "x$REMOTE_SSH_SERVER" == "x" ]; then
  # Login mode, no SSH_SERVER
  node app.js -p 3000
else
  # SSH connect mode
  su -c "node app.js -p 3000 --sshhost $REMOTE_SSH_SERVER --sshport $REMOTE_SSH_PORT --sshuser $REMOTE_SSH_USER" term
fi