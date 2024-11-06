#!/bin/zsh
random_num=$(shuf -i 1-3 -n 1)
typeset -a array
array=("play ~/.kuru/audios/kuru1.mp3 -q -t alsa &" "play ~/.kuru/audios/kuru2.mp3 -q -t alsa &" "play ~/.kuru/audios/kuru3.mp3 -q -t alsa &")
eval $array[$random_num]
