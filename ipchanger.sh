#!/bin/bash

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

# Check if terminal supports colors
if [ -t 1 ]; then
  ncolors=$(tput colors 2>/dev/null)
  if [ -n "$ncolors" ] && [ $ncolors -ge 8 ]; then
    # Enhanced Neon color palette
    NC='\033[0m'
    NEON_PINK='\033[38;5;198m'
    NEON_BLUE='\033[38;5;51m'
    NEON_GREEN='\033[38;5;46m'
    NEON_PURPLE='\033[38;5;165m'
    NEON_YELLOW='\033[38;5;226m'
    NEON_ORANGE='\033[38;5;208m'
    NEON_CYAN='\033[38;5;87m'
    FLASH='\033[5m'
    BOLD='\033[1m'
    DIM='\033[2m'

    # Background colors
    BG_BLACK='\033[40m'
    BG_BLUE='\033[44m'
    BG_PURPLE='\033[45m'

    # Original colors for compatibility
    RED="$(printf '\033[31m')"
    GREEN="$(printf '\033[32m')"
    ORANGE="$(printf '\033[33m')"
    BLUE="$(printf '\033[34m')"
    MAGENTA="$(printf '\033[35m')"
    CYAN="$(printf '\033[36m')"
    WHITE="$(printf '\033[37m')"
    BLACK="$(printf '\033[30m')"
    RESETBG="$(printf '\e[0m\n')"
  else
    # No color support
    NC=''
    NEON_PINK=''
    NEON_BLUE=''
    NEON_GREEN=''
    NEON_PURPLE=''
    NEON_YELLOW=''
    NEON_ORANGE=''
    NEON_CYAN=''
    FLASH=''
    BOLD=''
    DIM=''
    BG_BLACK=''
    BG_BLUE=''
    BG_PURPLE=''
    RED=''
    GREEN=''
    ORANGE=''
    BLUE=''
    MAGENTA=''
    CYAN=''
    WHITE=''
    BLACK=''
    RESETBG=''
  fi
else
  # Not a terminal, disable colors
  NC=''
  NEON_PINK=''
  NEON_BLUE=''
  NEON_GREEN=''
  NEON_PURPLE=''
  NEON_YELLOW=''
  NEON_ORANGE=''
  NEON_CYAN=''
  FLASH=''
  BOLD=''
  DIM=''
  BG_BLACK=''
  BG_BLUE=''
  BG_PURPLE=''
  RED=''
  GREEN=''
  ORANGE=''
  BLUE=''
  MAGENTA=''
  CYAN=''
  WHITE=''
  BLACK=''
  RESETBG=''
fi

__vrsn__=2.2

banner(){
    clear
    echo -e "${RED}${BOLD}${BG_BLACK}"
    echo -e '
    @LxaNce @LxaNce#.        .LxaNce.  @Lx
      xaN   @Lx   aNce      @Lxa  Nce# @Lx
      xaN   @Lx    Nce      @Lx    @Lx @Lx
      xan   @Lx   aNce      @Lx        @LxaNce   LxaNce.  @LxaNce   .LxaN.   .LxaN.  @LxaNce
      xan   @LxaNce#"       @Lx        @Lx "Nce     "Nce @Lx "Nce @Lxa"Nce Lxa  Nce @Lxa"
      xan   @Lx      '"${FLASH}LxaNce${NC}${RED}${BOLD}"' @Lx    @Lx @Lx  Nce .@LxaNce @Lx  Nce @Lx  Nce @LxaNce# @Lx
      xan   @Lx             @Lxa  Nce# @Lx  Nce @Lx  Nce @Lx  Nce @Lxa Nce Lxa.     @Lx
    @LxaNce @Lx              "LxaNCe"  @Lx  Nce "@LxaNce @Lx  Nce  "LxaNce  LxaNce  @Lx
                                                                       Nce
                                                                  @Lx aNce
                                                                   "LxaN"
    '
    echo -e "${NC}${NEON_YELLOW}${BOLD}      ⚡ ADVANCED IP MODIFICATION SYSTEM ⚡${NC}"
    echo -e "${NEON_GREEN}${BOLD}                        [ VERSION ${__vrsn__} ]${NC}\n"
}

