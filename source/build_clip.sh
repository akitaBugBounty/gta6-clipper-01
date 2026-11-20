#!/bin/bash
set -e
cd ~/workspace/makefun/gta6-clipper-01
FONT=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf
ffmpeg -y -v error -i gta6-trailer2.mp4 -i narration.mp3 -filter_complex "\
[0:v]trim=start=110:end=117,setpts=PTS-STARTPTS[v1];\
[0:v]trim=start=124:end=131,setpts=PTS-STARTPTS[v2];\
[0:v]trim=start=138:end=145,setpts=PTS-STARTPTS[v3];\
[0:v]trim=start=145:end=152,setpts=PTS-STARTPTS[v4];\
[0:v]trim=start=154:end=166,setpts=PTS-STARTPTS[v5];\
[v1][v2][v3][v4][v5]concat=n=5:v=1:a=0,crop=608:1080:(in_w-608)/2:0,scale=1080:1920,fps=30,\
drawtext=fontfile=$FONT:textfile=hook.txt:fontsize=96:fontcolor=yellow:borderw=4:bordercolor=black:x=(w-text_w)/2:y=180:enable='between(t,0,3.5)',\
drawtext=fontfile=$FONT:textfile=pitch1.txt:fontsize=60:fontcolor=white:box=1:boxcolor=black@0.65:boxborderw=24:x=(w-text_w)/2:y=640:enable='between(t,28.5,40)',\
drawtext=fontfile=$FONT:textfile=pitch2.txt:fontsize=60:fontcolor=white:box=1:boxcolor=black@0.65:boxborderw=24:x=(w-text_w)/2:y=760:enable='between(t,28.5,40)',\
drawtext=fontfile=$FONT:textfile=pitch3.txt:fontsize=60:fontcolor=yellow:box=1:boxcolor=black@0.65:boxborderw=24:x=(w-text_w)/2:y=880:enable='between(t,28.5,40)'[vout];\
[0:a]atrim=start=110:end=117,asetpts=PTS-STARTPTS[a1];\
[0:a]atrim=start=124:end=131,asetpts=PTS-STARTPTS[a2];\
[0:a]atrim=start=138:end=145,asetpts=PTS-STARTPTS[a3];\
[0:a]atrim=start=145:end=152,asetpts=PTS-STARTPTS[a4];\
[0:a]atrim=start=154:end=166,asetpts=PTS-STARTPTS[a5];\
[a1][a2][a3][a4][a5]concat=n=5:v=0:a=1,volume=0.25:enable='between(t,28,40)'[atrailer];\
[1:a]adelay=28000|28000,apad[anarr];\
[atrailer][anarr]amix=inputs=2:duration=first:dropout_transition=0[aout]" \
-map "[vout]" -map "[aout]" -c:v libx264 -preset medium -crf 20 -pix_fmt yuv420p -c:a aac -b:a 160k -movflags +faststart clip.mp4
echo BUILD_DONE
ffprobe -v error -show_entries stream=width,height,duration,codec_name -show_entries format=duration,size -of default=noprint_wrappers=1 clip.mp4
