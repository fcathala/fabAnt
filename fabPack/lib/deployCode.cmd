:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (6) Deploy components on target
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  Md metadata\archive\%TimeStamp%-deployCode

  Call ant deployCode -buildfile "lib\fabPack.xml" -propertyfile "lib\org.up.properties" -l "metadata\temp\log.txt"
 
  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-deployCode /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Choice /N /M "Are you ready to go back to the main screen? (Y/N)"
