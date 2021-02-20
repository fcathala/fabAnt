Echo OFF
Rem ===============================================================
Rem fabPack_PC: Salesforce Packaging Utility for Windows
Rem
Rem fabPack lets you download packages from one Salesforce org
Rem and upload it into another one. It also helps you capture
Rem metadata and build-up a library. It's a Salesforce Migration
Rem Toolkit wrapper, so you need the Java and Ant stacks as well as
Rem the force.com migration toolkit installed before using it.
Rem Once installed, then things will get easy.
Rem fabPack saves time and reduces risk of manual mistakes.
Rem
Rem © Fabrice Cathala - February 2021
Rem	Version: 2.0
Rem
Rem ===============================================================

Rem ===============================================================
Rem Variables
Rem ===============================================================
Set ToolKit="salesforce_ant_50.0"

Rem ===============================================================

Rem
TOOLKIT

:Menu
    Cls
    Echo.
    Echo -------------------------------------
    Echo fabPack    
    Echo -------------------------------------    
    Echo.
    Echo (1) Check installation
    Echo (2) Retrieve all supported metadata types
    Echo (3) Download components from manifest
    Echo (4) Download components from package
    Echo (5) Validate components on target
    Echo (6) Create components on target
    Echo (7) Delete components on target
    Echo.
    Echo -------------------------------------    
    Echo.

    Choice /C:123456 /N /M "Please, type the selection number from 1 to 6."

    If ErrorLevel ==7 Goto 7
    If ErrorLevel ==6 Goto 6
    If ErrorLevel ==5 Goto 5
    If ErrorLevel ==4 Goto 4
    If ErrorLevel ==3 Goto 3
    If ErrorLevel ==2 Goto 2
    If ErrorLevel ==1 Goto 1
Goto Menu

  ant

    $ACTION

    -buildfile "$INSTALL/system"
    -Dtoolkit=%ToolKit%
    -Dmdt="$MDT"
    -Dsrc="$SRC"
    -Dsf.usr=$USR
    -Dsf.psw=$PSW
    -Dsf.url=$URL
    -l "$FILES/logs/$TIMESTAMP-$ACTION.log"



      ACTION="deploy"
      SRC="$FILES/src"
      MDT="N/A"
      TOOLKIT=$INSTALL/$VER

      ACTION="delete"


Echo %Date%_(%Time%)
Type "$FILES/logs/$TIMESTAMP-$ACTION.log"


:1
    Call lib\testInstallation.cmd
Goto Menu
:2
    Call lib\describeMetadata.cmd
Goto Menu
:3
    Call lib\retrieveCode.cmd 
Goto Menu
:4
    Call lib\retrievePkg.cmd
Goto Menu
:5
    Call lib\deployCodeCheckOnly.cmd
Goto Menu
:6
    Call lib\deployCode.cmd
Goto Menu  
:7
    Call lib\undeployCode.cmd
Goto Menu  

Rem ===============================================================
