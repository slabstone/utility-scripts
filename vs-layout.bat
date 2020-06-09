@echo off
if [%1]==[] (
  echo args: ^<layout-path^>
  exit /b 1
)

vs_enterprise.exe --layout %1 --lang en-US
echo install result: %errorlevel%
