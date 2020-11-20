#!/bin/bash

i="1"
while [ $i -lt $[$1+1] ]
do
  julia -t $i benchmark.jl $2 > results/res.$2.$i.csv
  julia -t $i benchmark2.jl $2 > results/res2.$2.$i.csv
  i=$[$i+1]
done
