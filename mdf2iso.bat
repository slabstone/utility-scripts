@echo off
for %%i in (*.mdf) do (
echo Converting "%%~ni.mdf" ...
iat.exe -i "%%~ni.mdf" -o "%%~ni.iso" --iso
if ERRORLEVEL 1 goto error
echo -- Done
echo.
)
echo.
echo -- Converted successfully.
goto end
:error
echo.
echo ---- ERROR ---- batch process stopped
:end
echo.
pause
exit
