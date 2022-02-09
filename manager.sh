# Some functions

# Skips a bunch of lines
clear_page()
{
printf -- "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
}

deco_bar()
{
  printf -- "----------\n"
}

show_instance_list()
{
  numberOfInstances=$(ls Instances/ | wc -l)  # Finds the number of servers
  printf -- "Number of servers: "
  printf -- $numberOfInstances
  printf -- "\nUsing a total file size of: "
  printf -- $(du -hs Instances | cut -f1)  # Prints the total file size of all servers
  printf -- "\n\n"
  deco_bar
  ls Instances/ | cat  # lists all servers
  deco_bar
}

delete_instance()
{

}

select_a_server_for_action()
{
  clear_page
  printf -- "Select a server:\n\n"
  ls Instances/ | cat | nl  # Prints list of instances with a number
  numberOfInstances=$(ls Instances/ | wc -l) # Finds the number of servers
}

# View servers menu
view_servers_menu()
{
  lock="1"
  while [ "$lock" = "1" ];
  do
  	lock="0"
  	action="0"
  	clear_page
    show_instance_list
    printf -- "\nWhat would you like to do?\n\n"
   	printf -- "1 - Start a server\n"
   	printf -- "2 - Configure a server\n"
    printf -- "3 - Delete a server\n"
  	printf -- "4 - Return to main menu\n"
  	printf -- ">> "
  	read -r action
  	case $action in
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

select_server_type()
{
  lock="1"
  while [ "$lock" = "1" ];
  do
  	lock="0"
  	responce="0"
  	clear_page
   	printf -- "The new server will be named: '"
    printf -- $newServerName
    printf -- "'\nSelect the server type: \n"
    deco_bar
   	printf -- "1 - Offical Minecraft 1.18.1 Server\n"
   	printf -- "2 - PaperMC 1.18.1 Server (Comes with preformance patches, highly recommended)\n"
    deco_bar
  	printf -- ">> "
  	read -r responce
  	case $responce in
  	1)
  	serverType="1" ;;
  	2)
  	serverType="2" ;;
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
      select_server_type
      cd Instances
			mkdir $newServerName
			cd $newServerName
      case $serverType in
      1)
      ;;
      2)
      ;;
      *)
      printf -- "Error: Server type unknown!" && exit 1 ;;
      esac
      cd ../..
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
