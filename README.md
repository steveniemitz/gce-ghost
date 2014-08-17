gce-ghost
=========

Setup scripts to install ghost on a Google Compute Engine VM (tested on wheezy 7.6)
Log in to your linux box, then run:

`curl https://raw.githubusercontent.com/steveniemitz/gce-ghost/master/install-ghost.sh | sh`

Once installed, you may want to change the server name in `/etc/nginx/sites-available/ghost.conf`.  Also, don't forget to set up ghost's admin user before exposing the server to the internet!
