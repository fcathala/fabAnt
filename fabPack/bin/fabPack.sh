#!/bin/bash
# ===============================================================
#	fabPack-Mac: Salesforce Packaging Utility for MacOS
#
#	 fabPack lets you download packages from one Salesforce org
#	 and upload it into another one. It also helps you capture
#	 metadata and build-up a library.
#	 It's a Salesforce Migration Toolkit wrapper, so you need
#	 the Java and Ant stacks as well as the force.com migration
#  toolkit installed before using it.
#  Once installed, things will get easy.
#
#	 fabPack saves time and reduces risk of manual mistakes.
#
# © Fabrice Cathala - February 2018
#	Version: 1.1
#
# ===============================================================

# ===============================================================
# One-off config setup
# ===============================================================
INSTALL=~/fabPack  # Runtime files
# ===============================================================

source "$INSTALL/system/main.sh"

# ===============================================================
