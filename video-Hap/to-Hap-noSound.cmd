@echo off
path=%~dp0..\bin\;%path%

set params=-c:v hap -format hap -an

mkdir !enc

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "!enc/%%~nF_hap.mov" 
)
pause
