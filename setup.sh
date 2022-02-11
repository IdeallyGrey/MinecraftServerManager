mkdir MinecraftServerSoftware
cd MinecraftServerSoftware
mkdir Instances
if [ "$(command -v wget)" != "" ]; then
  wget https://raw.githubusercontent.com/IdeallyGrey/MinecraftServerManager/main/manager.sh
  wget https://raw.githubusercontent.com/IdeallyGrey/MinecraftServerManager/main/config.txt
elif [ "$(command -v curl)" != "" ]; then
  curl -O https://raw.githubusercontent.com/IdeallyGrey/MinecraftServerManager/main/manager.sh
  curl -O https://raw.githubusercontent.com/IdeallyGrey/MinecraftServerManager/main/config.txt
else
  printf -- "Error: 'wget' and/or 'curl' commands could not be found. At least one of these is required.\n"
  exit 1
fi
printf -- "All done! Installed in: \n"
pwd
printf -- "\n"
cd ..
rm setup.sh
exit 0
