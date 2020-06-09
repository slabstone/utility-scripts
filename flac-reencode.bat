@ECHO OFF

FOR /R %%i IN (*.flac) do (
ECHO Transcoding "%%~ni.flac" ...
flac.exe -w -V --best "%%i" -f
if ERRORLEVEL 1 goto error
)
ECHO.
goto end

:error
ECHO ERROR TRANSCODING "%%~ni.flac" -- batch process stopped
PAUSE

:end
EXIT
