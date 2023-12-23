@echo off
path=%~dp0..\bin\;%path%

set params=-c:v hap -format hap -an -vf reverse

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "%%~nF_reverse.mov" 
)
pause
