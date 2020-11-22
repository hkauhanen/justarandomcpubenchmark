#!/bin/bash

i="1"
while [ $i -lt $[$1+1] ]
do
  julia -t $i benchmark_10x.jl $2 > results/res_10x.$2.$i.csv
  i=$[$i+1]
done
