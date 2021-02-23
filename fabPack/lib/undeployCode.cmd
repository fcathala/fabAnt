:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (7) Delete components on target
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata\temp\package.xml Goto ErrorMissingManifest
  If Not Exist metadata\temp\destructiveChanges.xml Goto ErrorMissingManifest
  Md metadata\archive\%TimeStamp%-undeployCode
  
  Rem Call ant undeployCode -buildfile "lib\fabPack.xml" -propertyfile "lib\org.up.properties" -l "metadata\temp\log.txt"
 
  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-undeployCode /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Choice /N /M "Are you ready to go back to the main screen? (Y/N)"

Goto End

:ErrorMissingManifest

  Echo.
  Echo  ERROR: No pair destructiveChanges.xml + package.xml
  Echo         in the temp folder...
  Echo.
  Echo ----------------------------------------------------------
  Echo.

:End