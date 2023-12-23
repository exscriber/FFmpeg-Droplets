@echo off
path=%~dp0..\bin\;%path%

set params=-c:a pcm_s16le -ar 48000

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "%%~nF_wav.wav" 
)
pause
