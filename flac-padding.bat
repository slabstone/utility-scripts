@ECHO OFF

FOR /R %%i IN (*.flac) do (
ECHO Removing padding from "%%~ni.flac" ...
metaflac.exe --remove --block-type=PADDING --dont-use-padding "%%i"
if ERRORLEVEL 1 goto error

ECHO Adding 8192 bytes of padding ...
metaflac.exe --add-padding=8192 "%%i"
if ERRORLEVEL 1 goto error
)
ECHO.
goto end

:error
ECHO ERROR REDUCING PADDING FOR "%%~ni.flac" -- batch process stopped
PAUSE

:end
EXIT
