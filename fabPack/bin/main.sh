#!/bin/bash
# read -p "Press [Enter] key to continue..."
# ===============================================================
#	fabPack-Mac: Salesforce Packaging Utility for MacOS
#
#	 fabPack lets you download packages from one Salesforce org
#	 and upload it into another one. It also helps you capture
#	 metadata and build-up a library.
#	 It's a Salesforce Migration Toolkit wrapper, so you need
#	 the Java and Ant stacks as well as the force.com migration
#  toolkit installed before using it.
#  Once installed, then things will get easy.
#	 fabPack saves time and reduces risk of manual mistakes.
#
# © Fabrice Cathala - May 2018
#	Version: 2.0
#
# ===============================================================

# ===============================================================
# Initialisation
# ===============================================================
# System Init
source "$INSTALL/system/fabMenu/fabMenu.sh"   # Menu UI library
source "$INSTALL/system/menu.sh"              # Menu options
source "$INSTALL/system/utilities.sh"         # Various functions
source "$INSTALL/system/versions.sh"          # Last 2 API versions

# Project Init
# - Paths
cd .. ; PROJECT="$(pwd)" ; cd "$PROJECT/fabPack"  # Project root folder
  FILES="$PROJECT/fabPack/files"                  # Manifests and packages
  ARCHIVES="$PROJECT/fabPack/archives"            # Previous retrieves and log files
  SETTINGS="$PROJECT/fabPack/settings"            # Project configuration files
  DOWNLOAD="$HOME/Temp"                           # Browser download folder (use $HOME rather than ~)
# - Variables
source "$SETTINGS/orgs.sh"            # Orgs names and credentials
source "$SETTINGS/packages.sh"        # Package names
# - Folders
funcInstall                           # Build the folders scafolding if need be
# ===============================================================

# ===============================================================
# Menu
# ===============================================================
fmBANNER="fabPack-Mac - Salesforce Packaging Utility for MacOS"
fmWIDTH=56

while [ true ]; do
  funcMain
done

# ===============================================================

