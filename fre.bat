@ECHO OFF

FOR /R %%i IN (*.flac) do (
ECHO Removing padding from "%%~ni.flac" ...
metaflac.exe --remove --block-type=PADDING --dont-use-padding "%%i"
if ERRORLEVEL 1 goto error

ECHO Adding 8192 bytes of padding ...
metaflac.exe --add-padding=8192 "%%i"
if ERRORLEVEL 1 goto error

ECHO Transcoding "%%~ni.flac" ...
flac.exe -w -V --best "%%i" -f
if ERRORLEVEL 1 goto error
)
ECHO.
goto end

:errorm
ECHO ERROR REDUCING PADDING FOR "%%~ni.flac" -- batch process stopped
PAUSE
EXIT

:errorf
ECHO ERROR TRANSCODING "%%~ni.flac" -- batch process stopped
PAUSE
EXIT

:end
EXIT
