@echo off
path=%~dp0..\bin\;%path%

set params=-c:v prores -profile:v 1 -c:a pcm_s16le -ar 48000

mkdir !enc

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "!enc/%%~nF_lt.mov" 
)
pause
