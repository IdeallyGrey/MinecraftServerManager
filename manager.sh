#Some functions

#Skips a bunch of lines
clear_page()
{
printf -- "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
}

#Main menu
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
	printf -- "View Servers\n" ;;
	2)
	printf -- "Create New Server\n" ;;
	3)
	printf -- "Preferences\n" ;;
	4)
	printf -- "Goodbye!\n\n" && exit 0 ;;
	*)
	printf -- "Sorry, that's not a valid option!\n" && lock="1" && sleep 3 ;;
	esac
done
}

#Starts executing from here

main_menu
