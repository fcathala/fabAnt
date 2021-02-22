:Main
    Cls
    Echo.
    Echo ------------------------------------------------------
    Echo  fabPack - (2) Retrieve all supported metadata types    
    Echo ------------------------------------------------------
    Echo.

    Md ..\metadata\archive\%TimeStamp%-describeMetadata
    Call ant describeMetadata -propertyfile "org.down.properties" -l "..\metadata\archive\%TimeStamp%-describeMetadata\log.txt"

    Echo.
    Echo ------------------------------------------------------
    Echo.

  Choice /N /M "Are you ready to go back to the main screen? (Y/N)"
