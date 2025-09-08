#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
BOLD="\e[1m"
RESET="\e[0m"

echo -e "${CYAN}${BOLD}Welcome to the Basic Calculator!${RESET}"
echo -e "${BLUE}--------------------------------${RESET}"

echo -e "${YELLOW}Enter first number:${RESET}"
read a
echo -e "${YELLOW}Enter second number:${RESET}"
read b

echo -e "${BLUE}--------------------------------${RESET}"
echo -e "${GREEN}Choose an operation:${RESET}"
echo -e "1. Addition"
echo -e "2. Subtraction"
echo -e "3. Multiplication"
echo -e "4. Division"
echo -e "${BLUE}--------------------------------${RESET}"
read ch

case $ch in
    1) 
        echo -e "${CYAN}Performing Addition...${RESET}"
        res=$(echo "$a + $b" | bc)
        ;;
    2) 
        echo -e "${CYAN}Performing Subtraction...${RESET}"
        res=$(echo "$a - $b" | bc)
        ;;
    3) 
        echo -e "${CYAN}Performing Multiplication...${RESET}"
        res=$(echo "$a * $b" | bc)
        ;;
    4) 
        echo -e "${CYAN}Performing Division...${RESET}"
        if [ "$b" -eq 0 ]; then
            echo -e "${RED}Error: Division by zero is not allowed!${RESET}"
            exit 1
        fi
        res=$(echo "scale=2; $a / $b" | bc)  # scale=2 keeps 2 decimal places
        ;;
    *) 
        echo -e "${RED}Invalid Choice! Please enter 1-4.${RESET}"
        exit 1
        ;;
esac

echo -e "${BLUE}--------------------------------${RESET}"
echo -e "${BOLD}Result: ${GREEN}$res${RESET}"
echo -e "${CYAN}Thank you for using the calculator!${RESET}"

