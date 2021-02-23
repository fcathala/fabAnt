:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (4) Download components from package
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata Md metadata
  If Not Exist metadata\archive Md metadata\archive
  Md metadata\archive\%TimeStamp%-retrievePkg
  Rd metadata\temp /S /Q
  If Not Exist metadata\temp Md metadata\temp

  Call ant retrievePkg -buildfile "lib\fabPack.xml" -propertyfile "lib\org.down.properties" -l "metadata\temp\log.txt"

  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-retrievePkg /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.
  
  Rem End of function
  Pause
