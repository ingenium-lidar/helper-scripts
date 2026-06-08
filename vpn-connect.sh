#!/bin/bash

sudo -v #AB Prompt for sudo. If you don't do this, the echo line will fail because it runs in the background with &, and so can't prompt you for sudo.
eval $(gp-saml-gui --gateway --clientos=Windows vpn.wheaton.edu)
echo "$COOKIE" | sudo openconnect --protocol=gp --user="$USER" --os=win --usergroup=gateway:prelogin-cookie --authgroup="Wheaton College Only" --passwd-on-stdin vpn.wheaton.edu &

#AB This script connects you to Wheaton's VPN when you're on Ubuntu OS.

#AB Requires that gp-saml-gui be installed. Use `sudo apt install gp-saml-gui` before running this for the first time. 
#   WARNING! Edits your $USER variable. This may interfere with some installer scripts. 
#   NOTE! This script will prompt for the following at various stages:
#       - The superuser (sudo) password of the device you are running this script on
#       - A valid Wheaton NetID and password
#       - A verification from your Wheaton multifactor authentication tool
