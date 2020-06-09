@echo off
if [%1]==[] (
  echo args: ^<install-path^>
  exit /b 1
)

vs_enterprise.exe --config "C:\.vsconfig" --installPath %1
echo vs_enterprise.exe result: %errorlevel%
echo config file: C:\.vsconfig
