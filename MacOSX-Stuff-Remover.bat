@echo off

TITLE MacOSX Stuff Remover

ECHO #######################
ECHO # Script by MasihTak  #
ECHO #######################
ECHO.

SET dirname=__MACOSX
SET directorytosearch=%cd%
SET found=false

REM Deletes .DS_Store files from all sub folders
del ".DS_Store" /S

    if NOT "%1%" == "" (
        set directorytosearch=%1%
    )
    echo Searching for %dirname% in %directorytosearch%

    for /d %%i in (%directory%*) do (
        IF EXIST %%i\%dirname% (
            REM changes the sentinel value
            set found=true

            echo Deleting the folder %%i\%dirname%

            REM Deletes a folder, even if not empty, and don't prompt for confirmation
            RD  /s /q %%i\%dirname%
        )
        REM Deletes folder in root
        IF %%i == %dirname% (
            REM changes the sentinel value
            set found=true

            REM Deletes a folder, even if not empty, and don't prompt for confirmation
            echo Deleting the folder %%i\%dirname%
            RD  /s /q %%i
        )
    )

    REM logic to do if no files were found
    if NOT "%found%" == "true" (
        echo No directories were found with the name of %dirname%
    )


PAUSE
