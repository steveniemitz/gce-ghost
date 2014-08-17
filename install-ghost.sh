#/bin/sh

sudo apt-get update -q
sudo apt-get install unzip -yq
cd ~
curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
sudo mkdir -p /var/www/ghost
sudo useradd -r ghost -U
sudo unzip -uo ~/ghost.zip -d /var/www/ghost
rm ghost.zip
sudo chown -R ghost:ghost /var/www/ghost
sudo apt-get install nodejs -yq
sudo update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100
curl https://www.npmjs.org/install.sh | sudo sh
sudo apt-get install build-essential -yq
cd /var/www/ghost
sudo npm install --production
sudo curl https://raw.githubusercontent.com/TryGhost/Ghost-Config/master/init.d/ghost -o /etc/init.d/ghost
sudo chmod 755 /etc/init.d/ghost
sudo service ghost start
sudo update-rc.d ghost defaults
sudo update-rc.d ghost enable

sudo apt-get install nginx -yq

curl https://raw.githubusercontent.com/steveniemitz/gce-ghost/master/ghost.conf -o ~/ghost.conf.tmp
read -p "Enter the server's hostname: " ghosthost
sed "s/example.com/$ghosthost/" ~/ghost.conf.tmp > ~/ghost.conf
sudo mv ~/ghost.conf /etc/nginx/sites-available/ghost.conf
sudo ln -s /etc/nginx/sites-available/ghost.conf /etc/nginx/sites-enabled/ghost.conf
sudo service nginx restart
