:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (4) Download components from package
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  Rd metadata\temp /S /Q
  Md metadata\temp
  Md metadata\archive\%TimeStamp%-retrievePkg

  Call ant retrievePkg -buildfile "lib\fabPack.xml" -propertyfile "lib\org.down.properties" -l "metadata\temp\log.txt"

  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-retrievePkg /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Choice /N /M "Are you ready to go back to the main screen? (Y/N)"
