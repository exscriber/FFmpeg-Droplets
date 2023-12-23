@echo off
path=%~dp0..\bin\;%path%

set params=-c:v hap -format hap_q -c:a pcm_s16le -ar 44100

mkdir !enc

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "!enc/%%~nF_hap-q.mov" 
)
pause
