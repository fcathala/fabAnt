:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (3) Download components from manifest
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata\temp\package.xml Goto ErrorMissingManifest
  Md metadata\archive\%TimeStamp%-retrieveCode

  Call ant retrieveCode -buildfile "lib\fabPack.xml" -propertyfile "lib\org.down.properties" -l "metadata\temp\log.txt"

  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-retrieveCode /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Choice /N /M "Are you ready to go back to the main screen? (Y/N)"

Goto End

:ErrorMissingManifest

  Echo.
  Echo  ERROR: No manifest file in the temp folder...
  Echo.
  Echo ----------------------------------------------------------
  Echo.

:End
