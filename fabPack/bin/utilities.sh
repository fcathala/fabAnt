#!/bin/bash
#
# ===============================================================
# Utilities: this file contains functions used by fabPack.sh
#	Version: 1.0
# ===============================================================

function funcLower {
  echo $1 | tr "[:upper:]" "[:lower:]" 
}


function funcInstall {
  # ===============================================================
  # Build the folders scafolding (if need be)
  # ===============================================================
  if [ ! -d "$ARCHIVES" ]; then
    mkdir "$ARCHIVES"
  fi
  if [ ! -d "$FILES" ]; then
    mkdir "$FILES"
  fi
  if [ ! -d "$FILES/delete" ]; then
    mkdir "$FILES/delete"
  fi
  if [ ! -d "$FILES/retrieve" ]; then
    mkdir "$FILES/retrieve"
  fi
  if [ ! -d "$FILES/src" ]; then
    mkdir "$FILES/src"
  fi
  if [ ! -d "$FILES/logs" ]; then
    mkdir "$FILES/logs"
  fi
  if [ ! -d "$SETTINGS" ]; then
    mkdir "$SETTINGS"
    cp "$INSTALL/system/setup/orgs.sh" $SETTINGS
    cp "$INSTALL/system/setup/packages.sh" $SETTINGS
  fi
  if [ ! -d "$PROJECT/vcs" ]; then
    mkdir "$PROJECT/vcs"
  fi
  # =============================================================
}


function funcBuild {
  ant -buildfile "$INSTALL/system" $ACTION -Dtoolkit="$TOOLKIT" -Dmdt="$MDT" -Dsrc="$SRC" -Dsf.usr=$USR -Dsf.psw=$PSW -Dsf.url=$URL -l "$FILES/logs/$TIMESTAMP-$ACTION.log"
  less "$FILES/logs/$TIMESTAMP-$ACTION.log"
}
