@echo off
path=%~dp0..\bin\;%path%

set params=-c:v hap -format hap -c:a pcm_s16le -ar 44100
:: set filter=scale=force_original_aspect_ratio=increase:force_divisible_by=4
:: set filter=scale=force_original_aspect_ratio=decrease:force_divisible_by=4
:: set filter=pad=ceil(iw/4)*4:ceil(ih/4)*4:(ow-iw)/2:(oh-ih)/2
set filter=crop=floor(iw/4)*4:floor(ih/4)*4:(ow-iw)/2:(oh-ih)/2

mkdir !enc

for %%F in (%*) do (
    ffmpeg -i %%F %params% -vf %filter% -y "!enc/%%~nF_hap.mov" 
)
pause
