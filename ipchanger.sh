## LxaNce

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")


RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

__vrsn__=2

banner(){
	clear
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
	${RED}										Version : ${__vrsn__} 
	EOF
}

# Function to check and install dependencies
check_dependencies() {
	clear && banner;
    if ! command -v pv > /dev/null; then
        echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing 'pv' package..." | pv -qL 20

        # Check if running on Termux (Android)
        if [[ $(uname -o) == "Android" ]]; then
            pkg install pv
        else
            # Check if running on Linux
            if command -v apt-get > /dev/null; then
                sudo apt-get update
                sudo apt-get install -y pv
            elif command -v yum > /dev/null; then
                sudo yum install -y pv
            elif command -v dnf > /dev/null; then
                sudo dnf install -y pv
            elif command -v zypper > /dev/null; then
                sudo zypper install -y pv
            else
                echo -e "${RED}[${WHITE}!${RED}]${RED} Unable to install 'pv' package. Please install it manually." | pv -qL 20
                exit 1
            fi
        fi

        echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} 'pv' package installed successfully." | pv -qL 20
    else
        echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} 'pv' package is already installed. Skipping installation." | pv -qL 20
    fi
}

check_update(){
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Checking for update : " | pv -qL 20
	relase_url='https://api.github.com/repos/LxaNce-Hacker/IP-Changer/releases/latest'
	new_version=$(curl -s "${relase_url}" | grep '"tag_name":' | awk -F\" '{print $4}')
	tarball_url="https://github.com/LxaNce-Hacker/IP-Changer/archive/refs/tags/${new_version}.tar.gz"
	
	if [[ $new_version != $__vrsn__ ]]; then
		echo -ne "${ORANGE}update found\n"${WHITE} | pv -qL 20
		sleep 2
		echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${ORANGE} Downloading Update..."  | pv -qL 20
		pushd "$HOME" > /dev/null 2>&1
		wget "${tarball_url}" -O ".IP-Changer.tar.gz"
		if [[ -e ".IP-Changer.tar.gz" ]]; then
			tar -xf .IP-Changer.tar.gz -C "$BASE_DIR" --strip-components 1 > /dev/null 2>&1
			[ $? -ne 0 ] && { echo -e "\n\n${RED}[${WHITE}!${RED}]${RED} Error occured while extracting."; reset_color; exit 1; }
			rm -f .IP-Changer.tar.gz
			popd > /dev/null 2>&1
			{ sleep 3; clear; banner; }
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}] Successfully updated! Run ipchanger again\n\n" | pv -qL 20
			{ reset_color ; exit 1; }
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading." | pv -qL 20
			{ reset_color; exit 1; }
		fi
	else
		echo -ne "${GREEN}Up-To-Date\n${WHITE}" | pv -qL 20 ; sleep .5
	fi
	clear
}

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
	return
}

## Check Internet Status
check_status() {
	banner;
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Internet Status : " | pv -qL 20
	timeout 3s curl -fIs "https://api.github.com" > /dev/null
	[ $? -eq 0 ] && echo -e "${GREEN}Online${WHITE}" && check_update || echo -e "${RED}Offline${WHITE}" | pv -qL 20
}

## Main Menu
main_menu(){
	banner;
	
	echo "			${MAGENTA}TOOL CREATED BY : ${BLUE}LxaNce (Prince Katiyar)" | pv -qL 20
	echo "		  ${RED}[${GREEN} THIS TOOL IS CREATED FOR EDUCATIONAL PURPOSES ONLY ${RED}]" | pv -qL 20
	echo ""

	store=""
	# Checking IP with Internet via ETH/WI-FI
	ifconfig wlan0 > /dev/null 2>&1
	if [ $? -ne 1 ]; then
		ifconfig wlan0 | grep netmask | grep inet > /dev/null
		if [ $? -ne 1 ]; then
	    		echo "${RED}[${WHITE}*${RED}] YOUR REAL WLAN0 IP : ${ORANGE}" | pv -qL 20
	    		ifconfig wlan0 | grep netmask | grep inet | pv -qL 20
	    		store="wlan0"
		else
	    		ifconfig eth0 > /dev/null 2>&1
	    		if [ $? -ne 1 ]; then
	    			ifconfig eth0 | grep netmask | grep inet > /dev/null
	    			if [ $? -ne 1 ]; then
	        			echo "${RED}[${WHITE}*${RED}] YOUR REAL ETH0 IP : ${ORANGE}" | pv -qL 20
	        			ifconfig eth0 | grep netmask | grep inet | pv -qL 20
	        			store="eth0"
	    			else
	    				ifconfig usb0 > /dev/null 2>&1
					if [ $? -ne 1 ]; then
	    					ifconfig usb0 | grep netmask | grep inet > /dev/null
	    					if [ $? -ne 1 ]; then
	        					echo "${RED}[${WHITE}*${RED}] YOUR REAL USB0 IP : ${ORANGE}" | pv -qL 20
	        					ifconfig usb0 | grep netmask | grep inet | pv -qL 20
	        					store="usb0"
	        				fi
	        			else
	    					echo "No IP Found." | pv -qL 20 && exit
	    				fi
	        		fi
		    	fi
		fi
	fi


	read -p "${RED}[${WHITE}*${RED}]${GREEN} Enter New IP : ${BLUE}" ip
	sudo ifconfig $store $ip
	echo "${RED}[${WHITE}*${RED}] NOW, $store CURRENT IP : ${ORANGE}"| pv -qL 20
	ifconfig $store | grep netmask | pv -qL 20
}




#Function Calling
check_dependencies;
check_status;
main_menu;




## LxaNce 















































































## Tool Created By Prince Katiyar 
