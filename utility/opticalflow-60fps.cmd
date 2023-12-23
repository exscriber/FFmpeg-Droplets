@echo off
path=%~dp0..\bin\;%path%

set params=-c:v hap -format hap -an -vf minterpolate=fps=60:mi_mode=mci:mc_mode=aobmc:vsbmc=1

for %%F in (%*) do (
    ffmpeg -i %%F %params% -y "%%~nF_flow.mov" 
)
pause
