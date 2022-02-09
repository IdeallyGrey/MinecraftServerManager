# Some functions

# Skips a bunch of lines
clear_page()
{
printf -- "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
}

deco_bar()
{
  printf -- "----------"
}

show_instance_list()
{
  numberOfInstances=$(ls Instances/ | wc -l)  # Finds the number of servers
  printf -- "Number of servers: "
  printf -- $numberOfInstances
  printf -- "\nUsing a total file size of: "
  printf -- $(du -hs Instances | cut -f1)  # Prints the total file size of all servers
  printf -- "\n\n"
  ls Instances/ | cat  # lists all servers
  printf -- "\n"
}

# View servers menu
view_servers_menu()
{
  lock="1"
  while [ "$lock" = "1" ];
  do
  	lock="0"
  	responce="0"
  	clear_page
    deco_bar
    show_instance_list
    deco_bar
    printf -- "\nWhat would you like to do?\n\n"
   	printf -- "1 - Start a server\n"
   	printf -- "2 - Delete a server\n"
    printf -- "3 - Configure a server\n"
  	printf -- "4 - Return to main menu\n"
  	printf -- ">> "
  	read -r responce
  	case $responce in
  	1)
  	launch_instance ;;
  	2)
    configure_instance ;;
    3)
  	delete_instance ;;
  	4)
  	main_menu ;;
  	*)
  	printf -- "Sorry, that's not a valid option!\n" && lock="1" && sleep 3 ;;
  	esac
  done
}

# Create new server menu
create_server_menu()
{
	lock="1"
	while [ "$lock" = "1" ];
	do
		clear_page
		printf -- "Name of server (type 'exit' to cancel): \n"
		lock="0"
		newServerName="0"
		read -r newServerName
		if [ "$newServerName" = "" ]; then
			printf -- "Are you gonna put in at least a little effort?\n"
			lock="1"
			sleep 3
		elif [ "$newServerName" = "exit" ]; then
			main_menu
		else
      newServerName=${newServerName// /-}
			cd Instances
			mkdir $newServerName
			cd ..
			main_menu
		fi
	done
}

# Preferences menu
preferences_menu()
{
	printf -- "This is the preferences menu.\n"
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
 	printf -- "---Minecraft Server Manager---\n\n"
 	printf -- "1 - View Servers\n"
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
