# MinecraftServerManager
 
An easy to use TUI for installing, managing, and running Minecraft servers. Works on any Unix-like operating system (Linux, MacOS, BSD, etc..) Perfect for a RaspberryPi!

# Installing

1. Download the installation script from the releases page.

   (Use `wget https://raw.githubusercontent.com/IdeallyGrey/MinecraftServerManager/main/setup.sh` if you are installing in a non-gui enviroment.)

3. Move the script to the directory in which you'd like the manager and all the installed servers to be located. This directory does not need to be empty, the script will create a new subdirectory in which everything will be stored.
4. Run the setup script with `sh setup.sh`.

# Usage

You can launch the manager by changing to the MinecraftServerSoftware directory, and running `sh manager.sh`.

When prompted, it is recommended that you use the PaperMC software rather than Mojang's offical software. The PaperMC fork comes with several patches, and can greatly increase preformance, especially on lower-end machines.

# Notes

All pull requests are welcome!

I am not afilliated with Mojang Studios, or the PaperMC project.
