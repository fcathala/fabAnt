#!/bin/bash
#
# ===============================================================
# fabMenu: Basic User Interface
#	Version: 1.0
# ===============================================================

function fabMenu {
  # =============================================================
  # User Interface
  # =============================================================
  fmValidChoice=False     # Only exit with valid menu choice
  while [ $fmValidChoice = False ]
  do
    clear
    tput cup 1 0          # Move cursor to screen location X,Y (top left is 0,0)
    fabMenuLine $fmWIDTH  # ----
    echo "$fmBANNER"
    fabMenuLine $fmWIDTH  # ----
    echo "$fmBREADCRUMB"
    fabMenuLine $fmWIDTH  # ----
    echo "$fmREQUEST"
    echo
    I=1; while [ -n "${fmOPTION[$I]}" ]
    do
      echo "$I) "${fmOPTION[$I]}
      I=$(($I+1))
    done
    echo 
    echo "Q) Quit"
    fabMenuLine $fmWIDTH # ----

    # Capture 1-character menu choice
    read -n 1 -p "$fmPROMPT" fmCHOICE

    case $fmCHOICE in
      [1-$(($I-1))])
        fmValidChoice=True
        ;;
      [Q]|[q])
        fmValidChoice=True
        ;;
      [Y]|[y])
        # Yes/No menu don't display any option 
        if [ -z "${fmOPTION[1]}" ]
        then
          fmValidChoice=True
        fi
        ;;
      *)
        :
        ;;
    esac  
  done
  echo

  # funcLower $fmCHOICE
  # echo $1 | tr "[:upper:]" "[:lower:]"

  # Clear all options before returning
  fabMenuClearOptions $I
  # =============================================================
}

function fabMenuLine {
  # =============================================================
  # fabMenuLine XX:
  # Draw a line of XX characters wide
  # =============================================================
  local I
  for ((I=1; I<=$1; I++)); do
    echo -n "-"
  done
  echo
}

function fabMenuClearOptions {
  # =============================================================
  # fabMenuClearOptions:
  # Empty the list of menu options
  # =============================================================
  local I=1
  if [ -z "$1" ]; then
    local J=9
  else
    local J=$1  
  fi

  for I in {1..10}; do
    fmOPTION[$I]=""
  done
}

function fabMenuQuit {
  # =============================================================
  # fabMenuQuit:
  # Exit the program
  # =============================================================
  clear
  tput cup 1 0      # Move cursor to screen location X,Y (top left is 0,0)
  fabMenuLine $fmWIDTH # ----
  echo "$fmBANNER"
  fabMenuLine $fmWIDTH # ----
  echo "Bye! :)"
  fabMenuLine $fmWIDTH # ----
  echo 
  echo
  exit
}