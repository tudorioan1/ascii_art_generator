#!/bin/bash

if ! command -v figlet &> /dev/null; then
    echo "Error: figlet not found. Install figlet on your PC!"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Usage: $0 \"Text\""
    exit 1
fi

TEXT="$1"

clear
echo "=============================="
echo "  Simple ASCII Text Generator "
echo "=============================="
echo " TEXT: $TEXT"
echo "------------------------------"
echo " 1. SIZE"
echo "    [L] LARGE"
echo "    [S] SMALL"
read -p " >> " W_INPUT

case $W_INPUT in
    [Ll]) 
        FONT_SIZE="big"
        STYLE_AVAILABLE=true
        ;;
    [Ss]) 
        FONT_SIZE="small"
        STYLE_AVAILABLE=false
        ;;
    *) 
        echo "Invalid"
        exit 1 
        ;;
esac

echo "------------------------------"
echo " 2. STYLE"
if [ "$STYLE_AVAILABLE" = false ]; then
    echo "    [N] NORMAL (AUTO-SELECTED)"
    S_INPUT="n"
else
    echo "    [N] NORMAL"
    echo "    [I] ITALIC"
    read -p " >> " S_INPUT
fi

if [[ "$S_INPUT" =~ ^[Ii]$ ]]; then
    FINAL_FONT="slant"
else
    FINAL_FONT=$FONT_SIZE
fi

echo ""
figlet -f "$FINAL_FONT" "$TEXT"
echo "=============================="