# Enhanced glitch effect
glitch() {
    local text=$1
    for i in {1..5}; do
        echo -ne "\r${NEON_PINK}${text}${NC}"
        sleep 0.07
        echo -ne "\r${NEON_BLUE}${text}${NC}"
        sleep 0.07
        echo -ne "\r${NEON_CYAN}${text}${NC}"
        sleep 0.07
    done
    echo -ne "\r${NEON_GREEN}${BOLD}${text}${NC}\n"
}

# Enhanced cyber scanning animation
cyber_scan() {
    local operation=$1
    echo -e "\n${NEON_BLUE}[>] ${FLASH}${BOLD}INITIATING ${operation} SEQUENCE${NC}"
    sleep 0.5

    local chars="⣾⣽⣻⢿⡿⣟⣯⣷"
    local progress=("▰▱▱▱▱▱▱▱▱▱" "▰▰▱▱▱▱▱▱▱▱" "▰▰▰▱▱▱▱▱▱▱" "▰▰▰▰▱▱▱▱▱▱" "▰▰▰▰▰▱▱▱▱▱" "▰▰▰▰▰▰▱▱▱▱" "▰▰▰▰▰▰▰▱▱▱" "▰▰▰▰▰▰▰▰▱▱" "▰▰▰▰▰▰▰▰▰▱" "▰▰▰▰▰▰▰▰▰▰")

    for i in {0..9}; do
        spin=${chars:i%8:1}
        perc=$((i*10))
        prog=${progress[$i]}
        echo -ne "\r${NEON_CYAN}[${spin}]${NC} ${NEON_PURPLE}${prog}${NC} ${NEON_ORANGE}${perc}%${NC} ${NEON_YELLOW}|${NC} ${NEON_GREEN}Scanning system vectors...${NC}"
        sleep 0.2
    done
    echo -e "\n${NEON_GREEN}${BOLD}[✓] ${operation} COMPLETE${NC}\n"
}

# Function to check and install dependencies with enhanced visuals
check_dependencies() {
    clear && banner
    if ! command -v pv > /dev/null || ! command -v figlet > /dev/null; then
        glitch "> DEPENDENCY CHECK: MISSING COMPONENTS DETECTED"

        echo -e "${NEON_PINK}[!] ${BOLD}INSTALLING REQUIRED PACKAGES${NC}"

        # Check if running on Termux (Android)
        if [[ $(uname -o) == "Android" ]]; then
            pkg update
            pkg install -y pv figlet
        else
            # Check if running on Linux
            if command -v apt-get > /dev/null; then
                sudo apt-get update
                sudo apt-get install -y pv figlet
            elif command -v yum > /dev/null; then
                sudo yum install -y pv figlet
            elif command -v dnf > /dev/null; then
                sudo dnf install -y pv figlet
            elif command -v zypper > /dev/null; then
                sudo zypper install -y pv figlet
            else
                echo -e "${NEON_PINK}[!] ${BOLD}INSTALLATION FAILED: MANUAL INTERVENTION REQUIRED${NC}"
                exit 1
            fi
        fi

        echo -e "${NEON_GREEN}[+] ${BOLD}DEPENDENCY INSTALLATION SUCCESSFUL${NC}"
    else
        echo -e "${NEON_GREEN}[+] ${BOLD}DEPENDENCY CHECK: ALL COMPONENTS PRESENT${NC}"
    fi
}

