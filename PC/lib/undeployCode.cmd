:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabAnt - (7) Delete components on target
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata Md metadata
  If Not Exist metadata\archive Md metadata\archive
  Md metadata\archive\%TimeStamp%-undeployCode
  If Not Exist metadata\temp Md metadata\temp
  If Not Exist metadata\temp\package.xml Goto ErrorMissingFiles
  If Not Exist metadata\temp\destructiveChanges.xml Goto ErrorMissingFiles

  Call ant undeployCode -buildfile "lib\fabAnt.xml" -propertyfile "lib\org.up.properties" -l "metadata\temp\log.txt"
 
  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-undeployCode /S /Y

  Rem Display the log file
  Type metadata\temp\log.txt

  Echo.
  Echo ----------------------------------------------------------
  Echo.

  Rem End of function
  Pause

Goto End

:ErrorMissingFiles

  Echo.
  Echo  ERROR: No pair destructiveChanges.xml + package.xml
  Echo         in the temp folder...
  Echo.
  Echo ----------------------------------------------------------
  Echo.

:End