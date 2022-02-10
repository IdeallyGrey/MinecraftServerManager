mkdir MinecraftServerSoftware
cd MinecraftServerSoftware
mkdir Instances
touch config.txt
if [ "$(command -v wget)" != "" ]; then
  wget https://raw.githubusercontent.com/IdeallyGrey/MinecraftServerManager/main/manager.sh
elif [ "$(command -v curl)" != "" ]; then
  curl -O https://raw.githubusercontent.com/IdeallyGrey/MinecraftServerManager/main/manager.sh
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
