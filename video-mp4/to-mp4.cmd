@echo off
path=%~dp0..\bin\;%path%

set params=

:: mkdir !enc

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "%%~nF.mp4" 
)
pause
