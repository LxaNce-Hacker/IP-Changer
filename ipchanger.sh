## LxaNce
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"
__vrsn__=1.0
banner(){
check_status;
	cat<<- EOF
	${RED}8888888 8888888b.        .d8888b.  888                                                  
	${RED}  888   888   Y88b      d88P  Y88b 888                                                  
	${RED}  888   888    888      888    888 888                                                  
	${RED}  888   888   d88P      888        88888b.   8888b.  88888b.   .d88b.   .d88b.  888d888 
	${RED}  888   8888888P"       888        888 "88b     "88b 888 "88b d88P"88b d8P  Y8b 888P"   
	${RED}  888   888      888888 888    888 888  888 .d888888 888  888 888  888 88888888 888     
	${RED}  888   888             Y88b  d88P 888  888 888  888 888  888 Y88b 888 Y8b.     888     
	${RED}8888888 888              "Y8888P"  888  888 "Y888888 888  888  "Y88888  "Y8888  888     
	${RED}                                                                   888                  
	${RED}                                                              Y8b d88P                  
	${RED}                                                               "Y88P"                                
	EOF
}
check_update(){
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Checking for update : "
	relase_url='https://api.github.com/repos/LxaNce-Hacker/IP-Changer/releases/latest'
	new_version=$(curl -s "${relase_url}" | grep '"tag_name":' | awk -F\" '{print $4}')
	tarball_url="https://github.com/LxaNce-Hacker/IP-Changer/archive/refs/tags/${new_version}.tar.gz"

	if [[ $new_version != $__vrsn__ ]]; then
		echo -ne "${ORANGE}update found\n"${WHITE}
		sleep 2
		echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${ORANGE} Downloading Update..."
		pushd "$HOME" > /dev/null 2>&1
		wget "${tarball_url}" -O ".IP-Changer.tar.gz"

		if [[ -e ".IP-Changer.tar.gz" ]]; then
			tar -xf .IP-Changer.tar.gz -C "$BASE_DIR" --strip-components 1 > /dev/null 2>&1
			[ $? -ne 0 ] && { echo -e "\n\n${RED}[${WHITE}!${RED}]${RED} Error occured while extracting."; reset_color; exit 1; }
			rm -f .IP-Changer.tar.gz
			popd > /dev/null 2>&1
			{ sleep 3; clear; banner_small; }
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}] Successfully updated! Run ipchanger again\n\n"${WHITE}
			{ reset_color ; exit 1; }
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading."
			{ reset_color; exit 1; }
		fi
	else
		echo -ne "${GREEN}up to date\n${WHITE}" ; sleep .5
	fi
}

## Check Internet Status
check_status() {
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Internet Status : "
	timeout 3s curl -fIs "https://api.github.com" > /dev/null
	[ $? -eq 0 ] && echo -e "${GREEN}Online${WHITE}" && check_update || echo -e "${RED}Offline${WHITE}"
}
banner;
echo "                 ${MAGENTA}TOOL CREATED BY : ${BLUE}LxaNce (Prince Katiyar)"
echo "          ${RED}[${GREEN} THIS TOOL IS CREATED FOR EDUCATIONAL PURPOSE ONLY ${RED}]"
echo ""
echo "${RED}[${WHITE}*${RED}]YOUR REAL ETH0 IP : ${ORANGE}" 
ifconfig eth0 | grep netmask | grep inet
read -p "${RED}[${WHITE}*${RED}]${GREEN} Enter New IP : ${BLUE}" ip
sudo ifconfig eth0 $ip
echo "${RED}[${WHITE}*${RED}] NOW, CURRENT IP : ${ORANGE}"
ifconfig eth0 | grep netmask 

## LxaNce 
































































































## Tool Created By Prince Katiyar 
