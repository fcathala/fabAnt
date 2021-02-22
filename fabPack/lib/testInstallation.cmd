:Main
    Cls
    Echo.
    Echo ---------------------------------------------------------
    Echo  fabPack - (1) Check installation    
    Echo ---------------------------------------------------------
    Echo.
    git --version
    Echo.
    Echo ---------------------------------------------------------
    Call ant -version
    Echo.
    Echo ---------------------------------------------------------
    java -version
    Echo.
    Echo ---------------------------------------------------------
    Echo Ant_Home:  %Ant_Home%
    Echo.
    Echo ---------------------------------------------------------
    Echo Path:      %Path%
    Echo.
    Echo ---------------------------------------------------------
    Echo PathExt:   %PATHEXT%
    Echo.
    Echo ---------------------------------------------------------
    Echo.

  Choice /N /M "Are you ready to go back to the main screen? (Y/N)"