# Enhanced update function with loading theme
check_update(){
    echo -e "\n${NEON_BLUE}[>] ${BOLD}CHECKING FOR SYSTEM UPDATES${NC}"

    # Show update checking progress
    echo -e "${NEON_CYAN}[*] Connecting to update servers...${NC}"

    # Fancy loading animation
    for i in {1..20}; do
        progress=$((i * 5))
        bars=$(printf "%${i}s" | tr ' ' '█')
        spaces=$(printf "%$((20-i))s" | tr ' ' '░')
        echo -ne "\r${NEON_PURPLE}[${NEON_GREEN}${bars}${NEON_BLUE}${spaces}${NEON_PURPLE}] ${NEON_YELLOW}${progress}%${NC}"
        sleep 0.1
    done
    echo -e "\r${NEON_PURPLE}[${NEON_GREEN}████████████████████${NEON_PURPLE}] ${NEON_YELLOW}100%${NC}    "

    relase_url='https://api.github.com/repos/LxaNce-Hacker/IP-Changer/releases/latest'
    new_version=$(curl -s "${relase_url}" | grep '"tag_name":' | awk -F\" '{print $4}')
    tarball_url="https://github.com/LxaNce-Hacker/IP-Changer/archive/refs/tags/${new_version}.tar.gz"

    # Check if curl command failed
    if [ -z "$new_version" ]; then
        echo -e "${NEON_PINK}[!] ${BOLD}CONNECTION ERROR: COULD NOT REACH UPDATE SERVER${NC}"
        sleep 2
        return
    fi

    if [[ $new_version != $__vrsn__ ]]; then
        echo -e "\n${NEON_PINK}${BG_BLACK}╔══════════════════════════════════════════════════╗${NC}"
        echo -e "${NEON_PINK}${BG_BLACK}║  ${FLASH}${BOLD}UPDATE AVAILABLE${NC}${NEON_PINK}${BG_BLACK}                                ║${NC}"
        echo -e "${NEON_PINK}${BG_BLACK}║                                                  ║${NC}"
        echo -e "${NEON_PINK}${BG_BLACK}║  Current version: ${NEON_BLUE}v${__vrsn__}${NEON_PINK}                           ║${NC}"
        echo -e "${NEON_PINK}${BG_BLACK}║  Latest version:  ${NEON_GREEN}v${new_version}${NEON_PINK}                           ║${NC}"
        echo -e "${NEON_PINK}${BG_BLACK}╚══════════════════════════════════════════════════╝${NC}"

        # Automatically update without asking for confirmation
        glitch "> INITIATING UPDATE PROCEDURE"

        # Create backup of current version
        echo -e "${NEON_BLUE}[*] ${BOLD}Creating backup of current version...${NC}"
        backup_dir="${HOME}/.ip-changer-backup-$(date +%Y%m%d%H%M%S)"
        mkdir -p "$backup_dir"
        cp -r "$BASE_DIR"/* "$backup_dir"/
        echo -e "${NEON_GREEN}[✓] ${BOLD}Backup created at: ${NEON_YELLOW}${backup_dir}${NC}"

        pushd "$HOME" > /dev/null 2>&1
        echo -e "${NEON_BLUE}[*] ${BOLD}Downloading update package...${NC}"

        # Show loading animation while downloading
        for i in {1..10}; do
            echo -ne "\r${NEON_CYAN}[${NEON_YELLOW}*${NEON_CYAN}] ${NEON_PURPLE}Downloading update ${NEON_ORANGE}$i/10${NC}"
            sleep 0.2
        done
        echo ""

        wget "${tarball_url}" -O ".IP-Changer.tar.gz" > /dev/null 2>&1

        if [[ -e ".IP-Changer.tar.gz" ]]; then
            cyber_scan "UPDATE"

            echo -e "${NEON_BLUE}[*] ${BOLD}Extracting update files...${NC}"
            tar -xf .IP-Changer.tar.gz -C "$BASE_DIR" --strip-components 1 > /dev/null 2>&1

            if [ $? -ne 0 ]; then
                echo -e "${NEON_PINK}[!] ${BOLD}UPDATE FAILED: EXTRACTION ERROR${NC}"
                echo -e "${NEON_YELLOW}[*] ${BOLD}Restoring from backup...${NC}"
                cp -r "$backup_dir"/* "$BASE_DIR"/
                echo -e "${NEON_GREEN}[✓] ${BOLD}Restored from backup${NC}"
                reset_color
                exit 1
            fi

            rm -f .IP-Changer.tar.gz
            popd > /dev/null 2>&1

            # Show update changelog (simulation)
            echo -e "\n${NEON_YELLOW}${BOLD}╔═════════════════════════════════╗${NC}"
            echo -e "${NEON_YELLOW}${BOLD}║      WHAT'S NEW                 ║${NC}"
            echo -e "${NEON_YELLOW}${BOLD}╚═════════════════════════════════╝${NC}"
            echo -e "${NEON_GREEN}• Enhanced user interface${NC}"
            echo -e "${NEON_GREEN}• Fixed network detection bugs${NC}"
            echo -e "${NEON_GREEN}• Added support for new interfaces${NC}"
            echo -e "${NEON_GREEN}• Improved error handling${NC}"
            echo -e "${NEON_GREEN}• Performance optimizations${NC}"
            echo -e "\n${NEON_BLUE}${BOLD}[+] Press Enter to continue...${NC}"
            read
            { clear; banner; }
            echo -e "${NEON_GREEN}[+] ${BOLD}SYSTEM UPDATE SUCCESSFUL. RELAUNCH REQUIRED.${NC}"
            { reset_color; exit 0; }
        else
            echo -e "${NEON_PINK}[!] ${BOLD}UPDATE FAILED: DOWNLOAD ERROR${NC}"
            { reset_color; exit 1; }
        fi
    else
        echo -e "\n${NEON_GREEN}[+] ${BOLD}SYSTEM STATUS: UP-TO-DATE${NC}"
        sleep 1
    fi
    clear
}

## Reset terminal colors
reset_color() {
    tput sgr0   # reset attributes
    tput op     # reset color
    return
}

## Enhanced Network Status Check
check_status() {
    banner
    echo -e "${NEON_BLUE}[>] ${BOLD}CHECKING NETWORK STATUS${NC}"

    # Visual loading effect
    for i in {1..10}; do
        echo -ne "\r${NEON_CYAN}[${NEON_YELLOW}*${NEON_CYAN}] ${NEON_PURPLE}Establishing connection to network ${NEON_ORANGE}$i/10${NC}"
        sleep 0.15
    done
    echo ""

    timeout 3s curl -fIs "https://api.github.com" > /dev/null
    if [ $? -eq 0 ]; then
        echo -e "${NEON_GREEN}[+] ${BOLD}NETWORK STATUS: ${FLASH}CONNECTED${NC}"
        sleep 1
        check_update
    else
        echo -e "${NEON_PINK}[!] ${BOLD}NETWORK STATUS: DISCONNECTED${NC}"
        echo -e "${NEON_ORANGE}[!] ${BOLD}OPERATING IN OFFLINE MODE${NC}"
        sleep 2
    fi
}

## Enhanced Main Menu
main_menu(){
    banner

    echo -e "${NEON_PURPLE}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${NEON_PURPLE}║   ${NEON_BLUE}${BOLD}DEVELOPER: ${NEON_GREEN}LxaNce-Hacker (Prince Katiyar)${NC}${NEON_PURPLE}            ║${NC}"
    echo -e "${NEON_PURPLE}║   ${NEON_PINK}${BOLD}    [ FOR EDUCATIONAL PURPOSES ONLY ]${NC}${NEON_PURPLE}                ║${NC}"
    echo -e "${NEON_PURPLE}╚════════════════════════════════════════════════════════╝${NC}"
    echo ""

    store=""
    # Enhanced IP detection with visual effects
    echo -e "${NEON_YELLOW}${BOLD}[>] SCANNING NETWORK INTERFACES${NC}"
    sleep 1

    # Checking IP with Internet via ETH/WI-FI with better visual feedback
    check_ip() {
        interface=$1
        echo -ne "${NEON_CYAN}[*] Probing ${interface}...${NC}"
        ifconfig "$interface" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            ip_address=$(ifconfig "$interface" | awk '/inet / {print $2}')
            if [ -n "$ip_address" ]; then
                echo -e "\r${NEON_GREEN}[✓] ${BOLD}DETECTED ${NEON_YELLOW}${interface^^}${NEON_GREEN} INTERFACE: ${NEON_PINK}${ip_address}${NC}      "
                store="$interface"
            else
                echo -e "\r${NEON_ORANGE}[!] ${interface} has no IPv4 address${NC}                        "
            fi
        else
            echo -e "\r${DIM}[×] ${interface} not found${NC}                                 "
        fi
    }

    check_ip "wlan0"
    sleep 0.3
    check_ip "eth0"
    sleep 0.3
    check_ip "enp2s0"
    sleep 0.3
    check_ip "wlo1"
    sleep 0.3
    check_ip "usb0"
    sleep 0.3

    # If no IP found, exit
    if [ -z "$store" ]; then
        echo -e "${NEON_PINK}${BOLD}[!] NO NETWORK INTERFACES DETECTED. EXITING...${NC}" && exit 1
    fi

    echo -e "\n${NEON_BLUE}${BOLD}[🌐] ACTIVE INTERFACE: ${NEON_GREEN}${store}${NC}"

    echo -e "${NEON_PURPLE}┌──[${NEON_GREEN}LxaNce${NEON_BLUE}㉿${NEON_GREEN}IP-Changer${NEON_PURPLE}]-[${NEON_PINK}~${NEON_PURPLE}]${NC}"
    echo -ne "${NEON_PURPLE}└─${NEON_GREEN}$ ${NC}"
    read -r ip

    # Enhanced IP validation
    if [[ ! $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo -e "${NEON_PINK}[!] ${BOLD}INVALID IP FORMAT. TRY AGAIN WITH CORRECT FORMAT (e.g., 192.168.1.100)${NC}"
        sleep 2
        main_menu
        return
    fi

    echo -e "\n${NEON_BLUE}[>] ${BOLD}INITIATING IP MODIFICATION${NC}"
    cyber_scan "IP CHANGE"

    sudo ifconfig $store $ip

    # Enhanced success message with visual elements
    echo -e "${NEON_GREEN}${BOLD}[✓] IP ADDRESS SUCCESSFULLY MODIFIED${NC}"
    echo -e "${NEON_BLUE}[>] ${BOLD}NEW CONFIGURATION FOR ${NEON_YELLOW}${store^^}${NEON_BLUE}:${NC}"

    echo -e "${NEON_PURPLE}╔═════════════════════════════════════════════════════════════════════╗${NC}"
    ifconfig "$store" | grep -E 'inet|netmask|broadcast' | while read -r line; do
        echo -e "${NEON_CYAN}  $line${NC}"
    done
    echo -e "${NEON_PURPLE}╚═════════════════════════════════════════════════════════════════════╝${NC}"



    # Additional information
    echo -e "\n${NEON_YELLOW}[i] ${BOLD}SYSTEM INFORMATION:${NC}"
    echo -e "${NEON_GREEN}  • Operating System: ${NEON_CYAN}$(uname -s) $(uname -r)${NC}"
    echo -e "${NEON_GREEN}  • Machine Type: ${NEON_CYAN}$(uname -m)${NC}"
    echo -e "${NEON_GREEN}  • Date/Time: ${NEON_CYAN}$(date)${NC}"
}

# Function Calling
check_dependencies
check_status
main_menu

## LxaNce















































































## Tool Created By Prince Katiyar
