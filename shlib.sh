#!/bin/sh

# shlib - pure posix sh lib
# author: ssleert
# link: https://github.com/ssleert/shlib

export CLR_RESET='\033[1;0m'

export STL_BOLD='\033[1;1m'
export STL_FAINT='\033[1;2m'
export STL_ITALIC='\033[1;3m'
export STL_UNDERLINE='\033[1;4m'
export STL_BLINKSLOW='\033[1;5m'
export STL_BLINKRAPID='\033[1;6m'
export STL_REVERSE='\033[1;7m'
export STL_INVISIBLE='\033[1;8m'
export STL_STRIKE='\033[1;9m'
export STL_OVERLINE='\033[1;53m'
 
export CLR_BLACK='\033[0;30m'
export CLR_RED='\033[0;31m'
export CLR_GREEN='\033[0;32m'
export CLR_YELLOW='\033[0;33m'
export CLR_BLUE='\033[0;34m'
export CLR_PURPLE='\033[0;35m'
export CLR_CYAN='\033[0;36m'
export CLR_WHITE='\033[0;37m'
 
export CLR_LT_BLACK='\033[0;90m'
export CLR_LT_RED='\033[0;91m'
export CLR_LT_GREEN='\033[0;92m'
export CLR_LT_YELLOW='\033[0;93m'
export CLR_LT_BLUE='\033[0;94m'
export CLR_LT_PURPLE='\033[0;95m'
export CLR_LT_CYAN='\033[0;96m'
export CLR_LT_WHITE='\033[0;97m'
 
export CLR_BG_BLACK='\033[40m'
export CLR_BG_RED='\033[41m'
export CLR_BG_GREEN='\033[42m'
export CLR_BG_YELLOW='\033[43m'
export CLR_BG_BLUE='\033[44m'
export CLR_BG_PURPLE='\033[45m'
export CLR_BG_CYAN='\033[46m'
export CLR_BG_WHITE='\033[47m'
 
export CLR_BG_LT_BLACK='\033[0;100m'
export CLR_BG_LT_RED='\033[0;101m'
export CLR_BG_LT_GREEN='\033[0;102m'
export CLR_BG_LT_YELLOW='\033[0;103m'
export CLR_BG_LT_BLUE='\033[0;104m'
export CLR_BG_LT_PURPLE='\033[0;105m'
export CLR_BG_LT_CYAN='\033[0;106m'
export CLR_BG_LT_WHITE='\033[0;107m'

die() {
    exit 1
}

log() {
    [ -z "$_LOGGING" ] && return
    case $1 in 
        crit) printf "[${CLR_RED}crit${CLR_RESET}] ${STL_BOLD}%s${CLR_RESET}\n" "$2"; die ;;
         err) printf "[${CLR_RED}err${CLR_RESET}] ${STL_BOLD}%s${CLR_RESET}\n" "$2" ;;
        warn) printf "[${CLR_YELLOW}warn${CLR_RESET}] ${STL_BOLD}%s${CLR_RESET}\n" "$2" ;;
         msg) printf "[${CLR_GREEN}msg${CLR_RESET}] ${STL_BOLD}%s${CLR_RESET}\n" "$2";;
        info) printf "[${CLR_BLUE}info${CLR_RESET}] ${STL_BOLD}%s${CLR_RESET}\n" "$2" ;;
    esac
}

msg() { 
    printf "${CLR_GREEN}${STL_BOLD}::${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$1"
    shift
    for i in "$@"; do
        printf " ${CLR_GREEN}${STL_BOLD}|${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$i"
    done
}

compl() {
    printf "${CLR_GREEN}${STL_BOLD}>>>${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$1"
    shift
    for i in "$@"; do
        printf "  ${CLR_GREEN}${STL_BOLD}|${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$i"
    done
}

warn() {
    printf "${CLR_YELLOW}${STL_BOLD}warn:${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$1"
    shift
    for i in "$@"; do
        printf "    ${CLR_YELLOW}${STL_BOLD}|${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$i"
    done
}

err() {
    printf "${STL_BOLD}${CLR_RED}error:${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$1"
    shift
    for i in "$@"; do
        printf "     ${STL_BOLD}${CLR_RED}|${CLR_RESET} ${STL_BOLD}%s${CLR_RESET}\n" "$i"
    done
}

has() {
    _cmd=$(command -v "$1") 2> /dev/null || return 1
    [ -x "$_cmd" ] || return 1
}