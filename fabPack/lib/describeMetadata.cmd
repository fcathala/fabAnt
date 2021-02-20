:Main
    Cls
    Echo.
    Echo ------------------------------------------------------
    Echo fabPack - (2) Retrieve all supported metadata types    
    Echo ------------------------------------------------------
    Echo.

    ant describeMetadata -propertyfile "../org.down.properties" -l "..\metadata\%LaunchTime%-describeMetadata\log.txt"
Rem    ant describeMetadata -buildfile ".." -propertyfile "../org.down.properties" -l "..\metadata\%LaunchTime%-describeMetadata\log.txt"
    Rem -Dfp.time=%LaunchTime%

Pause
Rem -------------------------------------------------------------------------------------

    Type "..\metadata\%LaunchTime%-describeMetadata\log.txt"

    Echo.
    Echo ------------------------------------------------------
    Echo.
Pause
