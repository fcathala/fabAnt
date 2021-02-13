#!/bin/bash
#
# ===============================================================
# Menu.sh: Menu and navigation functions used by fabPack.sh
#	Version: 1.0
# ===============================================================

function funcMain {
  # 1. Set UI variables
  fmOPTION[1]="Retrieve"
  fmOPTION[2]="Validate"
  fmOPTION[3]="Deploy"
  fmOPTION[4]="Git"
  fmBREADCRUMB="}"
  fmREQUEST="Please select an option..." 
  fmPROMPT="Enter your choice: "

  # 2. Display menu options and retrieve the user's choice
  fabMenu

  # 3. Process user's choice
  case $fmCHOICE in
    1)
      fmBREADCRUMB=$fmBREADCRUMB" Retrieve }"
      funcRetrieve

      # Archive resulting files
      mkdir "$ARCHIVES/$TIMESTAMP-$ACTION"
      cp -r "$FILES/src" "$ARCHIVES/$TIMESTAMP-$ACTION/src"
      cp -r "$FILES/logs/$TIMESTAMP-$ACTION.log" "$ARCHIVES/$TIMESTAMP-$ACTION/log.txt"
      ;;
    2)
      fmBREADCRUMB=$fmBREADCRUMB" Validate }"
      funcValidate

      # Archive resulting files
      mkdir "$ARCHIVES/$TIMESTAMP-$ACTION"
      cp -r "$FILES/logs/$TIMESTAMP-$ACTION.log" "$ARCHIVES/$TIMESTAMP-$ACTION/log.txt"
      ;;
    3)
      fmBREADCRUMB=$fmBREADCRUMB" Deploy }"
      funcDeploy

      # Archive resulting files
      mkdir "$ARCHIVES/$TIMESTAMP-$ACTION"
      cp -r "$FILES/logs/$TIMESTAMP-$ACTION.log" "$ARCHIVES/$TIMESTAMP-$ACTION/log.txt"
      ;;
    4)
      fmBREADCRUMB=$fmBREADCRUMB" Version Control }"
      funcVCS
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcRetrieve {
  # 1. Set UI variables
  if [ -z "$1" ]; then
    fmOPTION[1]="Pull the Manifest"
    fmOPTION[2]="Retrieve the Manifest"
    fmOPTION[3]="Retrieve a Package"
    fmREQUEST="Please select an option..."
    fmPROMPT="Enter your choice: "
    # 2.a. Display menu options and retrieve the user's choice
    fabMenu
  else
    # 2.b. Force choice from command line
    $fmCHOICE=$1
  fi

  # 3. Process user's choice
  case $fmCHOICE in
    1)
      # Copy manifest file from browser download folder to fabPack environment

      # If there's a new manifest in the download folder
      if [ -f "$DOWNLOAD/package.xml" ]; then
        if [ -f "$FILES/retrieve/package.xml" ]; then
          rm "$FILES/retrieve/package.xml"
        fi
        cp "$DOWNLOAD/package.xml" "$FILES/retrieve/package.xml"
        
        if [ -f "$FILES/retrieve/package.xml" ]; then
          rm "$DOWNLOAD/package.xml"
        fi
      fi
      ;;
    2)
      fmBREADCRUMB=$fmBREADCRUMB" Manifest }"

      funcSelectOrg 
      fmBREADCRUMB=$fmBREADCRUMB" $ORG }"

      funcSelectAPI
      fmBREADCRUMB=$fmBREADCRUMB" $VER }"

      ACTION="retrieveXML"
      SRC="$FILES/src"
      MDT="$FILES/retrieve/package.xml"
      TOOLKIT=$INSTALL/$VER
      funcConfirm

      funcBuild
      ;;
    3)
      fmBREADCRUMB=$fmBREADCRUMB" Package"

      funcSelectPKG
      fmBREADCRUMB=$fmBREADCRUMB" ($PKG) }"

      funcSelectOrg 
      fmBREADCRUMB=$fmBREADCRUMB" $ORG }"

      funcSelectAPI
      fmBREADCRUMB=$fmBREADCRUMB" $VER }"

      ACTION="retrievePKG"
      SRC="$FILES/src"
      MDT=$PKG
      TOOLKIT=$INSTALL/$VER
      funcConfirm

      funcBuild
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcValidate {
  MAIN=Upload

  # 1. Set UI variables
  if [ -z "$1" ]; then
    fmOPTION[1]="Validate the local package"
    fmOPTION[2]="Validate the local package AND run local tests"
    fmREQUEST="Please select an option..."
    fmPROMPT="Enter your choice: "
    # 2.a. Display menu options and retrieve the user's choice
    fabMenu
  else
    # 2.b. Force choice from command line
    $fmCHOICE=$1
  fi

  # 3. Process user's choice
  case $fmCHOICE in
    1)
      fmBREADCRUMB=$fmBREADCRUMB" No test }"

      funcSelectOrg 
      fmBREADCRUMB=$fmBREADCRUMB" $ORG }"

      funcSelectAPI
      fmBREADCRUMB=$fmBREADCRUMB" $VER }"

      ACTION="validate"
      SRC="$FILES/src"
      MDT="N/A"
      TOOLKIT=$INSTALL/$VER
      funcConfirm

      funcBuild
      ;;
    2)
      fmBREADCRUMB=$fmBREADCRUMB" Run local tests }"

      funcSelectOrg 
      fmBREADCRUMB=$fmBREADCRUMB" $ORG }"

      funcSelectAPI
      fmBREADCRUMB=$fmBREADCRUMB" $VER }"

      ACTION="validateTest"
      SRC="$FILES/src"
      MDT="N/A"
      TOOLKIT=$INSTALL/$VER
      funcConfirm

      funcBuild
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcDeploy {
  MAIN=Upload

  # 1. Set UI variables
  if [ -z "$1" ]; then
    fmOPTION[1]="Deploy the local package"
    fmOPTION[2]="Delete the metadata described in the manifest"
    fmREQUEST="Please select an option..."
    fmPROMPT="Enter your choice: "
    # 2.a. Display menu options and retrieve the user's choice
    fabMenu
  else
    # 2.b. Force choice from command line
    $fmCHOICE=$1
  fi

  # 3. Process user's choice
  case $fmCHOICE in
    1)
      # fmBREADCRUMB=$fmBREADCRUMB" Deploy }"

      funcSelectOrg 
      fmBREADCRUMB=$fmBREADCRUMB" $ORG }"

      funcSelectAPI
      fmBREADCRUMB=$fmBREADCRUMB" $VER }"

      ACTION="deploy"
      SRC="$FILES/src"
      MDT="N/A"
      TOOLKIT=$INSTALL/$VER
      funcConfirm

      funcBuild
      ;;
    2)
      fmBREADCRUMB=$fmBREADCRUMB" Delete }"

      funcSelectOrg 
      fmBREADCRUMB=$fmBREADCRUMB" $ORG }"

      funcSelectAPI
      fmBREADCRUMB=$fmBREADCRUMB" $VER }"

      ACTION="delete"
      SRC="$FILES/delete"
      MDT="N/A"
      TOOLKIT=$INSTALL/$VER
      funcConfirm

      funcBuild
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcVCS {
  # 1. Set UI variables
  if [ -z "$1" ]; then
    fmREQUEST="Please select an option..."
    fmOPTION[1]="Commit to Git"
    fmOPTION[2]="Push to Remote"
    fmPROMPT="Enter your choice: "
    # 2.a. Display menu options and retrieve the user's choice
    fabMenu
  else
    # 2.b. Force choice from command line
    $fmCHOICE=$1
  fi

  # 3. Process user's choice
  case $fmCHOICE in
    1)
      fmBREADCRUMB=$fmBREADCRUMB" Commit to Git }"

      funcConfirm

      if [ -d "$PROJECT/vcs/src" ]; then
          rm -r "$PROJECT/vcs/src"
      fi

      mkdir "$PROJECT/vcs/src"
      cp -r "$FILES/src" "$PROJECT/vcs/"

      cd "$PROJECT/vcs"
      git add .

      # devnote: Fix Message and Time Stamp      
      MESSAGE="Deployment $TIMESTAMP" 
      git commit -m "Deployment $TIMESTAMP"
      cd "$PROJECT/fabPack"

      # Devnotes
      # less "$FILES/logs/$TIMESTAMP-commit.log"
      # https://stackoverflow.com/questions/10063407/git-log-output-log-file
      read
      ;;
    2)
      # The following command must be ran without firewall constraints
      fmBREADCRUMB=$fmBREADCRUMB" Push to Remote }"

      funcConfirm

      cd "$PROJECT/vcs"
      git push -u origin Branch1
      cd "$PROJECT/fabPack"

      # Devnotes
      # less "$FILES/logs/$TIMESTAMP-push.log"
      read
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcSelectOrg {
  # 1. Set UI variables
  if [ -z "$1" ]; then
    fmREQUEST="Please select an org..." 
    I=1; while [ -n "${ORG[$I]}" ]
    do
      fmOPTION[$I]=${ORG[$I]}
      I=$(($I+1))
    done
    fmPROMPT="Enter your choice: "
    # 2.a. Display menu options and retrieve the user's choice
    fabMenu
  else
    # 2.b. Force choice from command line
    $fmCHOICE=$1
  fi

  # 3. Process user's choice
  case $fmCHOICE in
    [1-9])
      ORG=${ORG[$fmCHOICE]}
      URL=${URL[$fmCHOICE]}
      USR=${USR[$fmCHOICE]}
      PSW=${PSW[$fmCHOICE]}
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcSelectAPI {
  # 1. Set UI variables
  if [ -z "$1" ]; then
    fmREQUEST="Please select a version of the API..." 
    I=1; while [ -n "${VER[$I]}" ]
    do
      fmOPTION[$I]=${VER[$I]}
      I=$(($I+1))
    done
    fmPROMPT="Enter your choice: "
    # 2.a. Display menu options and retrieve the user's choice
    fabMenu
  else
    # 2.b. Force choice from command line
    $fmCHOICE=$1
  fi

  # 3. Process user's choice  
  case $fmCHOICE in
    [1-9])
      VER=${VER[$fmCHOICE]}
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcSelectPKG {
  # 1. Set UI variables
  if [ -z "$1" ]; then
    fmREQUEST="Please select a package or change set..." 
    I=1; while [ -n "${PKG[$I]}" ]
    do
      fmOPTION[$I]=${PKG[$I]}
      I=$(($I+1))
    done
    fmPROMPT="Enter your choice: "
    # 2.a. Display menu options and retrieve the user's choice
    fabMenu
  else
    # 2.b. Force choice from command line
    $fmCHOICE=$1
  fi

  # 3. Process user's choice  
  case $fmCHOICE in
    [1-9])
      PKG=${PKG[$fmCHOICE]}
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}

function funcConfirm {
  # 1. Set UI variables
  fmREQUEST="Are you sure (Y)?" 
  fmPROMPT="Enter your choice: "
  # 2. Display menu options and retrieve the user's choice
  fabMenu
  # 3. Process user's choice
  case $fmCHOICE in
    y)
      TIMESTAMP=$(date "+%Y%m%d-%H%M%S")    # We're in!
      ;;
    *)
      fabMenuQuit
      ;;
  esac
}
