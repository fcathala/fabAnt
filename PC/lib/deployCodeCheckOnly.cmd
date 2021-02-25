:Main
  Cls
  Echo.
  Echo ----------------------------------------------------------
  Echo  fabAnt - (5) Validate components on target
  Echo ----------------------------------------------------------
  Echo.

  Rem All folders operations
  If Not Exist metadata Md metadata
  If Not Exist metadata\archive Md metadata\archive
  Md metadata\archive\%TimeStamp%-deployCodeCheckOnly
  If Not Exist metadata\temp Md metadata\temp
  If Not Exist metadata\temp\package.xml Goto ErrorMissingFile

  Call ant deployCodeCheckOnly -buildfile "lib\fabAnt.xml" -propertyfile "lib\org.up.properties" -l "metadata\temp\log.txt"
 
  Rem Keep a copy of the result
  XCopy metadata\temp\*.* metadata\archive\%TimeStamp%-deployCodeCheckOnly /S /Y

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
  Echo  ERROR: No package.xml file in the temp folder...
  Echo.
  Echo ----------------------------------------------------------
  Echo.
  Pause

:End