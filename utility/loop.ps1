param(
    [Parameter(Mandatory=$true)]
    [string]$Filename,
    [float]$fade = 1
)

$bin = Join-Path -path $PSScriptRoot -childpath ../bin/ -resolve
$env:path = "$bin;" + $env:path

$duration = ffprobe -v error -select_streams v:0 -show_entries stream=duration -of csv=p=0 -i $Filename
$length = $duration - $fade *2
$Outname = (Get-Item $Filename).Basename + '_loop.mov'

# -c:v hap -format hap -an
$params = $env:params.split()
$filter =
"[0]split[seg1][seg2];
[seg1]trim=duration=$fade,fade=d=$fade`:alpha=1,setpts=PTS+$length/TB[xfade];
[seg2]trim=$fade,setpts=PTS-STARTPTS[main];
[main][xfade]overlay;"

ffmpeg -i $Filename $params -vf $filter -y $Outname
