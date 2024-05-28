@echo off
path=%~dp0..\bin\;%path%

set params=-c:a pcm_s16le -ar 44100

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "%%~nF_44.wav" 
)
pause
