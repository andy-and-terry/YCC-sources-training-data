#!/usr/bin/env bash
# integer fixed-point (scale 1000) Mandelbrot
for ((y=-1000; y<=1000; y+=200)); do
  line=""
  for ((x=-2000; x<=600; x+=50)); do
    zr=0; zi=0; n=0
    while (( n < 30 && (zr*zr + zi*zi) / 1000 < 4000 )); do
      t=$(( (zr*zr - zi*zi)/1000 + x ))
      zi=$(( 2*zr*zi/1000 + y ))
      zr=$t; ((n++))
    done
    (( n == 30 )) && line+="#" || line+="."
  done
  echo "$line"
done
