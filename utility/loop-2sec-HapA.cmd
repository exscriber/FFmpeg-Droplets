@echo off
set PSScript=%~dp0/loop.ps1

set params=-c:v hap -format hap_alpha -an

for %%F in (%*) do (
    powershell.exe -ExecutionPolicy RemoteSigned -File "%PSScript%" %%F -fade 2
)
pause
