#!/bin/zsh

# params=(-c:v hap -format hap -c:a pcm_s16le -ar 44100)
params=(-c:v prores -profile:v 2 -c:a pcm_s16le -ar 48000)
# filter="scale=force_original_aspect_ratio=decrease:force_divisible_by=4"
# filter="scale=force_original_aspect_ratio=increase:force_divisible_by=4"
# filter="pad=ceil(iw/4)*4:ceil(ih/4)*4:(ow-iw):(oh-ih)/2"
filter="crop=floor(iw/4)*4:floor(ih/4)*4:(ow-iw):(oh-ih)/2"

for f in "$@"
do
	dir=${f:h}
	name=${f:t:r}
	ext=${f:e}
	echo $dir, $name, $ext

	# res=($(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 -i $f))
	# width=${res[1]}
	# height=${res[2]}
	
	# echo "${width}x${height}"

	ffmpeg -i $f $params -vf $filter -y "${name}_fixRes.mov"
done