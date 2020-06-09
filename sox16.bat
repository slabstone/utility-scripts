rem sox input.flac -b 16 output.flac rate -v -L 44100 dither

mkdir converted
FOR %%A IN (*.flac) DO sox.exe "%%A" -b 16 "converted/%%~nxA" rate -v -L 44100 dither
pause
