# Make sure only root can run this script
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Set color of logo
tput setaf 4
 cat << EOF
   _____  ___  _____   __  ____________  _   _________  ________ _      _____   __   __ 
  / _ \ \/ / |/ / _ | /  |/  /  _/ ___/ | | / /  _/ _ \/ __/ __ \ | /| / / _ | / /  / / 
 / // /\  /    / __ |/ /|_/ // // /__   | |/ // // // / _// /_/ / |/ |/ / __ |/ /__/ /__
/____/ /_/_/|_/_/ |_/_/  /_/___/\___/   |___/___/____/___/\____/|__/|__/_/ |_/____/____/
                                                                                        
EOF

# Reset color
  tput sgr 0

echo "Installing dependencies..."
echo "=========================="
apt update && apt -y install python3 python3-pip omxplayer ntfs-3g exfat-fuse usbmount

cp startvideos.sh /home/pi/
cp startfullscreen.sh /home/pi/
cp videoloop /etc/init.d/
cp autostart.sh /home/pi/
cp videoloop_starter /etc/cron.d/
cp looperconfig.txt /boot/
update-rc.d videoloop defaults

mkdir /media/USB
cp media/garmin.mp4 /home/pi/media/USB
chmod a+r /media/USB
echo "/dev/sda1	/media/USB	ntfs-3g	defaults,noatime,nodiratime 	0	0" >> /etc/fstab
echo "Done!" you will need to reboot after this
