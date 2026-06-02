#!/bin/bash

#AB Update system
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Install necessary packages
sudo apt install rclone
sudo apt install fuse3

echo -e '\e[1;36mrclone will now open a browser window. Select "single sign on" and enter your my.wheaton.edu email. Note that this will not work unless the LiDAR Box folder has been shared with you--contact Dr. Master about access if you need it.\033[0m'

rclone config create box box #AB Request sign on to Box

# A browser window will open at this point. Select "single sign on" and use your my.wheaton.edu email. 
# You must, of course, have access to the LiDAR Box folder. Contact Dr. Master for access if you need it.

#AB Create the appropriate directory. 
mkdir -p ~/Box

#AB Mount the folder called "LiDAR" (located at the root directory of the user's box account) to ~/Box.
#   If the relevant folder has been shared with you, this should just work. If it has not, don't try to
#   create a new LiDAR folder just for the sake of making this work--you'll confuse _everyone_. There is
#   in fact a canonical folder that this needs to point to, and Dr. Master owns it and can give you access.
#   Be very careful about editing stuff in there--it's a serious archive with a lot of important data. 
rclone mount box:/LiDAR ~/Box --vfs-cache-mode writes --daemon

#AB I believe this should always mount the relevant folder when the computer starts up. If it doesn't, add that rclone mount like to ~/.profile or to ~/.bashrc