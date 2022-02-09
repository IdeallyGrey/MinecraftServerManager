# Server download Links
Minecraft1_18_1="https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar"
PaperMC1_18_1="https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/187/downloads/paper-1.18.1-187.jar"


# Some functions

check_for_wget_or_curl()  # Determins what program to use to download the needed server files.
{
  if [ "$(command -v wget)" != "" ]; then
    downloadCommand="wget"
  elif [ "$(command -v curl)" != "" ]; then
    downloadCommand="curl"
  else
    printf -- "Error: 'wget' and/or 'curl' commands could not be found."
    exit 1
  fi
}

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
  lock="1"
  while [ "$lock" = "1" ];
	do
		lock="0"
		responce="0"
    clear_page
    printf -- "Are you sure you want to delete this instance?:\n"
    printf -- $instanceForActionName
    printf -- "\n\n(y/n): "
		read -r responce
    case $responce in
  	"n" | "N" | "no" | "NO")
  	printf -- "Canceling..."
    sleep 2
    main_menu ;;
    "y" | "Y" | "yes" | "YES")
    printf -- "Deleteing..."
    rm -rf Instances/$instanceForActionName
    sleep 2
    main_menu ;;
  	*)
  	printf -- "Sorry, that's not a valid option!\n" && lock="1" && sleep 3 ;;
  	esac
	done

}

select_a_instance_for_action()
{
  lock="1"
	while [ "$lock" = "1" ];
	do
		lock="0"
		instanceForAction="0"
    numberOfInstances=$(ls Instances/ | wc -l) # Finds the number of servers
    clear_page
    printf -- "Select a server. Type 'exit' to cancel.\n\n"
    deco_bar
    ls Instances/ | cat | nl  # Prints list of instances with a number
    deco_bar
    printf -- "\n>> "
		read -r instanceForAction
    if [ "$instanceForAction" -ge "1" ] && [ "$instanceForAction" -le "$numberOfInstances" ]; then
      instanceForActionName=$(ls Instances/ | cat | sed "${instanceForAction}q;d")
  	elif [ "$instanceForAction" = "exit" ]; then
      main_menu
    else
  	   printf -- "Sorry, that's not a valid option!" && lock="1" && sleep 2
  	fi
	done

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
  	select_a_instance_for_action
    launch_instance ;;
  	2)
    select_a_instance_for_action
    configure_instance ;;
    3)
  	select_a_instance_for_action
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
      if [ "$downloadCommand" = "wget" ]; then
        wget $Minecraft1_18_1
      elif [ "$downloadCommand" = "curl" ]; then
        curl -O $Minecraft1_18_1
      else
        printf -- "Error: Something went wrong with the download command."
        exit 1
      fi ;;
      2)
      if [ "$downloadCommand" = "wget" ]; then
        wget $PaperMC1_18_1
      elif [ "$downloadCommand" = "curl" ]; then
        curl -O $PaperMC1_18_1
      else
        printf -- "Error: Something went wrong with the download command."
        exit 1
      fi ;;
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

check_for_wget_or_curl
main_menu
