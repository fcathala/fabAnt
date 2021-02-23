:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (2) Retrieve all supported metadata types    
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  Rd metadata\temp /S /Q
  Md metadata\temp
  Md metadata\archive\%TimeStamp%-describeMetadata

  Call ant describeMetadata -buildfile "lib\fabPack.xml" -propertyfile "lib\org.down.properties" -l "metadata\temp\log.txt"

  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-describeMetadata /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Rem End of function
  Pause
