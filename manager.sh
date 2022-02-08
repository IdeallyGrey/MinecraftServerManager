# Some functions

# Skips a bunch of lines
clear_page()
{
printf -- "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
}

# View servers menu
view_servers_menu()
{
	numberOfInstances=$(ls Instances/ | wc -l)
	printf -- "Number of instances: "
	printf -- $numberOfInstances
	printf -- "\n\n"
	ls Instances/ | cat

}

# Create new server menu
create_server_menu()
{
	printf -- "Name of server (type 'exit' to exit): \n"
	lock="1"
	while [ "$lock" = "1" ];
	do
		lock="0"
		responce="0"
		read -r responce
		if [ "$responce" = "" ]; then
			printf -- "Are you gonna put in at least a little effort?"
			lock="1"
		elif [ "$responce" = "exit" ]; then
			main_menu
		else
			cd Instances
			touch $responce
			cd ..
			main_menu
		fi
}

# Preferences menu
preferences_menu()
{
	printf -- "This is the preferences menu\n"
}

# Main menu
main_menu()
{
lock="1"
while [ "$lock" = "1" ];
do
	lock="0"
	responce="0"
	clear_page
 	printf -- "---Minecraft Server Manager---\n"
 	printf -- "\n1 - View Servers\n"
 	printf -- "2 - Create New Server\n"
	printf -- "3 - Preferences\n"
 	printf -- "4 - Exit\n"
	printf -- ">> "
	read -r responce
	case $responce in
	1)
	view_servers_menu ;;
	2)
	create_server_menu ;;
	3)
	preferences_menu ;;
	4)
	printf -- "Goodbye!\n\n" && exit 0 ;;
	*)
	printf -- "Sorry, that's not a valid option!\n" && lock="1" && sleep 3 ;;
	esac
done
}


# Starts executing from here

main_menu
