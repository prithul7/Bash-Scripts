#!/bin/bash

# System Management Script (Best Practice)

# ----------- Constants -----------
# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
NC="\e[0m"

# Files
SYSTEM_REPORT="system_report.txt"
NETWORK_REPORT="network_report.txt"
TEST_FILE="testfile.txt"

# Defaults
DEFAULT_PASS="password123"

# ----------- Functions -----------

# 1. System Health Check
system_health() {
    echo -e "${GREEN}Running System Health Check...${NC}"
    {
        echo "===== Disk Usage ====="
        df -h
        echo "===== CPU Info ====="
        lscpu
        echo "===== Memory Usage ====="
        free -h
    } > "$SYSTEM_REPORT"

    echo -e "${YELLOW}Showing first 10 lines of $SYSTEM_REPORT:${NC}"
    head -n 10 "$SYSTEM_REPORT"
}

# 2. Active Processes
active_processes() {
      ps aux > process_list.txt
    echo -n "Enter keyword:"
    read keyword
    grep "$keyword" process_list.txt
    count=$(grep -c "$keyword" process_list.txt)
    echo "${RED}Matched processes: $count"
}

# 3. User & Group Management
user_group_management() {
    read -p "Enter new username:" username
    if id "$username" &>/dev/null; then
        echo -e "${RED}User already exists!${NC}"
        return 1
    fi

    useradd "$username" || { echo -e "${RED}Failed to create user${NC}"; return 1; }
    echo "$username:$DEFAULT_PASS" | chpasswd
    groupadd "${username}_group"
    usermod -aG "${username}_group" "$username"

    touch "$TEST_FILE"
    chown "$username":"${username}_group" "$TEST_FILE"

    echo -e "${GREEN}User $username created, password=$DEFAULT_PASS, group=${username}_group${NC}"
}

# 4. File Organizer
file_organizer() {
    read -p "Enter directory path:" dir
    if [ ! -d "$dir" ]; then
        echo -e "${RED}Directory does not exist!${NC}"
        return 1
    fi

    cd "$dir" || return 1
    mkdir -p images docs scripts
    mv *.jpg *.png images/ 2>/dev/null
    mv *.txt *.md docs/ 2>/dev/null
    mv *.sh scripts/ 2>/dev/null

    echo -e "${GREEN}Files organized into images/, docs/, scripts/${NC}"
    if command -v tree &>/dev/null; then
        tree .
    else
        ls -R .
    fi
}

# 5. Network Diagnostics
network_diagnostics() {
    echo -e "${GREEN}Running network diagnostics...${NC}"
    {
        ping -c 3 google.com
        dig google.com
        curl -I https://example.com
    } > "$NETWORK_REPORT"

    echo -e "${YELLOW}Network diagnostics saved to $NETWORK_REPORT${NC}"
}

# 6. Scheduled Task Setup (cron)
scheduled_task() {
    read -p "Enter full script path:" script
    if [ ! -f "$script" ]; then
        echo -e "${RED}Script does not exist!${NC}"
        return 1
    fi

    read -p "${YELLOW}Enter minute (0-59):${NC}" min
    read -p "${RED}Enter hour (0-23):${NC} " hr
    if ! [[ "$min" =~ ^[0-5]?[0-9]$ && "$hr" =~ ^([01]?[0-9]|2[0-3])$ ]]; then
        echo -e "${RED}Invalid time format!${NC}"
        return 1
    fi

    (crontab -l 2>/dev/null; echo "$min $hr * * * $script") | crontab -
    echo -e "${GREEN}Cron job added: Runs $script at $hr:$min daily${NC}"
}
# 7. SSH Key Setup
ssh_key_setup() {
    read -p "Enter key name (default: id_rsa): " keyname
    keyname=${keyname:-id_rsa}
    ssh-keygen -t rsa -b 2048 -f ~/.ssh/"$keyname"
    echo -e "${YELLOW}Public key generated. Copy this to your remote server:${NC}"
    cat ~/.ssh/"$keyname".pub
}

# 8. Exit
exit_script() {
    echo -e "${GREEN}Goodbye!${NC}"
    exit 0
}

# ----------- Menu Loop -----------
while true; do
    echo -e "\n${YELLOW}===== System Management Menu =====${NC}"
    echo "1. System Health Check"
    echo "2. Active Processes"
    echo "3. User & Group Management"
    echo "4. File Organizer"
    echo "5. Network Diagnostics"
    echo "6. Scheduled Task Setup (cron)"
    echo "7. SSH Key Setup"
    echo "8. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) system_health ;;
        2) active_processes ;;
        3) user_group_management ;;
        4) file_organizer ;;
        5) network_diagnostics ;;
        6) scheduled_task ;;
        7) ssh_key_setup ;;
        8) exit_script ;;
        *) echo -e "${RED}Invalid choice! Please try again.${NC}" ;;
esac 
done

