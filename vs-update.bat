@echo off
if [%1]==[] (
  echo args: ^<install-path^>
  exit /b 1
)

vs_enterprise.exe update --quiet --wait --norestart --installPath %1
echo install result: %errorlevel%
