responce="0"

printf -- "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
printf -- "\nLoading...\n"
printf -- "Java version: \n----------\n"
java --version
printf -- "----------\n\n\n"
printf -- "---Minecraft Server Manager---\n"
printf -- "\n1 - View Servers\n"
printf -- "2 - Create New Server\n"
printf -- "3 - Exit\n"
printf -- ">> "
read -r responce
printf -- "You selected: "
printf -- "$responce"
printf -- "\n"
