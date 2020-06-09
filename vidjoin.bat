ffmpeg.exe -i %1 -i %2 -map 0:0 -map 1:0 -c copy out.mp4
DEL %1 %2
