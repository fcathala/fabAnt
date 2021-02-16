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
Rem One-off config setup
Rem ===============================================================
Rem INSTALL=~/Lab/Private/fabPack/fabPack
Rem RemINSTALL=~/fabPack
Rem ===============================================================

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

:7
    Call bin\DeleteComponents.cmd
Goto Menu  
:6
    Call bin\CreateComponents.cmd
Goto Menu  
:5
    Call bin\ValidateComponents.cmd
Goto Menu
:4
    Call bin\DownloadPackage.cmd
Goto Menu
:3
    Call bin\DownloadManifest.cmd
Goto Menu
:2
    Rem
Goto Menu
:1
    Call bin\CheckInstallation.cmd
Goto Menu

Rem ===============================================================
