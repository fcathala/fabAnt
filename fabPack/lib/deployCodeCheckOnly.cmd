:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (5) Validate components on target
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata\temp\package.xml Goto ErrorMissingManifest
  Md metadata\archive\%TimeStamp%-deployCodeCheckOnly

  Call ant deployCodeCheckOnly -buildfile "lib\fabPack.xml" -propertyfile "lib\org.up.properties" -l "metadata\temp\log.txt"
 
  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-deployCodeCheckOnly /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Choice /N /M "Are you ready to go back to the main screen? (Y/N)"

Goto End

:ErrorMissingManifest

  Echo.
  Echo  ERROR: No package.xml file in the temp folder...
  Echo.
  Echo ----------------------------------------------------------
  Echo.

:End