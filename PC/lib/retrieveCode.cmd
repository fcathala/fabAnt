:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabPack - (3) Download components from manifest
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata Md metadata
  If Not Exist metadata\archive Md metadata\archive
  Md metadata\archive\%TimeStamp%-retrieveCode
  If Not Exist metadata\temp Md metadata\temp
  If Not Exist metadata\temp\package.xml Goto ErrorMissingFile

  Call ant retrieveCode -buildfile "lib\fabPack.xml" -propertyfile "lib\org.down.properties" -l "metadata\temp\log.txt"

  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-retrieveCode /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Rem End of function
  Pause

Goto End

:ErrorMissingFile

  Echo.
  Echo  ERROR: No manifest file in the temp folder...
  Echo.
  Echo ----------------------------------------------------------
  Echo.
  Pause

:End
