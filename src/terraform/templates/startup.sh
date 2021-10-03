if [[ -z $(dpkg -l | grep "cloud-init" ) ]]
then
	echo "cloud-init not installed, installing and reseting instance"
	apt install -y cloud-init
	shutdown -r now
fi
