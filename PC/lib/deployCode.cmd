:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (6) Deploy components on target
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata Md metadata
  If Not Exist metadata\archive Md metadata\archive
  Md metadata\archive\%TimeStamp%-deployCode
  If Not Exist metadata\temp Md metadata\temp
  If Not Exist metadata\temp\package.xml Goto ErrorMissingFile

  Call ant deployCode -buildfile "lib\fabPack.xml" -propertyfile "lib\org.up.properties" -l "metadata\temp\log.txt"
 
  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-deployCode /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Rem End of function
  Pause
